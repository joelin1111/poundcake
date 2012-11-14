<?php
App::uses('AppController', 'Controller');
/**
 * Contacts Controller
 *
 * @property Contact $Contact
 */
class ContactsController extends AppController {

    var $helpers = array('MyHTML');
    
    function index($id = null) {
        
        $conditions = "";
        $first_name_arg = "";
        $last_name_arg = "";
        
        if (isset($this->passedArgs['Contact.first_name'])) {
            $first_name_arg = str_replace('*','%',$this->passedArgs['Contact.first_name']);
        }
        
        if (isset($this->passedArgs['Contact.last_name'])) {
            $last_name_arg = str_replace('*','%',$this->passedArgs['Contact.last_name']);
        }
        
        // if neither argument was passed, default to a wildcard
        if ($first_name_arg == "") {
            $first_name_arg = '%';
        }
        if ($last_name_arg == "") {
            $last_name_arg = '%';
        }
                 
        $conditions = array(
            'AND' => array(
                'Contact.first_name LIKE' => $first_name_arg,
                'Contact.last_name LIKE' => $last_name_arg,
                //'Organizations.project_id' => $this->Session->read('project_id')
            )
        );
        
        $joins = array(
            array( 
                'table' => 'organizations_projects', 
                'alias' => 'OrganizationsProject', 
                'type' => 'inner',  
                'conditions'=> array(
                    'Contact.organization_id = OrganizationsProject.organization_id',
                    'OrganizationsProject.project_id' => $this->Session->read('project_id'),
                    //'OrganizationsProject.organization_id' => 14
                )
                /*
                'conditions'=> array(
                    'Contact.organization_id = OrganizationsProject.organization_id',
                    'OrganizationsProject.project_id = 3',
                    'OrganizationsProject.organization_id = 14'
                ) 
                */
            )
        );
        
        $this->Contact->recursive = 2;
        $this->paginate = array(
            'Contact' => array(
                // limit is the number per page 
                //'limit' => 10,
                'joins' => $joins,
                'conditions' => $conditions,
                'order' => array(
                    'Contact.name_vf' => 'asc'
                ),
            ));
        
        
        //$options = array('PatientsProject.project_id' => $id);
        $this->set('data', $this->paginate('Contact'));
        
        //echo '<pre>';
        //print_r($this->Session->read('project_id'));
        //print_r($this->paginate('Contact'));
        //echo '</pre>';
        
        //$this->Contact->recursive = 0;
        //$this->set('contacts', $this->paginate());
        
        //$this->Contact->recursive = 1;
        $this->set('contacts',$this->paginate('Contact'));
    }
    
    public function view($id = null) {
        $this->Contact->id = $id;
        if (!$this->Contact->exists()) {
            throw new NotFoundException(__('Invalid contact'));
        }
        $this->set('contact', $this->Contact->read(null, $id));        
    }

    public function add() {
       $this->getOrganizationsForCurrentProject();
       $this->getInstallTeams();
       $this->getContactTypeOptions();
       if ($this->request->is('post')) {
            $this->Contact->create();
            if ($this->Contact->save($this->request->data)) {
                $this->Session->setFlash(__('The contact has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The contact could not be saved. Please, try again.'));
            }
        }
    }

    // return all the organizations the user may be assigned to
    function getOrganizationsForCurrentProject() {
        // $this->set('organizations',$this->Contact->Organization->find('list'));
        // the above does not give us what we want -- it gives us a list of all
        // organiations (for use in the select on the Contact add/edit pages)
        // However, we only want to show orgs for the currently selected project
        // e.g. contact <-> organization <-> organizations_projects <-> project
        // I could not sort out how to do this with a Cake join (see below)
        // so I'm doing it manually by running my own SQL and creating the array manually

//        begin does not work:
//        $orgs = $this->Contact->Organization->find('list');
//        echo '<pre>';
//        echo "For Project ID: ".$this->Session->read('project_id');
//        echo "<br>";
//        print_r($orgs);
//        
//        foreach ($orgs as $key => $value) {
//            $this->loadModel('Organization', $key);
//            $org = $this->Organization->read(null, $key);
//            echo ">";
//            print_r($org);
//        }
//        echo '</pre>';
//        echo "------------";
        
//        $this->Contact->Organization->bindModel(array('hasOne' => array('OrganizationsProjects')));
//        $organizations = $this->Contact->Organization->find('all',array(
//            'fields' => array('DISTINCT Organization.name'),
//            //'fields' => array('Organization.id', 'Organization.name'),
//            'conditions'=> array(
//                    //'Contact.organization_id = OrganizationsProject.organization_id',
//                    'OrganizationsProject.project_id' => $this->Session->read('project_id'),
//                    //'OrganizationsProject.organization_id' => 14
//                ),
//            'recursive' => 0,
//            'joins' => array( 
//                array('table' => 'organizations_projects', 
//                'alias' => 'OrganizationsProject', 
//                'type' => 'INNER',  
//                'conditions'=> array(
//                    //'Contact.organization_id = OrganizationsProject.organization_id',
//                    'OrganizationsProject.project_id' => $this->Session->read('project_id'),
//                    //'OrganizationsProject.organization_id' => 14
//                )
//        ))));
//        end does not work:
        
        $sql = "select distinct organization_id, name from organizations_projects, organizations where project_id=".$this->Session->read('project_id');
        $sql .= " and organizations.id=organizations_projects.organization_id";
        $results = $this->Contact->Organization->query($sql);        
        $organizations = array();
        foreach ($results as $key => $value) {
            $organizations[$value['organizations_projects']['organization_id']] = $value['organizations']['name'];
        }
        $this->set(compact('organizations'));
    }
    
    // as above
    function getInstallTeams() {
        $this->set('installteams',$this->Contact->InstallTeam->find('list'));
    }
    
    function getContactTypeOptions() {
        //$type_options = array('0' => 'Commercial Contact', '1' => 'Technical Contact');
        //$type_options = array('0' => $contactType0, '1' => $contactType1);
        $this->set('contacttypes',$this->Contact->ContactType->find('list'));
    }

    public function edit($id = null) {
        $this->Contact->id = $id;
        $this->getOrganizationsForCurrentProject();
        $this->getInstallTeams();
        $this->getContactTypeOptions();
        if (!$this->Contact->exists()) {
            throw new NotFoundException(__('Invalid contact'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Contact->save($this->request->data)) {
                    $this->Session->setFlash(__('The contact has been saved'));
                    $this->redirect(array('action' => 'view',$this->Contact->id));
            } else {
                    $this->Session->setFlash(__('The contact could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->Contact->read(null, $id);
            //$this->getSites();
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Contact->id = $id;
        if (!$this->Contact->exists()) {
            throw new NotFoundException(__('Invalid contact'));
        }
        if ($this->Contact->delete()) {
            $this->Session->setFlash(__('Contact deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Contact was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    public function isAuthorized($user) {
        // everyone can see the list and view individual Contacts
        if ($this->action === 'index' || $this->action === 'view') {
            return true;
        }
        
        // allow users with the rolealias of "edit" to add/edit/delete
        if ($this->action === 'add' || $this->action === 'edit' || $this->action === 'delete') {
            if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'edit') {
                return true;
            }
        }
        
        return parent::isAuthorized($user);
    }
}

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
       $this->getOrganizations();
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
    function getOrganizations() {
        // moved this into AppController since SitesController has to do the same thing
        return parent::getOrganizationsForCurrentProject('Contact');
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
        $this->getOrganizations();
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

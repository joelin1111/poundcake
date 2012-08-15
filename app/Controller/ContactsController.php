<?php
App::uses('AppController', 'Controller');
/**
 * Contacts Controller
 *
 * @property Contact $Contact
 */
class ContactsController extends AppController {

/**
 * index method
 *
 * @return void
 */
//	public function index() {
//		$this->Contact->recursive = 0;
//		$this->set('contacts', $this->paginate());
//	}
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
        
//        echo "School code arg: " . $school_code_arg;
//        echo "<BR>Site name arg: " . $site_name_arg;
//        echo "<BR>";
        
        //echo "School code 2:<pre>".$this->passedArgs['School.school_code']."</pre>";            
        $conditions = array(
            'AND' => array(
                'Contact.first_name LIKE' => $first_name_arg,
                'Contact.last_name LIKE' => $last_name_arg,
            )
        );
        // echo "Conditions: ".print_r($conditions);
        
        $this->paginate = array(
            'Contact' => array(
                // limit is the number per page 
                'limit' => 10,
                //'conditions' => $this->School->parseCriteria($this->passedArgs),
                'conditions' => $conditions,
                'order' => array(
                    'Contact.first_name' => 'asc',
                    'Contact.last_name' => 'asc',
                ),
            ));
        
        $this->Contact->recursive = 0;
        $this->set('contacts', $this->paginate());
            
    }
/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
            $this->Contact->id = $id;
            if (!$this->Contact->exists()) {
                    throw new NotFoundException(__('Invalid contact'));
            }
            $this->set('contact', $this->Contact->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
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

        // return all the TC/TRCs to allow the user to be assigned to
        function getTrcs() {
            // see comment in getSchools
            $this->set('trcs',$this->Contact->Trc->find('list'));
            /* To-Do PC-64
            $this->set('trcs',$this->Contact->Trc->find('list',
                    array(
                        'order' => array('Trc.name', 'School.site_name ASC'))));
            */
        }
        
        // return all the schools to allow the user to be assigned to
        function getSchools() {
            // because the school listing is so long, by default find would
            // return a list of school names -- we actually want this list sorted
            // by school code then name
            // furthermore, we want the list itself to be a virtual field of
            // site id + school code -- so we've defined a virtual field on the
            // school model and we've modified the query here to do the sorting
            
            /*
            $data = $this->Contact->School->find(
                'list',
                array(
                    'order' => array('School.id','School.school_code', 'School.site_name ASC'),
                    'fields' => array('School.id','School.school_code', 'School.site_name')
                    )
                );
            echo "<pre>";
            print_r($data);
            echo "</pre>";
            */
            $this->set('schools',$this->Contact->School->find('list',
                    array(
                        'order' => array('School.school_code', 'School.site_name ASC'))));
        }
        
        // return all the districts to allow the user to be assigned to
        function getDistricts() {
            // see comment in getSchools
            // Districts don';'t have site_id like Schools or TRCs, so we can only
            // sort by name here
            // $this->set('districts',$this->Contact->District->find('list'));
            $this->set('districts',$this->Contact->District->find('list',
                    array(
                        'order' => array('District.name'))));
        }
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
            $this->Contact->id = $id;
            $this->getTrcs();
            $this->getSchools();
            $this->getDistricts();
            if (!$this->Contact->exists()) {
                    throw new NotFoundException(__('Invalid contact'));
            }
            if ($this->request->is('post') || $this->request->is('put')) {
                    if ($this->Contact->save($this->request->data)) {
                            $this->Session->setFlash(__('The contact has been saved'));
                            $this->redirect(array('action' => 'index'));
                    } else {
                            $this->Session->setFlash(__('The contact could not be saved. Please, try again.'));
                    }
            } else {
                    $this->request->data = $this->Contact->read(null, $id);
            }
	}

/**
 * delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
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

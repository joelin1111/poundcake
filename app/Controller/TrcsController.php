<?php
App::uses('AppController', 'Controller');
/**
 * Trcs Controller
 *
 * @property Trc $Trc
 */
class TrcsController extends AppController {

/**
 * index method
 *
 * @return void
 */
    function index($id = null) {
        
        $conditions = "";
        $name_arg = "";
        
        if (isset($this->passedArgs['Trc.name'])) {
            $name_arg = str_replace('*','%',$this->passedArgs['Trc.name']);
        }
        
        // if neither argument was passed, default to a wildcard
        if ($name_arg == "") {
            $name_arg = '%';
        }
        
//        echo "School code arg: " . $school_code_arg;
//        echo "<BR>Site name arg: " . $site_name_arg;
//        echo "<BR>";
        
        //echo "School code 2:<pre>".$this->passedArgs['School.school_code']."</pre>";            
        $conditions = array(
            'AND' => array(
                'Trc.name LIKE' => $name_arg
            )
        );
        // echo "Conditions: ".print_r($conditions);
        
        $this->paginate = array(
            'Trc' => array(
                // limit is the number per page 
                'limit' => 10,
                //'conditions' => $this->School->parseCriteria($this->passedArgs),
                'conditions' => $conditions,
                'order' => array(
                    'Trc.name' => 'asc'
                ),
            ));
        
        $this->Trc->recursive = 0;
        $this->set('trcs', $this->paginate());
            
    }

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Trc->id = $id;
		if (!$this->Trc->exists()) {
			throw new NotFoundException(__('Invalid trc'));
		}
                $this->set('trc', $this->Trc->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Trc->create();
			if ($this->Trc->save($this->request->data)) {
				$this->Session->setFlash(__('The trc has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trc could not be saved. Please, try again.'));
			}
		}
	}

        /*
        // return all the schools to allow the TRC to be assigned to
        function getSchools() {
            // this get function is a little different than others, since we
            // don't have the kind of relationship (Trc to School) that allows
            // us to pull up all Schools, we have to explicitly load the model
            // first
            $this->loadModel('School');
            $this->set('schools',$this->School->find('list'));
        }
        */
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Trc->id = $id;
                //$this->getSchools();
                if (!$this->Trc->exists()) {
			throw new NotFoundException(__('Invalid trc'));
		}
                if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Trc->save($this->request->data)) {
				$this->Session->setFlash(__('The trc has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The trc could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Trc->read(null, $id);
                        
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
		$this->Trc->id = $id;
		if (!$this->Trc->exists()) {
			throw new NotFoundException(__('Invalid trc'));
		}
		if ($this->Trc->delete()) {
			$this->Session->setFlash(__('Trc deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Trc was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        public function isAuthorized($user) {
            // everyone can see the list and view individual TRCs
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

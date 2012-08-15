<?php
App::uses('AppController', 'Controller');
/**
 * SiteStates Controller
 *
 * @property SiteState $SiteState
 */
class SiteStatesController extends AppController {
    
    
    
    /*
    public $paginate = array(
        'fields' => array('School.school_code', 'School.school_name'),
        'limit' => 25,
        'order' => array(
            'School.school_code' => 'asc'
        )
    );
     */    
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->SiteState->recursive = 0;
		$this->set('siteStates', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->SiteState->id = $id;
		if (!$this->SiteState->exists()) {
			throw new NotFoundException(__('Invalid site state'));
		}
		$this->set('siteState', $this->SiteState->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->SiteState->create();
			if ($this->SiteState->save($this->request->data)) {
				$this->Session->setFlash(__('The site state has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The site state could not be saved. Please, try again.'));
			}
		}
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->SiteState->id = $id;
		if (!$this->SiteState->exists()) {
			throw new NotFoundException(__('Invalid site state'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->SiteState->save($this->request->data)) {
				$this->Session->setFlash(__('The site state has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The site state could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->SiteState->read(null, $id);
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
		$this->SiteState->id = $id;
		if (!$this->SiteState->exists()) {
			throw new NotFoundException(__('Invalid site state'));
		}
		if ($this->SiteState->delete()) {
			$this->Session->setFlash(__('Site state deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Site state was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

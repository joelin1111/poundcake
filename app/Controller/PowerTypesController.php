<?php
App::uses('AppController', 'Controller');
/**
 * PowerTypes Controller
 *
 * @property PowerType $PowerType
 */
class PowerTypesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->PowerType->recursive = 0;
		$this->set('powerTypes', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->PowerType->id = $id;
		if (!$this->PowerType->exists()) {
			throw new NotFoundException(__('Invalid power type'));
		}
		$this->set('powerType', $this->PowerType->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->PowerType->create();
			if ($this->PowerType->save($this->request->data)) {
				$this->Session->setFlash(__('The power type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The power type could not be saved. Please, try again.'));
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
		$this->PowerType->id = $id;
		if (!$this->PowerType->exists()) {
			throw new NotFoundException(__('Invalid power type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->PowerType->save($this->request->data)) {
				$this->Session->setFlash(__('The power type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The power type could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->PowerType->read(null, $id);
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
		$this->PowerType->id = $id;
		if (!$this->PowerType->exists()) {
			throw new NotFoundException(__('Invalid power type'));
		}
		if ($this->PowerType->delete()) {
			$this->Session->setFlash(__('Power type deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Power type was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
        
}

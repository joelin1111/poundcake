<?php
App::uses('AppController', 'Controller');
/**
 * ConnectivityTypes Controller
 *
 * @property ConnectivityType $ConnectivityType
 */
class ConnectivityTypesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->ConnectivityType->recursive = 0;
		$this->set('connectivityTypes', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->ConnectivityType->id = $id;
		if (!$this->ConnectivityType->exists()) {
			throw new NotFoundException(__('Invalid connectivity type'));
		}
		$this->set('connectivityType', $this->ConnectivityType->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->ConnectivityType->create();
			if ($this->ConnectivityType->save($this->request->data)) {
				$this->Session->setFlash(__('The connectivity type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The connectivity type could not be saved. Please, try again.'));
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
		$this->ConnectivityType->id = $id;
		if (!$this->ConnectivityType->exists()) {
			throw new NotFoundException(__('Invalid connectivity type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->ConnectivityType->save($this->request->data)) {
				$this->Session->setFlash(__('The connectivity type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The connectivity type could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->ConnectivityType->read(null, $id);
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
		$this->ConnectivityType->id = $id;
		if (!$this->ConnectivityType->exists()) {
			throw new NotFoundException(__('Invalid connectivity type'));
		}
		if ($this->ConnectivityType->delete()) {
			$this->Session->setFlash(__('Connectivity type deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Connectivity type was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

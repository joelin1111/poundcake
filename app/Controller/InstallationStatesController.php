<?php
App::uses('AppController', 'Controller');
/**
 * InstallationStates Controller
 *
 * @property InstallationState $InstallationState
 */
class InstallationStatesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->InstallationState->recursive = 0;
		$this->set('installationStates', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->InstallationState->id = $id;
		if (!$this->InstallationState->exists()) {
			throw new NotFoundException(__('Invalid installation state'));
		}
		$this->set('installationState', $this->InstallationState->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->InstallationState->create();
			if ($this->InstallationState->save($this->request->data)) {
				$this->Session->setFlash(__('The installation state has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The installation state could not be saved. Please, try again.'));
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
		$this->InstallationState->id = $id;
		if (!$this->InstallationState->exists()) {
			throw new NotFoundException(__('Invalid installation state'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->InstallationState->save($this->request->data)) {
				$this->Session->setFlash(__('The installation state has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The installation state could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->InstallationState->read(null, $id);
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
		$this->InstallationState->id = $id;
		if (!$this->InstallationState->exists()) {
			throw new NotFoundException(__('Invalid installation state'));
		}
		if ($this->InstallationState->delete()) {
			$this->Session->setFlash(__('Installation state deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Installation state was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

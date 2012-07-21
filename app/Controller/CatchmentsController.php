<?php
App::uses('AppController', 'Controller');
/**
 * Provinces Controller
 *
 * @property Province $Catchment
 */
class CatchmentsController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Catchment->recursive = 0;
		$this->set('catchments', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Catchment->id = $id;
		if (!$this->Catchment->exists()) {
			throw new NotFoundException(__('Invalid province'));
		}
		$this->set('catchment', $this->Catchment->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Catchment->create();
			if ($this->Catchment->save($this->request->data)) {
				$this->Session->setFlash(__('The catchment has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The catchment could not be saved. Please, try again.'));
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
		$this->Catchment->id = $id;
		if (!$this->Catchment->exists()) {
			throw new NotFoundException(__('Invalid province'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Catchment->save($this->request->data)) {
				$this->Session->setFlash(__('The catchment has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The catchment could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Catchment->read(null, $id);
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
		$this->Catchment->id = $id;
		if (!$this->Catchment->exists()) {
			throw new NotFoundException(__('Invalid catchment'));
		}
		if ($this->Catchment->delete()) {
			$this->Session->setFlash(__('Catchment deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Catchment was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

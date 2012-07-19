<?php
App::uses('AppController', 'Controller');
/**
 * InterventionTypes Controller
 *
 * @property InterventionType $InterventionType
 */
class InterventionTypesController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->InterventionType->recursive = 0;
		$this->set('interventionTypes', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->InterventionType->id = $id;
		if (!$this->InterventionType->exists()) {
			throw new NotFoundException(__('Invalid intervention type'));
		}
		$this->set('interventionType', $this->InterventionType->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->InterventionType->create();
			if ($this->InterventionType->save($this->request->data)) {
				$this->Session->setFlash(__('The intervention type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The intervention type could not be saved. Please, try again.'));
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
		$this->InterventionType->id = $id;
		if (!$this->InterventionType->exists()) {
			throw new NotFoundException(__('Invalid intervention type'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->InterventionType->save($this->request->data)) {
				$this->Session->setFlash(__('The intervention type has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The intervention type could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->InterventionType->read(null, $id);
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
		$this->InterventionType->id = $id;
		if (!$this->InterventionType->exists()) {
			throw new NotFoundException(__('Invalid intervention type'));
		}
		if ($this->InterventionType->delete()) {
			$this->Session->setFlash(__('Intervention type deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Intervention type was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

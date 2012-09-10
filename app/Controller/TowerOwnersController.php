<?php
App::uses('AppController', 'Controller');
/**
 * ServiceProviders Controller
 *
 * @property ServiceProvider $ServiceProvider
 */
class ServiceProvidersController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
            $this->ServiceProvider->recursive = 0;
            $this->set('serviceProviders', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
            $this->ServiceProvider->id = $id;
            if (!$this->ServiceProvider->exists()) {
                    throw new NotFoundException(__('Invalid service provider'));
            }
            $this->set('serviceProvider', $this->ServiceProvider->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
            if ($this->request->is('post')) {
                    $this->ServiceProvider->create();
                    if ($this->ServiceProvider->save($this->request->data)) {
                            $this->Session->setFlash(__('The service provider has been saved'));
                            $this->redirect(array('action' => 'index'));
                    } else {
                            $this->Session->setFlash(__('The service provider could not be saved. Please, try again.'));
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
		$this->ServiceProvider->id = $id;
		if (!$this->ServiceProvider->exists()) {
			throw new NotFoundException(__('Invalid service provider'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->ServiceProvider->save($this->request->data)) {
				$this->Session->setFlash(__('The service provider has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The service provider could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->ServiceProvider->read(null, $id);
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
		$this->ServiceProvider->id = $id;
		if (!$this->ServiceProvider->exists()) {
			throw new NotFoundException(__('Invalid service provider'));
		}
		if ($this->ServiceProvider->delete()) {
			$this->Session->setFlash(__('Service provider deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Service provider was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        // check the ACL
        public function isAuthorized($user) {
            return parent::isAuthorized($user);
        }
}

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
	public function index() {
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
                //$contacts = $this->Trc->Contact->find('list');
                /*
                $contacts = $this->Trc->Contact->find('list',
                        array(
                            'conditions' => array('Contact.trc_id =' => $id)
                        )
                        );
                */
                //$this->set(compact('contacts'));
                
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

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Trc->id = $id;
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
}

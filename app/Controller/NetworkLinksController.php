<?php
App::uses('AppController', 'Controller');

class NetworkLinksController extends AppController {

    public function index() {
        $this->NetworkLink->recursive = 0;
        $this->set('antennaTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->NetworkLink->id = $id;
        if (!$this->NetworkLink->exists()) {
                throw new NotFoundException(__('Invalid network link'));
        }
        $this->set('antennaType', $this->NetworkLink->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->NetworkLink->create();
            if ($this->NetworkLink->save($this->request->data)) {
                $this->Session->setFlash(__('The network link has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The network link could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->NetworkLink->id = $id;
        if (!$this->NetworkLink->exists()) {
            throw new NotFoundException(__('Invalid network link'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkLink->save($this->request->data)) {
                $this->Session->setFlash(__('The network link has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The network link could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->NetworkLink->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->NetworkLink->id = $id;
        if (!$this->NetworkLink->exists()) {
            throw new NotFoundException(__('Invalid network link'));
        }
        if ($this->NetworkLink->delete()) {
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

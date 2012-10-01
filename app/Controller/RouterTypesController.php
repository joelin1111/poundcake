<?php
App::uses('AppController', 'Controller');

class RouterTypesController extends AppController {

    public function index() {
        $this->RouterType->recursive = 0;
        $this->set('routerTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->RouterType->id = $id;
        if (!$this->RouterType->exists()) {
                throw new NotFoundException(__('Invalid router type'));
        }
        $this->set('routerType', $this->RouterType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->RouterType->create();
            if ($this->RouterType->save($this->request->data)) {
                $this->Session->setFlash(__('The router type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The router type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->RouterType->id = $id;
        if (!$this->RouterType->exists()) {
            throw new NotFoundException(__('Invalid router type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RouterType->save($this->request->data)) {
                $this->Session->setFlash(__('The router type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The router type could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->RouterType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RouterType->id = $id;
        if (!$this->RouterType->exists()) {
            throw new NotFoundException(__('Invalid router type'));
        }
        if ($this->RouterType->delete()) {
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

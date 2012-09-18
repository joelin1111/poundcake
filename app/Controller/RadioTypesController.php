<?php
App::uses('AppController', 'Controller');

class RadioTypesController extends AppController {

    public function index() {
        $this->RadioType->recursive = 0;
        $this->set('radioTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
                throw new NotFoundException(__('Invalid radio type'));
        }
        $this->set('radioType', $this->RadioType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->RadioType->create();
            if ($this->RadioType->save($this->request->data)) {
                $this->Session->setFlash(__('The radio type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
            throw new NotFoundException(__('Invalid radio type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RadioType->save($this->request->data)) {
                $this->Session->setFlash(__('The radio type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio type could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->RadioType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
            throw new NotFoundException(__('Invalid radio type'));
        }
        if ($this->RadioType->delete()) {
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

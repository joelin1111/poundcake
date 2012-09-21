<?php
App::uses('AppController', 'Controller');

class SwitchTypesController extends AppController {

    public function index() {
        $this->SwitchType->recursive = 0;
        $this->set('switchTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
                throw new NotFoundException(__('Invalid switch type'));
        }
        $this->set('switchType', $this->SwitchType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->SwitchType->create();
            if ($this->SwitchType->save($this->request->data)) {
                $this->Session->setFlash(__('The switch type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The switch type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
            throw new NotFoundException(__('Invalid switch type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->SwitchType->save($this->request->data)) {
                $this->Session->setFlash(__('The switch type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The switch type could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->SwitchType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
            throw new NotFoundException(__('Invalid switch type'));
        }
        if ($this->SwitchType->delete()) {
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

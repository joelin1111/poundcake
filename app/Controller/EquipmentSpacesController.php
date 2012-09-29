<?php
App::uses('AppController', 'Controller');

class EquipmentSpacesController extends AppController {

    public function index() {
        $this->EquipmentSpace->recursive = 0;
        $this->set('towertypes', $this->paginate());
    }

    public function view($id = null) {
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
                throw new NotFoundException(__('Invalid equipment space'));
        }
        $this->set('towertype', $this->EquipmentSpace->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->EquipmentSpace->create();
            if ($this->EquipmentSpace->save($this->request->data)) {
                $this->Session->setFlash(__('The equipment space has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The equipment space could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
                throw new NotFoundException(__('Invalid equipment space'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->EquipmentSpace->save($this->request->data)) {
                $this->Session->setFlash(__('The equipment space has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The equipment space could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->EquipmentSpace->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
            throw new NotFoundException(__('Invalid equipment space'));
        }
        if ($this->EquipmentSpace->delete()) {
            $this->Session->setFlash(__('EquipmentSpace deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('EquipmentSpace was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

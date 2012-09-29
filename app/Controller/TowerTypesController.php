<?php
App::uses('AppController', 'Controller');

class TowerEquipmentController extends AppController {

    public function index() {
        $this->TowerEquipment->recursive = 0;
        // yes, I do realize that the plural of equipment is equipment
        $this->set('towerequipments', $this->paginate());
    }

    public function view($id = null) {
        $this->TowerEquipment->id = $id;
        if (!$this->TowerEquipment->exists()) {
                throw new NotFoundException(__('Invalid tower equipment'));
        }
        $this->set('towerequipment', $this->TowerEquipment->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerEquipment->create();
            if ($this->TowerEquipment->save($this->request->data)) {
                $this->Session->setFlash(__('The tower equipment has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower equipment could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerEquipment->id = $id;
        if (!$this->TowerEquipment->exists()) {
                throw new NotFoundException(__('Invalid tower equipment'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerEquipment->save($this->request->data)) {
                $this->Session->setFlash(__('The tower equipment has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower equipment could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->TowerEquipment->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerEquipment->id = $id;
        if (!$this->TowerEquipment->exists()) {
            throw new NotFoundException(__('Invalid tower equipment'));
        }
        if ($this->TowerEquipment->delete()) {
            $this->Session->setFlash(__('Tower equipment deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Tower equipment was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

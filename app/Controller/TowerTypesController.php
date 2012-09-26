<?php
App::uses('AppController', 'Controller');

class TowerTypesController extends AppController {

    public function index() {
        $this->TowerType->recursive = 0;
        $this->set('towertypes', $this->paginate());
    }

    public function view($id = null) {
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
                throw new NotFoundException(__('Invalid tower type'));
        }
        $this->set('towertype', $this->TowerType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerType->create();
            if ($this->TowerType->save($this->request->data)) {
                $this->Session->setFlash(__('The tower type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
                throw new NotFoundException(__('Invalid tower type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerType->save($this->request->data)) {
                $this->Session->setFlash(__('The tower type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower type could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->TowerType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
            throw new NotFoundException(__('Invalid tower type'));
        }
        if ($this->TowerType->delete()) {
            $this->Session->setFlash(__('TowerType deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('TowerType was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

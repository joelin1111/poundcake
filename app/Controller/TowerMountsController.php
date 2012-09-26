<?php
App::uses('AppController', 'Controller');

class TowerMountsController extends AppController {

    public function index() {
        $this->TowerMount->recursive = 0;
        $this->set('towermounts', $this->paginate());
    }

    public function view($id = null) {
        $this->TowerMount->id = $id;
        if (!$this->TowerMount->exists()) {
                throw new NotFoundException(__('Invalid tower mount'));
        }
        $this->set('towermount', $this->TowerMount->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerMount->create();
            if ($this->TowerMount->save($this->request->data)) {
                $this->Session->setFlash(__('The tower mount has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower mount could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerMount->id = $id;
        if (!$this->TowerMount->exists()) {
                throw new NotFoundException(__('Invalid tower mount'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerMount->save($this->request->data)) {
                $this->Session->setFlash(__('The tower mount has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower mount could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->TowerMount->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerMount->id = $id;
        if (!$this->TowerMount->exists()) {
            throw new NotFoundException(__('Invalid tower mount'));
        }
        if ($this->TowerMount->delete()) {
            $this->Session->setFlash(__('TowerMount deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('TowerMount was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

<?php
App::uses('AppController', 'Controller');

class TowerMembersController extends AppController {

    public function index() {
        $this->TowerMember->recursive = 0;
        $this->set('towermembers', $this->paginate());
    }

    public function view($id = null) {
        $this->TowerMember->id = $id;
        if (!$this->TowerMember->exists()) {
                throw new NotFoundException(__('Invalid tower member'));
        }
        $this->set('towermember', $this->TowerMember->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerMember->create();
            if ($this->TowerMember->save($this->request->data)) {
                $this->Session->setFlash(__('The tower member has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower member could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerMember->id = $id;
        if (!$this->TowerMember->exists()) {
                throw new NotFoundException(__('Invalid tower member'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerMember->save($this->request->data)) {
                $this->Session->setFlash(__('The tower member has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower member could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->TowerMember->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerMember->id = $id;
        if (!$this->TowerMember->exists()) {
            throw new NotFoundException(__('Invalid tower member'));
        }
        if ($this->TowerMember->delete()) {
            $this->Session->setFlash(__('TowerMember deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('TowerMember was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

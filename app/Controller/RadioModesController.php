<?php
App::uses('AppController', 'Controller');

class RadioModesController extends AppController {

    public function index() {
        $this->RadioMode->recursive = 0;
        // yes, I do realize that the plural of equipment is equipment
        $this->set('radiomodes', $this->paginate());
    }

    public function view($id = null) {
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
                throw new NotFoundException(__('Invalid radio mode'));
        }
        $this->set('radiomode', $this->RadioMode->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->RadioMode->create();
            if ($this->RadioMode->save($this->request->data)) {
                $this->Session->setFlash(__('The radio mode has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio mode could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
                throw new NotFoundException(__('Invalid radio mode'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RadioMode->save($this->request->data)) {
                $this->Session->setFlash(__('The radio mode has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio mode could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->RadioMode->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
            throw new NotFoundException(__('Invalid radio mode'));
        }
        if ($this->RadioMode->delete()) {
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

<?php
App::uses('AppController', 'Controller');

class ChangeLogController extends AppController {

    public function index() {
        $this->ChangeLog->recursive = 0;
        $this->set('changeLogs', $this->paginate());
    }

    public function view($id = null) {
        $this->ChangeLog->id = $id;
        if (!$this->ChangeLog->exists()) {
                throw new NotFoundException(__('Invalid change log'));
        }
        $this->set('changeLog', $this->ChangeLog->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->ChangeLog->create();
            if ($this->ChangeLog->save($this->request->data)) {
                $this->Session->setFlash(__('The change log has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The change log could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->ChangeLog->id = $id;
        if (!$this->ChangeLog->exists()) {
            throw new NotFoundException(__('Invalid change log'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->ChangeLog->save($this->request->data)) {
                $this->Session->setFlash(__('The change log has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The change log could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->ChangeLog->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->ChangeLog->id = $id;
        if (!$this->ChangeLog->exists()) {
            throw new NotFoundException(__('Invalid change log'));
        }
        if ($this->ChangeLog->delete()) {
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

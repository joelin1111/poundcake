<?php
App::uses('AppController', 'Controller');
/**
 * ServiceProviders Controller
 *
 * @property Organization $Organization
 */
class OrganizationsController extends AppController {

    public function index() {
        $this->Organization->recursive = 0;
        $this->set('organizations', $this->paginate());
    }
    
    function getContacts() {
        $this->set('contacts',$this->Organization->Contact->find('list'));        
    }

    public function view($id = null) {
        $this->Organization->id = $id;
        
        if (!$this->Organization->exists()) {
                throw new NotFoundException(__('Invalid organization'));
        }
        $this->set('organization', $this->Organization->read(null, $id));
        
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->Organization->create();
            if ($this->Organization->save($this->request->data)) {
                $this->Session->setFlash(__('The organization has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The organization could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->Organization->id = $id;
        if (!$this->Organization->exists()) {
            throw new NotFoundException(__('Invalid organization'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Organization->save($this->request->data)) {
                $this->Session->setFlash(__('The organization has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The organization could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->Organization->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Organization->id = $id;
        if (!$this->Organization->exists()) {
            throw new NotFoundException(__('Invalid organization'));
        }
        if ($this->Organization->delete()) {
            $this->Session->setFlash(__('Tower owner deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Tower owner was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

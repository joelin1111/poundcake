<?php
App::uses('AppController', 'Controller');
/**
 * ServiceProviders Controller
 *
 * @property TowerOwner $TowerOwner
 */
class TowerOwnersController extends AppController {

    public function index() {
        $this->TowerOwner->recursive = 0;
        $this->set('towerOwners', $this->paginate());
    }
    
    function getContacts() {
        $this->set('contacts',$this->TowerOwner->Contact->find('list'));        
    }

    public function view($id = null) {
        $this->TowerOwner->id = $id;
        
        if (!$this->TowerOwner->exists()) {
                throw new NotFoundException(__('Invalid tower owner'));
        }
        $this->set('towerowner', $this->TowerOwner->read(null, $id));
        
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerOwner->create();
            if ($this->TowerOwner->save($this->request->data)) {
                $this->Session->setFlash(__('The tower owner has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower owner could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerOwner->id = $id;
        if (!$this->TowerOwner->exists()) {
            throw new NotFoundException(__('Invalid tower owner'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerOwner->save($this->request->data)) {
                $this->Session->setFlash(__('The tower owner has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower owner could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->TowerOwner->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerOwner->id = $id;
        if (!$this->TowerOwner->exists()) {
            throw new NotFoundException(__('Invalid tower owner'));
        }
        if ($this->TowerOwner->delete()) {
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

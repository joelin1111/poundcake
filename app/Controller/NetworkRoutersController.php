<?php
App::uses('AppController', 'Controller');

class NetworkRoutersController extends AppController {

    var $helpers = array('MyHTML');
    
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkRouter.name' => 'asc'
        )
    );
    
    public function index() {
        $this->NetworkRouter->recursive = 0;
        $this->set('networkrouters', $this->paginate());
    }

    public function view($id = null) {
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
            throw new NotFoundException(__('Invalid router'));
        }
        $this->set('networkrouter', $this->NetworkRouter->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->NetworkRouter->create();
            if ($this->NetworkRouter->save($this->request->data)) {
                $this->Session->setFlash(__('The router has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The router could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
                throw new NotFoundException(__('Invalid router'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->NetworkRouter->save($this->request->data)) {
                        $this->Session->setFlash(__('The router has been saved'));
                        $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The router could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->NetworkRouter->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
                throw new NotFoundException(__('Invalid router'));
        }
        if ($this->NetworkRouter->delete()) {
                $this->Session->setFlash(__('Road type deleted'));
                $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Road type was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    public function isAuthorized($user) {
        // everyone can see the list and view individual Contacts
        if ($this->action === 'index' || $this->action === 'view') {
            return true;
        }
        
        // allow users with the rolealias of "edit" to add/edit/delete
        if ($this->action === 'add' || $this->action === 'edit' || $this->action === 'delete') {
            if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'edit') {
                return true;
            }
        }
        
        return parent::isAuthorized($user);
    }
}

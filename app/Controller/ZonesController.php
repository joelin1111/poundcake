<?php
App::uses('AppController', 'Controller');

class ZonesController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'Zone.name' => 'asc'
        )
    );
    
    public function index() {
        $this->Zone->recursive = 0;
        $this->set('zones', $this->paginate());
    }

    public function view($id = null) {
        $this->Zone->id = $id;
        if (!$this->Zone->exists()) {
            throw new NotFoundException(__('Invalid zone'));
        }
        $this->set('zone', $this->Zone->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->Zone->create();
            if ($this->Zone->save($this->request->data)) {
                $this->Session->setFlash(__('The zone has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The zone could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->Zone->id = $id;
        if (!$this->Zone->exists()) {
            throw new NotFoundException(__('Invalid province'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->Zone->save($this->request->data)) {
                    $this->Session->setFlash(__('The zone has been saved'));
                    $this->redirect(array('action' => 'index'));
                } else {
                    $this->Session->setFlash(__('The zone could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->Zone->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Zone->id = $id;
        if (!$this->Zone->exists()) {
            throw new NotFoundException(__('Invalid zone'));
        }
        if ($this->Zone->delete()) {
            $this->Session->setFlash(__('Zone deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Zone was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

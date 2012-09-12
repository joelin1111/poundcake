<?php
App::uses('AppController', 'Controller');

class NetworkSwitchesController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkSwitch.name' => 'asc'
        )
    );
    
    public function index() {
        $this->NetworkSwitch->recursive = 0;
        $this->set('networkswitches', $this->paginate());
    }

    public function view($id = null) {
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException(__('Invalid switch'));
        }
        $this->set('networkswitch', $this->NetworkSwitch->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->NetworkSwitch->create();
            if ($this->NetworkSwitch->save($this->request->data)) {
                    $this->Session->setFlash(__('The switch has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The switch could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException(__('Invalid switch'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->NetworkSwitch->save($this->request->data)) {
                        $this->Session->setFlash(__('The switch has been saved'));
                        $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The switch could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->NetworkSwitch->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException(__('Invalid switch'));
        }
        if ($this->NetworkSwitch->delete()) {
                $this->Session->setFlash(__('Road type deleted'));
                $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Road type was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

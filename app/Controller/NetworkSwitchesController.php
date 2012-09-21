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
        $this->getNumPorts();
        
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
        $this->getNumPorts();
        
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
            $this->Session->setFlash(__('Switch deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Switch was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
    
    
    function getNumPorts() {
        // hard coded for now -- we only use switches with 8, 16 or 24 ports
        // would be nice to make a Switch have a NetworkSwitchType
        $num_ports[8] = '8';
        $num_ports[16] = '16';
        $num_ports[24] = '24';
        $this->set('num_ports', $num_ports);
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

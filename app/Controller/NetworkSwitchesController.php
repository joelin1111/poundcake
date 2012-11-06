<?php
App::uses('AppController', 'Controller');

class NetworkSwitchesController extends AppController {

    var $helpers = array('MyHTML');
    
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
        $this->getSwitchTypes();
        
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
        $this->getSwitchTypes();
               
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException(__('Invalid switch'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkSwitch->save($this->request->data)) {
                $this->Session->setFlash(__('The switch has been saved'));
                $this->redirect(array('action' => 'view',$this->NetworkSwitch->id));
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
    
    function getSwitchTypes() {
        $this->set('switchtypes',$this->NetworkSwitch->SwitchType->find('list',
            array(
                'order' => array(
                    'SwitchType.ports ASC'
            )))
        );
    }
    
    public function getPortsBySwitchType() {
        // this ID of the switch the user has selected (from the Radio add/edit page)
        $switch_id = $this->request->data['NetworkRadio']['network_switch_id'];
        $this->loadModel('NetworkSwitch', $switch_id);
        $switch_data = $this->NetworkSwitch->find('all', array('conditions' => array('NetworkSwitch.id' => $switch_id)));
        $ports = $switch_data[0]['SwitchType']['ports'];
        ////$ports = $this->NetworkSwitch->SwitchType->field('ports');
        //$switch_data = $this->NetworkSwitch->SwitchType->find('all', array('conditions' => array('NetworkSwitch.id' => $switch_id)));
        //$ports = 4;
        
        // sadly, switches are labeled 1 to N
        for ($i = 1; $i <= $ports; $i++) {
            //$switchports[$i] = $i . " switch id: ".$switch_id ." ports ".$ports."";
            $switchports[$i] = 'Port #'.$i;
        }
        //$switchports[0] = 'foo';
        $this->set('switchports',$switchports);
        $this->layout = 'ajax';
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

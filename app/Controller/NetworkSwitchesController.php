<?php
App::uses('AppController', 'Controller');

class NetworkSwitchesController extends AppController {

    var $helpers = array('MyHTML');
    
    /*
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkSwitch.name' => 'asc'
        )/*,
        'conditions' => array(
            'Site.project_id' => 3 // $this->Session->read('project_id')
        )
        *
    );
    
    public function index() {
        //$this->NetworkSwitch->recursive = 0;
        //$this->set('networkswitches', $this->paginate());
        $this->paginate = array(
            'contain' => array('Site'),
            'conditions' => array(
                'Site.project_id' => 3 // $this->Session->read('project_id')
            )
        );
        $data = $this->paginate('NetworkSwitch');
        $this->set(compact('data'));
    }
    */
    /*
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkSwitch.name' => 'asc'
        )
    );
    */
    
    public function index() {
        // begin search stuff (note: this is not currently used)
        $name_arg = "";
        if (isset($this->passedArgs['NetworkSwitch.name'])) {
            $name_arg = str_replace('*','%',$this->passedArgs['NetworkSwitch.name']);
        }
        
        // if no argument was passed, default to a wildcard
        if ($name_arg == "") {
            $name_arg = '%';
        }
        
        $conditions = array(
            'AND' => array(
                'NetworkSwitch.name LIKE' => $name_arg,
                // only show radios for the currently selected project
                // saved as a session variable
                'Site.project_id' => $this->Session->read('project_id')
            ),
        );
        
        $this->paginate = array(
            'NetworkSwitch' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                'order' => array(
                    'NetworkSwitch.name' => 'asc',
                ),
            ));
        $this->NetworkSwitch->recursive = 1;
        $data = $this->paginate('NetworkSwitch');
        $this->set('networkswitches',$data);
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
        $this->getAllSitesForProject();
        
        if ($this->request->is('post')) {
            $this->NetworkSwitch->create();
            if ($this->NetworkSwitch->save($this->request->data)) {
                // we just saved a switch, but switches don't know about projects
                // so we need to manually save the switch's id back to the site for the
                // currently active project
                $this->loadModel('Site', $this->request->data['NetworkSwitch']['site_id']);
                $this->Site->id = $this->request->data['NetworkSwitch']['site_id']; // weird to have to do this manually
                $this->Site->saveField('network_switch_id', $this->NetworkSwitch->id);

                $this->Session->setFlash(__('The switch has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The switch could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->getSwitchTypes();
        $this->getAllSitesForProject();
        $this->NetworkSwitch->id = $id;
        
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException(__('Invalid switch'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkSwitch->save($this->request->data)) {
                // save it back to the site to which it's associated
                $this->loadModel('Site', $this->request->data['NetworkSwitch']['site_id']);
                $this->Site->id = $this->request->data['NetworkSwitch']['site_id']; // weird to have to do this manually
                $this->Site->saveField('network_switch_id', $this->NetworkSwitch->id);
                
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
    
    public function getSwitchForSite() {
        //$site_id = $this->request->data['NetworkRadio']['site_id'];
        
        // get the Site the user selected
        $this->loadModel('Site', $this->request->data['NetworkRadio']['site_id']);
        $this->Site->id = $this->request->data['NetworkRadio']['site_id'];
                
        // now get the NetworkSwitch on that site
        // $network_switch_id = $this->Site->field('network_switch_id');
        $this->loadModel('NetworkSwitch', $this->Site->field('network_switch_id'));
        $this->NetworkSwitch->id = $this->Site->field('network_switch_id');
        //$this->NetworkSwitch->read($this->NetworkSwitch->id,null);
        
        // now load the SwitchType
        $this->loadModel('SwitchType', $this->NetworkSwitch->field('switch_type_id'));
        $this->SwitchType->id = $this->NetworkSwitch->field('switch_type_id');

        $networkswitches = array();        
        if ( $this->NetworkSwitch->field('name') != null ) { 
            // now load the SwitchType
            $this->loadModel('SwitchType', $this->NetworkSwitch->field('switch_type_id'));
            $this->SwitchType->id = $this->NetworkSwitch->field('switch_type_id');

            $ports = $this->SwitchType->field('ports');
            // switches are labeled 1 to N
            for ($i = 1; $i <= $ports; $i++) {
                //$switchports[$i] = $i . " switch id: ".$switch_id ." ports ".$ports."";
                $networkswitches[$i] = $this->NetworkSwitch->field('name') . ' #'.$i;
                //$networkswitches[$i] = 'Port '.$i;
            }
        } else {
            $networkswitches[0] = $this->Site->field('site_name').' has no switch';
        }
        
//        // $networkswitches[$this->NetworkSwitch->id] = $this->NetworkSwitch->field('name').' ('.$this->SwitchType->field('ports').')';
//        $networkswitches[0] = 'Site ID: ' . $this->Site->id;
//        $networkswitches[1] = 'Switch ID: ' . $network_switch_id;
//        $networkswitches[2] = 'Ports: ' . $ports;
        
        $this->set('network_switch_id',$this->NetworkSwitch->id);
        $this->set('networkswitches',$networkswitches);
        $this->layout = 'ajax';
    }
    
    /*
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
    */
    
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

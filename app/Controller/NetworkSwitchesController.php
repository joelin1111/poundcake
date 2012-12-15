<?php
/**
 * Controller for network switches.
 *
 * This is a very basic controller to add/view/update/delete antenna types.
 * These tasks would typically be performed by a user with administrative level
 * permissions within Poundcake.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Controller
 * @since         NetworkSwitchesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class NetworkSwitchesController extends AppController {

    /*
     * MyHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array('MyHTML');
    
    /*
     * Main listing for all NetworkSwitches
     */
    public function index() {
        // begin search stuff
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
    
    /*
     * View an existing NetworkSwitch
     */
    public function view($id = null) {
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
            throw new NotFoundException('Invalid switch');
        }
        $this->set('networkswitch', $this->NetworkSwitch->read(null, $id));        
        $this->checkSnmp(); // check if there is custom SNMP data on this item
    }

    /*
     * Add a new NetworkSwitch
     */
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

                $this->Session->setFlash('The switch has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The switch could not be saved. Please, try again.');
            }
        }
        $this->getSnmpTypes();
    }

    /*
     * Edit an existing NetworkSwitch
     */
    public function edit($id = null) {
        $this->getSwitchTypes();
        $this->getAllSitesForProject();
        $this->NetworkSwitch->id = $id;
        
        if (!$this->NetworkSwitch->exists()) {
                throw new NotFoundException('Invalid switch');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkSwitch->save($this->request->data)) {
                // save it back to the site to which it's associated
                $this->loadModel('Site', $this->request->data['NetworkSwitch']['site_id']);
                $this->Site->id = $this->request->data['NetworkSwitch']['site_id']; // weird to have to do this manually
                $this->Site->saveField('network_switch_id', $this->NetworkSwitch->id);
                
                $this->Session->setFlash('The switch has been saved.');
                $this->redirect(array('action' => 'view',$this->NetworkSwitch->id));
            } else {
                $this->Session->setFlash('Error!  The switch could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->NetworkSwitch->read(null, $id);
        }
        $this->getSnmpTypes();
    }

    /*
     * Delete an existing NetworkSwitch
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        
        $this->NetworkSwitch->id = $id;
        if (!$this->NetworkSwitch->exists()) {
            throw new NotFoundException('Invalid switch');
        }
        if ($this->NetworkSwitch->delete()) {
            $this->Session->setFlash('Switch deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Switch was not deleted.');
        $this->redirect(array('action' => 'index'));
    }
    
    /*
     * Set an array of SwitchTypes
     */
    function getSwitchTypes() {
        $this->set('switchtypes',$this->NetworkSwitch->SwitchType->find('list',
            array(
                'order' => array(
                    'SwitchType.ports ASC'
            )))
        );
    }
    
    /*
     * Save an array of SNMP types the project may be using
     */
    private function getSnmpTypes() {
        $this->set('snmptypes',$this->NetworkSwitch->SnmpType->find('list',
            array(
                'order' => array(
                    'SnmpType.name'
            )))
        );
    }
    
    /*
     * Get the assigned Switch for a given site
     */
    public function getSwitchForSite() {
        // revisit: site_id should probably come in as an argument
        
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
        
        $this->set('network_switch_id',$this->NetworkSwitch->id);
        $this->set('networkswitches',$networkswitches);
        $this->layout = 'ajax';
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
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

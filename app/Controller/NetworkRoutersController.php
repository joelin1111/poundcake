<?php
/**
 * Controller for network routers.
 *
 * This is a controller to add/view/update/delete network routers.
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
 * @since         NetworkRoutersController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('NetworkDeviceController', 'Controller');

class NetworkRoutersController extends NetworkDeviceController {

    /*
     * MyHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array('MyHTML');
    
    /*
     * Custom pagination, sort order on index listing
     */
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkRouter.name' => 'asc'
        )
    );
    
    /*
     * Main listing for all NetworkRouters
     */
    public function index() {
        // begin search stuff\
        $name_arg = "";
        if (isset($this->passedArgs['NetworkRouter.name'])) {
            $name_arg = str_replace('*','%',$this->passedArgs['NetworkRouter.name']);
        }
        
        // if no argument was passed, default to a wildcard
        if ($name_arg == "") {
            $name_arg = '%';
        }
        
        $conditions = array(
            'AND' => array(
                'NetworkRouter.name LIKE' => $name_arg,
                // only show routers for the currently selected project
                // saved as a session variable
                'Site.project_id' => $this->Session->read('project_id')
            ),
        );
        
        $this->paginate = array(
            'NetworkRouter' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                'order' => array(
                    'NetworkRouter.name' => 'asc',
                ),
            ));
        //$this->NetworkRouter->recursive = 1;
        $networkrouters = $this->paginate('NetworkRouter');
//        debug( $networkrouters );
        //$this->set('networkrouters',$data);
        $this->set(compact('networkrouters'));
    }

    public function view($id = null) {
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
            throw new NotFoundException('Invalid router');
        }
         
        $this->checkSnmp(); // check if there is custom SNMP data on this item
        $networkrouter = $this->NetworkRouter->read(null, $id);
        
        // retrieve the username of the person who provisioned this device
        if (isset($this->NetworkRadio->data['NetworkRadio']['foreign_id'])) {
            $this->loadModel('User');
            $this->User->recursive = -1;
            $this->User->id = $this->NetworkRouter->data['NetworkRadio']['provisioned_by'];
            $user = $this->User->read();
            $provisioned_by_name = $user['User']['username'];
            $checked = $this->NetworkRouter->data['NetworkRouter']['checked'];
        } else {
            $provisioned_by_name = "";
            $checked = "";
        }
        
        $this->set(compact( 'networkrouter', 'provisioned_by_name', 'checked' ));        
    }

    public function add() {
        $this->getRouterTypes();
        $this->getAllSitesForProject();
        
        if ($this->request->is('post')) {
            $this->NetworkRouter->create();
            if ($this->NetworkRouter->save($this->request->data)) {
                // see comments in edit
                $this->Site->id = $this->request->data['Site']['id']; 
                $this->Site->saveField('network_router_id', $this->NetworkRouter->id);
                
                $this->Session->setFlash('The router has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The router could not be saved. Please, try again.');
            }
        }
        $this->getSnmpTypes();
        $project_id = $this->Session->read('project_id');
        $this->set(compact('project_id'));
    }

    public function edit($id = null) {
        $this->NetworkRouter->id = $id;
        
        if (!$this->NetworkRouter->exists()) {
                throw new NotFoundException('Invalid router');
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkRouter->save($this->request->data)) {
                // why do have to do this manually?
                // I have tried save/saveAll/saveAssociated/array('deep' => true)
                // either I have the relationship between Site and Router totally
                // wrong or there's some other issue
                // I am manually saving the radio
                $this->loadModel('Site');
                $this->Site->id = $this->request->data['NetworkRouter']['old_site_id'];
                $this->Site->saveField('network_router_id', null, false );
                $this->Site->id = $this->request->data['Site']['id']; 
                $this->Site->saveField('network_router_id', $this->NetworkRouter->id, false);
                
                $this->Session->setFlash('The router has been saved.');
                $this->redirect(array('action' => 'view',$this->NetworkRouter->id));
            } else {
                $this->Session->setFlash('Error!  The router could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->NetworkRouter->read(null, $id);
        }
        $old_site_id = $this->NetworkRouter->data['Site']['id'];
        $this->getAllSitesForProject();
        $this->getRouterTypes();
        $this->getSnmpTypes();
        $project_id = $this->Session->read('project_id');
        $this->set(compact('old_site_id','project_id'));
    }

    function getRouterTypes() {
        $this->set('routertypes',$this->NetworkRouter->RouterType->find('list',
            array(
                'order' => array(
                    'RouterType.manufacturer ASC'
            )))
        );
    }
    
    /*
     * Save an array of SNMP types the project may be using
     */
    private function getSnmpTypes() {
        $this->set('snmptypes',$this->NetworkRouter->SnmpType->find('list',
            array(
                'order' => array(
                    'SnmpType.name'
            )))
        );
    }
    /*
     * Delete an existing NetworkRouter
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
                throw new NotFoundException('Invalid router');
        }
        if ($this->NetworkRouter->delete()) {
                $this->Session->setFlash('Router deleted.');
                $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Router was not deleted.');
        $this->redirect(array('action' => 'index'));
    }

    /*
     * Provisions the device into the monitoring system.
     * @see Identical functions in NetworkSwitch, NetworkRouter, NetworkRadio
     */
    public function provision( $id = null ) {        
        $this->NetworkRouter->read(null, $id);
        $name = $this->NetworkRouter->data['NetworkRouter']['name'];
        // $type = $this->NetworkRadio->data['RadioType']['name'];
        
        $ip_addr = $this->NetworkRouter->data['NetworkRouter']['ip_address'];
        $foreign_id = parent::provision_node( $name, $ip_addr, true );
        
        if ( !is_null( $foreign_id ) ) {
            $this->NetworkRouter->saveField('foreign_id', $foreign_id);
            $this->Session->setFlash('Provisioned router.  Foreign ID '.$foreign_id);
            
        } else {
            $this->Session->setFlash('Error provisioning router.');
        }
        $this->redirect(array('action' => 'view',$this->NetworkRouter->id));
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

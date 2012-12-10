<?php
/**
 * Controller for antenna types.
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
 * @since         AntennaTypesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

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
                // only show radios for the currently selected project
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
        $this->NetworkRouter->recursive = 1;
        $data = $this->paginate('NetworkRouter');
        $this->set('networkrouters',$data);
    }

    public function view($id = null) {
        $this->NetworkRouter->id = $id;
        if (!$this->NetworkRouter->exists()) {
            throw new NotFoundException(__('Invalid router'));
        }
        $this->set('networkrouter', $this->NetworkRouter->read(null, $id));
    }

    public function add() {
        $this->getRouterTypes();
        $this->getAllSitesForProject();
        
        if ($this->request->is('post')) {
            $this->NetworkRouter->create();
            if ($this->NetworkRouter->save($this->request->data)) {
                $this->Site->id = $this->request->data['NetworkRouter']['site_id']; // weird to have to do this manually
                $this->Site->saveField('network_router_id', $this->NetworkRouter->id);
                
                $this->Session->setFlash(__('The router has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The router could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->NetworkRouter->id = $id;
        $this->getAllSitesForProject();
        $this->getRouterTypes();
        
        if (!$this->NetworkRouter->exists()) {
                throw new NotFoundException(__('Invalid router'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->NetworkRouter->save($this->request->data)) {
                    $this->Site->id = $this->request->data['NetworkRouter']['site_id']; // weird to have to do this manually
                    $this->Site->saveField('network_router_id', $this->NetworkRouter->id);
                
                    $this->Session->setFlash(__('The router has been saved'));
                    $this->redirect(array('action' => 'view',$this->NetworkRouter->id));
                } else {
                    $this->Session->setFlash(__('The router could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->NetworkRouter->read(null, $id);
        }
    }

    function getRouterTypes() {
        $this->set('routertypes',$this->NetworkRouter->RouterType->find('list',
            array(
                'order' => array(
                    'RouterType.manufacturer ASC'
            )))
        );
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

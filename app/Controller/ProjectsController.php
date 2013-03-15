<?php
/**
 * Controller for projects.
 *
 * This is a very basic controller to add/view/update/delete projects.  Projects
 * are the highest level categorization of sites; Sites may be long to one
 * Project.  Users are then granted permissions to access a project.
 * 
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
 * @since         ProjectsController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class ProjectsController extends AppController {

    /*
     * Helpers we use:
     * - PoundcakeHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array(
        'PoundcakeHTML'
    );
    
    /*
     * Main listing for all Projects
     */
    public function index() {
        $this->Project->recursive = 0;
        $this->set('projects', $this->paginate());
    }

    /*
     * View an existing project.
     */
    public function view($id = null) {
        $this->Project->id = $id;
        $this->Project->recursive = 2; // we also want users on this project and their roles
        if (!$this->Project->exists()) {
            throw new NotFoundException('Invalid project');
        }
        
        $project =  $this->Project->read(null, $id);
        
        // we're going to make it easy on the view, and prepare a nice, tidy
        // array of users on this project and their roles
        $users = $this->Project->read(null, $id);
        $project_users = array();
        foreach ( $users['ProjectMembership'] as $user ) {
            //var_dump( $user );
            $this->loadModel('Role');
            $this->Role->id = $user['role_id'];
            $role = $this->Role->read();            
            // var_dump( $role );
            $uid = $user['User']['id'];
            $u = array(
                'username' => $user['User']['username'],
                'role' => $role['Role']['name']
            );
            
            array_push( $project_users, $u );
        }
        
        $this->set(compact('project','project_users'));
    }

    /*
     * Append http:// to an URL if it is missing, also remove "/" from the end
     */
    private function cleanUrl( $url ) {
        if ( $url != "" ) {
            // if there is no http, append it
            // if there is https, skip this
            if ((stripos($url, 'http://') !== 0) && (stripos($url, 'https://') !== 0)) {
                $url = 'http://' . $url;
            }
        }
        // remove / from the end of the URL
        $url = preg_replace('{/$}', '', $url);        
        return $url;
    }
    /*
     * Add a new project
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->Project->create();
            // set http if it was not set
            $this->request->data['Project']['monitoring_system_url'] = $this->cleanUrl( $this->request->data['Project']['monitoring_system_url'] );
            // see beforeSave callback in the Project model
            if ($this->Project->save($this->request->data)) {
                $this->Session->setFlash('The project has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The project could not be saved. Please, try again.');
            }
        }
        $this->getSnmpTypes();
        $this->getMonitoringSystemTypes();
        // projects default to San Francisco
        $default_lat = '37.7750';
        $default_lon = '-122.4183';
        $this->set(compact('default_lat','default_lon'));
    }

    public function ipspaces() {
        // this all sort of belongs in the IP spaces controller, but it's also a
        // project-level thing that only admins should handle
        $this->loadModel('IpSpace');
        $this->IpSpace->recursive = 0;
        $fields = array('DISTINCT IpSpace.project_id', 'IpSpace.id', 'IpSpace.name', 'IpSpace.ip_address', 'IpSpace.cidr', 'Project.name');
        $this->paginate = array(
            'fields' => $fields,
            'group' => array('IpSpace.project_id')
        ); 
        $this->set('ip_spaces', $this->paginate('IpSpace'));        
    }
    
    public function root( $parent_id = null ) {
        // as with function ipspaces -- this probably belongs in the IP Spaces
        // controller
        if ($this->request->is('post')) {
             $this->loadModel('IpSpace');
             $this->IpSpace->create();
            if ($this->IpSpace->save($this->request->data)) {
                $this->Session->setFlash('The Root IP Space has been created.');
                $this->redirect(array('action' => 'ipspaces'));
            } else {
                $this->Session->setFlash('Error!  The Root IP Space could not be saved. Please, try again.');
            }
        }
        $this->getCidrs( 7 );
        // $this->getProjects();
        $this->set('projects',$this->Project->find('list',
            array(
                'order' => array(
                    'Project.name'
            )))
        );
    }
    
    /*
     * Edit an existing project
     */
    public function edit($id = null) {
        $this->Project->id = $id;
        $this->Project->recursive = 2; // we also want users on this project and their roles
        if (!$this->Project->exists()) {
            throw new NotFoundException('Invalid project');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            // set http if it was not set
            $this->request->data['Project']['monitoring_system_url'] = $this->cleanUrl( $this->request->data['Project']['monitoring_system_url'] );            
            // see beforeSave callback in the Project model
            
//            echo '<pre>';
//            print_r( $this->request->data );
//            echo '</pre>';
            //die;
            //
            if ($this->Project->save($this->request->data )) {
            //if ( $this->Project->save( $this->request->data , array('deep' => true)) ) {
            // if ($this->Project->saveAll( $this->request->data, array('deep' => true) )) {
                //$this->loadModel('ProjectRoles');
                //$this->Project->ProjectRoles->saveAll( $this->request->data );
                //echo "after saveAll";
                //die;
                $this->Session->setFlash('The project has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The project could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->Project->read(null, $id);
        }
        $this->getSnmpTypes();
        $this->getMonitoringSystemTypes();
        $this->getRoles();
    }
    
    /*
     * Get all the roles defined in the system (except the admin)
     */
    public function getRoles() {
        $this->loadModel('Role');
        $roles = $this->Role->find('list');
        array_shift( $roles ); // remove the 0th element, which is the admin role
        $this->set(compact('roles'));
    }
    
    /*
     * Delete an existing project
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Project->id = $id;
        if (!$this->Project->exists()) {
            throw new NotFoundException('Invalid project');
        }
        if ($this->Project->delete()) {
            $this->Session->setFlash('Project deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Project was not deleted.  Check for dependencies, such as Sites on the Project.');
        $this->redirect(array('action' => 'index'));
    }
        
    /*
     * Save an array of SNMP types the project may be using
     */
    private function getSnmpTypes() {
        $this->set('snmptypes',$this->Project->SnmpType->find('list',
            array(
                'order' => array(
                    'SnmpType.name'
            )))
        );
    }
    
    /*
     * Save an array of Monitor System Types the project may be using
     */
    private function getMonitoringSystemTypes() {
        $this->set('monitoringSystemTypes',$this->Project->MonitoringSystemType->find('list',
            array(
                'order' => array(
                    'MonitoringSystemType.name'
            )))
        );
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

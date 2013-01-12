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
     * - MyHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array(
        'MyHTML'
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
        if (!$this->Project->exists()) {
                throw new NotFoundException('Invalid project');
        }
        $this->set('project', $this->Project->read(null, $id));
    }

    /*
     * Add a new project
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->Project->create();
            if ($this->Project->save($this->request->data)) {
                $this->Session->setFlash('The project has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The project could not be saved. Please, try again.');
            }
        }
        $this->getSnmpTypes();
        $this->getMonitoringSystemTypes();
    }

    /*
     * Edit an existing project
     */
    public function edit($id = null) {
        $this->Project->id = $id;
        if (!$this->Project->exists()) {
            throw new NotFoundException('Invalid project');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Project->save($this->request->data)) {
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
        $this->Session->setFlash('Error!  Project was not deleted.');
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

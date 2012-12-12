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
/**
 * ServiceProviders Controller
 *
 * @property Organization $Organization
 */
class OrganizationsController extends AppController {

    public function index() {
        $this->Organization->recursive = 0;
        $this->set('organizations', $this->paginate());
    }
    
    function getContacts() {
        $this->set('contacts',$this->Organization->Contact->find('list'));        
    }

    public function view($id = null) {
        $this->Organization->id = $id;
        
        if (!$this->Organization->exists()) {
                throw new NotFoundException(__('Invalid organization'));
        }
        $this->set('organization', $this->Organization->read(null, $id));
        
    }

    public function add() {
        $this->getUsersAssignedProjects();
        if ($this->request->is('post')) {
            $this->Organization->create();
            if ($this->Organization->save($this->request->data)) {
                $this->Session->setFlash('The organization has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The organization could not be saved. Please, try again.');
            }
        }
    }

    public function edit($id = null) {
        $this->Organization->id = $id;
        $this->getUsersAssignedProjects();
        if (!$this->Organization->exists()) {
            throw new NotFoundException(__('Invalid organization'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Organization->save($this->request->data)) {
                $this->Session->setFlash('The organization has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The organization could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->Organization->read(null, $id);
        }
    }

    function getUsersAssignedProjects() {
        // return only the projects this user has access to
        $this->loadModel('User');
        $uid = CakeSession::read("Auth.User.id");
        $options['joins'] = array(
            array('table' => 'projects_users',
                'alias' => 'ProjectsUser',
                'type' => 'INNER',
                'conditions' => array(
                    //"Site.project_id  =  Project.id",
                    'ProjectsUser.user_id =  '.$uid,
                    'ProjectsUser.project_id = Project.id'
                )
            )
        );
        $projects = $this->User->Project->find('list', $options);
        $this->set('projects',$projects);
        return $projects;
    }
    
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Organization->id = $id;
        if (!$this->Organization->exists()) {
            throw new NotFoundException('Invalid organization');
        }
        if ($this->Organization->delete()) {
            $this->Session->setFlash('Organization deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Organization was not deleted.');
        $this->redirect(array('action' => 'index'));
    }

    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

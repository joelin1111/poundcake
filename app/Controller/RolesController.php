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

class RolesController extends AppController {

    public function index() {
        $this->Role->recursive = 0;
        $this->set('roles', $this->paginate());
    }

    public function view($id = null) {
        $this->Role->id = $id;
        if (!$this->Role->exists()) {
                throw new NotFoundException(__('Invalid role'));
        }
        $this->set('role', $this->Role->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->Role->create();
            if ($this->Role->save($this->request->data)) {
                $this->Session->setFlash(__('The role has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The role could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->Role->id = $id;
        if (!$this->Role->exists()) {
                throw new NotFoundException(__('Invalid role'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Role->save($this->request->data)) {
                $this->Session->setFlash(__('The role has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The role could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->Role->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->Role->id = $id;
        if (!$this->Role->exists()) {
            throw new NotFoundException(__('Invalid role'));
        }
        if ($this->Role->delete()) {
            $this->Session->setFlash(__('Role deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Role was not deleted'));
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

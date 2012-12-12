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

class RadioModesController extends AppController {

    public function index() {
        $this->RadioMode->recursive = 0;
        // yes, I do realize that the plural of equipment is equipment
        $this->set('radiomodes', $this->paginate());
    }

    public function view($id = null) {
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
                throw new NotFoundException(__('Invalid radio mode'));
        }
        $this->set('radiomode', $this->RadioMode->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->RadioMode->create();
            if ($this->RadioMode->save($this->request->data)) {
                $this->Session->setFlash('The radio mode has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio mode could not be saved. Please, try again.');
            }
        }
    }

    public function edit($id = null) {
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
                throw new NotFoundException('Invalid radio mode');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RadioMode->save($this->request->data)) {
                $this->Session->setFlash('The radio mode has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio mode could not be saved. Please, try again.');
            }
        } else {
                $this->request->data = $this->RadioMode->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RadioMode->id = $id;
        if (!$this->RadioMode->exists()) {
            throw new NotFoundException('Invalid radio mode');
        }
        if ($this->RadioMode->delete()) {
            $this->Session->setFlash('Tower equipment deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Tower equipment was not deleted.');
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

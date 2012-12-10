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

class SwitchTypesController extends AppController {

    public function index() {
        $this->SwitchType->recursive = 0;
        $this->set('switchTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
                throw new NotFoundException(__('Invalid switch type'));
        }
        $this->set('switchType', $this->SwitchType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->SwitchType->create();
            if ($this->SwitchType->save($this->request->data)) {
                $this->Session->setFlash(__('The switch type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The switch type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
            throw new NotFoundException(__('Invalid switch type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->SwitchType->save($this->request->data)) {
                $this->Session->setFlash(__('The switch type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The switch type could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->SwitchType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->SwitchType->id = $id;
        if (!$this->SwitchType->exists()) {
            throw new NotFoundException(__('Invalid switch type'));
        }
        if ($this->SwitchType->delete()) {
            $this->Session->setFlash(__('Power type deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Power type was not deleted'));
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

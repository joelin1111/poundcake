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

class EquipmentSpacesController extends AppController {

    public function index() {
        $this->EquipmentSpace->recursive = 0;
        $this->set('towertypes', $this->paginate());
    }

    public function view($id = null) {
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
                throw new NotFoundException(__('Invalid equipment space'));
        }
        $this->set('towertype', $this->EquipmentSpace->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->EquipmentSpace->create();
            if ($this->EquipmentSpace->save($this->request->data)) {
                $this->Session->setFlash(__('The equipment space has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The equipment space could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
                throw new NotFoundException(__('Invalid equipment space'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->EquipmentSpace->save($this->request->data)) {
                $this->Session->setFlash(__('The equipment space has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The equipment space could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->EquipmentSpace->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->EquipmentSpace->id = $id;
        if (!$this->EquipmentSpace->exists()) {
            throw new NotFoundException(__('Invalid equipment space'));
        }
        if ($this->EquipmentSpace->delete()) {
            $this->Session->setFlash(__('EquipmentSpace deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('EquipmentSpace was not deleted'));
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

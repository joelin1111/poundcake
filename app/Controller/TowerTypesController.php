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

class TowerTypesController extends AppController {

    public function index() {
        $this->TowerType->recursive = 0;
        // yes, I do realize that the plural of equipment is equipment
        $this->set('towerequipments', $this->paginate());
    }

    public function view($id = null) {
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
                throw new NotFoundException(__('Invalid tower type'));
        }
        $this->set('towerequipment', $this->TowerType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->TowerType->create();
            if ($this->TowerType->save($this->request->data)) {
                $this->Session->setFlash(__('The tower type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
                throw new NotFoundException(__('Invalid tower type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->TowerType->save($this->request->data)) {
                $this->Session->setFlash(__('The tower type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The tower type could not be saved. Please, try again.'));
            }
        } else {
                $this->request->data = $this->TowerType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->TowerType->id = $id;
        if (!$this->TowerType->exists()) {
            throw new NotFoundException(__('Invalid tower type'));
        }
        if ($this->TowerType->delete()) {
            $this->Session->setFlash(__('Tower equipment deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Tower equipment was not deleted'));
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

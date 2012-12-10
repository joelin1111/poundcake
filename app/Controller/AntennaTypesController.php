<?php
/**
 * Controller for antenna types.
 *
 * This is a very basic controller to add/view/update/delete antenna types.
 * These tasks would typically be performed by a user with administrative level
 * permissions within Poundcake.
 *
 * PHP 5
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
 * @since         File precedes Poundcake v2.2.1
 * @version       Developed using CakePHP 2.2.3 and PHP 5.4.4
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class AntennaTypesController extends AppController {

    public function index() {
        $this->AntennaType->recursive = 0;
        $this->set('antennaTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->AntennaType->id = $id;
        if (!$this->AntennaType->exists()) {
                throw new NotFoundException(__('Invalid antenna type'));
        }
        $this->set('antennaType', $this->AntennaType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->AntennaType->create();
            if ($this->AntennaType->save($this->request->data)) {
                $this->Session->setFlash(__('The antenna type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The antenna type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->AntennaType->id = $id;
        if (!$this->AntennaType->exists()) {
            throw new NotFoundException(__('Invalid antenna type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->AntennaType->save($this->request->data)) {
                $this->Session->setFlash(__('The antenna type has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The antenna type could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->AntennaType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->AntennaType->id = $id;
        if (!$this->AntennaType->exists()) {
            throw new NotFoundException(__('Invalid antenna type'));
        }
        if ($this->AntennaType->delete()) {
            $this->Session->setFlash(__('Antenna type deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Antenna type was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
        
}

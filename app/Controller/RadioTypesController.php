<?php
/**
 * Controller for radio types.
 *
 * This is a very basic controller to add/view/update/delete radio types.
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
 * @since         RadioTypesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class RadioTypesController extends AppController {

    /*
     * Main listing for all RadioTypes
     */
    public function index() {
        $this->RadioType->recursive = 0;
        $this->set('radioTypes', $this->paginate());
    }
    
    /*
     * View an existing RadioType
     */
    public function view($id = null) {
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
                throw new NotFoundException('Invalid radio type');
        }
        $this->set('radioType', $this->RadioType->read(null, $id));
    }

    /*
     * Add a new RadioType
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->RadioType->create();
            if ($this->RadioType->save($this->request->data)) {
                $this->Session->setFlash('The radio type has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio type could not be saved. Please, try again.');
            }
        }
    }

    /*
     * Edit an existing RadioType
     */
    public function edit($id = null) {
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
            throw new NotFoundException('Invalid radio type');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RadioType->save($this->request->data)) {
                $this->Session->setFlash('The radio type has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio type could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->RadioType->read(null, $id);
        }
    }

    /*
     * Delete an existing RadioType
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RadioType->id = $id;
        if (!$this->RadioType->exists()) {
            throw new NotFoundException('Invalid radio type');
        }
        if ($this->RadioType->delete()) {
            $this->Session->setFlash('Radio type deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Radio type was not deleted.');
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

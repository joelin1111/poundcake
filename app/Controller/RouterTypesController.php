<?php
/**
 * Controller for router types.
 *
 * This is a very basic controller to add/view/update/delete router types.
 * 
 * These tasks would typically be performed by a user with administrative level
 * permissions within Poundcake.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.x.
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
 * @since         RouterTypesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class RouterTypesController extends AppController {

    /*
     * Main listing for all RouterTypes
     */
    public function index() {
        $this->RouterType->recursive = 0;
        $this->set('routerTypes', $this->paginate());
    }

    /*
     * Add a new RouterType
     */
    public function add() {
        if ($this->request->is('post')) {
            // AppController::handleCancel();
            $this->RouterType->create();
            if ($this->RouterType->save($this->request->data)) {
                $this->Session->setFlash('The router type has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The router type could not be saved. Please, try again.');
            }
        }
        parent::getNetworkIntefaceTypes();
    }

    /*
     * Edit an existing RouterType
     */
    public function edit($id = null) {
        $this->RouterType->id = $id;
        if (!$this->RouterType->exists()) {
            throw new NotFoundException('Invalid router type');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RouterType->save($this->request->data)) {
                $this->Session->setFlash('The router type has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The router type could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->RouterType->read(null, $id);
        }
        parent::getNetworkIntefaceTypes();
    }

    /*
     * Delete an existing RouterType
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RouterType->id = $id;
        if (!$this->RouterType->exists()) {
            throw new NotFoundException('Invalid router type');
        }
        if ($this->RouterType->delete()) {
            $this->Session->setFlash('Router type deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Router type was not deleted.');
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

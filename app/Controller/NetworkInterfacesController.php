<?php
/**
 * Controller for network interfaces.
 *
 * This is a very basic controller to add/view/update/delete interface names.
 * 
 * These tasks would typically be performed by a user with administrative level
 * permissions within Poundcake.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.x.
 *
 * Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Controller
 * @since         NetworkInterfacesController introduced in Poundcake v3.0.9
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class NetworkInterfacesController extends AppController {

    /*
     * Custom pagination, sort order on index listing
     */
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkInterface.name' => 'asc'
        )
    );
        
    /*
     * Main listing for all NetworkInterfaces
     */
    public function index() {
        $this->NetworkInterface->recursive = 0;
        $this->set('networkInterfaces', $this->paginate());
    }

    /*
     * View an existing NetworkInterface
     */
    public function view($id = null) {
        $this->NetworkInterface->id = $id;
        if (!$this->NetworkInterface->exists()) {
            throw new NotFoundException('Invalid network interface');
        }
        $this->set('networkInterfaces', $this->NetworkInterface->read(null, $id));
    }

    /*
     * Add a new NetworkInterface
     */
    public function add() {
        if ($this->request->is('post')) {
            // AppController::handleCancel();
            $this->NetworkInterface->create();
            if ($this->NetworkInterface->save($this->request->data)) {
                $this->Session->setFlash('The network interface has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The network interface could not be saved. Please, try again.');
            }
        }
    }

    /*
     * Edit an existing NetworkInterface
     */
    public function edit($id = null) {
        $this->NetworkInterface->id = $id;
        
        if (!$this->NetworkInterface->exists()) {
            throw new NotFoundException('Invalid network interface');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->NetworkInterface->save($this->request->data)) {
                    $this->Session->setFlash('The network interface has been saved.');
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash('Error!  The network interface could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->NetworkInterface->read(null, $id);
        }
    }
    
    /*
     * Delete an existing NetworkInterface
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->NetworkInterface->id = $id;
        if (!$this->NetworkInterface->exists()) {
            throw new NotFoundException('Invalid network interface');
        }
        if ($this->NetworkInterface->delete()) {
            $this->Session->setFlash('Network interface deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  network interface was not deleted.');
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

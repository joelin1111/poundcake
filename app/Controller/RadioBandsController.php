<?php
/**
 * Controller for radio bands.
 *
 * This is a very basic controller to add/view/update/delete radio bands.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.4.
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
 * @since         RadioBandsController was introduced in Poundcake v2.7.0
 * @license       XYZ License
 */

class RadioBandsController extends AppController {

    /*
     * Main listing for all TowerrTypes
     */
    public function index() {
        $this->RadioBand->recursive = 0;
        // yes, I do realize that the plural of equipment is equipment
        $this->set('radiobands', $this->paginate());
    }

    /*
     * View a RadioBand
     */
    public function view($id = null) {
        $this->RadioBand->id = $id;
        if (!$this->RadioBand->exists()) {
            throw new NotFoundException('Invalid radio band');
        }
        $this->set('radioband', $this->RadioBand->read(null, $id));
    }

    /*
     * Add a new RadioBand
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->RadioBand->create();
            if ($this->RadioBand->save($this->request->data)) {
                $this->Session->setFlash('The radio band has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio band could not be saved. Please, try again.');
            }
        }
    }

    /*
     * Edit an existing TowerrType
     */
    public function edit($id = null) {
        $this->RadioBand->id = $id;
        if (!$this->RadioBand->exists()) {
            throw new NotFoundException('Invalid radio band');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->RadioBand->save($this->request->data)) {
                $this->Session->setFlash('The radio band has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio band could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->RadioBand->read(null, $id);
        }
    }

    /*
     * Delete an existing RadioBand
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->RadioBand->id = $id;
        if (!$this->RadioBand->exists()) {
            throw new NotFoundException('Invalid radio band');
        }
        if ($this->RadioBand->delete()) {
            $this->Session->setFlash('Radio band deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Radio band was not deleted.');
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
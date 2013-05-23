<?php
/**
 * Controller for radio types.
 *
 * This is a very basic controller to add/view/update/delete radio types.
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
        $this->getRadioBands();
        $this->getAntennaTypes();
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
        $this->getRadioBands();
        $this->getAntennaTypes();
    }

    /*
     * Save an array of antenna types
     */
    private function getAntennaTypes() {
        $antennaTypes = $this->RadioType->AntennaType->find('list',array('fields'=>array('id','name')));
        $this->set(compact('antennaTypes'));
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
     * Save an array of radio bands
     */
    private function getRadioBands() {
        $this->set('radiobands', $this->RadioType->RadioBand->find('list'));
    }
    
    /*
     * Save an array of frequencies for chosen radio's RadioType
     * 
     * This is called by jQuery when the user changes the radio type on the
     * NetworkRadio add/edit page.
     */
    public function getFrequenciesForRadioType() {
        // get the RadioType the user selected
        $this->loadModel('RadioType');
        $this->RadioType->id = $this->request->data['NetworkRadio']['radio_type_id'];
        // call the RadioType model function getFrequencies to ge the list of
        // frequencies for the selected radio's RadioType
        $frequencies = $this->RadioType->getFrequencies( $this->RadioType->field('radio_band_id') );
        $this->set( 'frequencies', $frequencies );
        $this->layout = 'ajax';
    }
    
    /*
     * Save an array of antenna types for chosen radio's RadioType
     * 
     * This is called by jQuery when the user changes the radio type on the
     * NetworkRadio add/edit page.
     */
    public function getAntennasForRadioType() {
         // this is basiclly a duplicate of getantennaTypes in the NetworkRadio controller
        $radio_type_id = $this->request->data['NetworkRadio']['radio_type_id'];
        $antennatypes = $this->RadioType->getAntennas( $radio_type_id );
        //var_dump( $antennatypes );die;
        //$antennatypes[0] = 'foo';$antennatypes[1] = 'bar';
        $this->set(compact('antennatypes'));
        $this->layout = 'ajax';
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

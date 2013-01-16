<?php
/**
 * Controller for network radios.
 *
 * This controller is used to add/view/update/delete network radios.
 * 
 * There are a variety of utility functions in addition to the basic CRUD
 * functions.  And of major note, in order to make NetworkRadios link to other
 * NetworkRadios, both point-point and point-multipoint, this controller
 * leverages MySQL triggers and stored procedures.
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
 * @since         NetworkRadiosController precedes Poundcake v2.2.1
 * @license       XYZ License
 * @see           MySQL triggers, stored procedures
 */

// App::uses('AppController', 'NetworkDeviceController', 'Controller');

// class NetworkRadiosController extends AppController {

App::uses('NetworkDeviceController', 'Controller');

class NetworkRadiosController extends NetworkDeviceController {

    /*
     * MyHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array('MyHTML');
    
    /*
     * Custom pagination, sort order on index listing
     */
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkRadio.name' => 'asc'
        )
    );

    /*
     * Main listing for all NetworkRadios
     */
    public function index() {
        // begin search stuff
        $name_arg = "";
        if (isset($this->passedArgs['NetworkRadio.name'])) {
            $name_arg = str_replace('*','%',$this->passedArgs['NetworkRadio.name']);
        }
        
        // if no argument was passed, default to a wildcard
        if ($name_arg == "") {
            $name_arg = '%';
        }
        
        $conditions = array(
            'AND' => array(
                'NetworkRadio.name LIKE' => $name_arg,
                // only show radios for the currently selected project
                // saved as a session variable
                'Site.project_id' => $this->Session->read('project_id')
            ),
        );
        
        $this->paginate = array(
            'NetworkRadio' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                /*'contain' => array(
                    'Site',
                    'RadioType'
                ),*/
                'order' => array(
                    'NetworkRadio.name' => 'asc',
                ),
            ));
        $this->NetworkRadio->recursive = 1;
        $data = $this->paginate('NetworkRadio');
        $this->set('networkradios',$data);
    }

    /*
     * View an existing NetworkRadio
     * @see MySQL stored procedure sp_get_remote_links
     */
    public function view($id = null) {
        $this->NetworkRadio->id = $id;
        
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException('Invalid radio');
        }
        // get all the radios this radio may be linked to
        $query = 'call sp_get_remote_links('.$id.')';
        $links = $this->NetworkRadio->query( $query );
        
        $this->set('networkradio', $this->NetworkRadio->read(null, $id));
        $ip_addresses = $this->getAllIPAddresses($this->NetworkRadio->field('name'));
        $this->set(compact('ip_addresses'));
        
        if ( $this->NetworkRadio->field('sector') > 0 ) {
            // Cake and MySQL tinyint don't seem accessible from the view, even
            // when cast to (bool) or (int) -- so set a flag here that this is
            // a sector radio
            $sector = true;
            $link_distance = 0;
            $true_azimuth = $this->NetworkRadio->field('true_azimuth');
            $mag_azimuth = $this->NetworkRadio->field('mag_azimuth');
            
        } else {
            $sector = false;
            $u = 0;
            $declination = $this->NetworkRadio->data['Site']['declination'];
            foreach ($links as $link) {
                $true_azimuth = 0;
                $link_distance = 0;
                $mag_azimuth = 0;            
                
                $id = $this->NetworkRadio->field('id');
                $link_id = $link['radios_radios']['dest_radio_id'];
                
                $link['network_radios']['link_distance'] = $this->NetworkRadio->getLinkDistance($id, $link_id);
                
                $true_azimuth = $this->NetworkRadio->getRadioBearing($id, $link_id);
                $link['network_radios']['true_azimuth'] = $true_azimuth;

                if ($true_azimuth > 0) {
                    $mag_azimuth = $true_azimuth - $declination;
                }               
                $link['network_radios']['mag_azimuth'] = $mag_azimuth;
                
                // save it back to the links array
                $links[$u] = $link;
                $u++;
            }
        }
        $this->set('links', $links);
        $this->set('sector',$sector);
        $this->checkSnmp(); // check if there is custom SNMP data on this item
        
        $i = $this->NetworkRadio->field('ip_address');
//        debug( $this->NetworkRadio->data );
        //$this->NetworkRadio->decodeIPv4Address( $i );
//        $this->NetworkRadio->data['NetworkRadio']['ip_address'] = parent::decodeIPv4Address( $i );
//        debug( $this->NetworkRadio->data );
        
    }

    /*
     * Set an array of allowed radio types (preconfigured by an administrator).
     */
    function getRadioTypes() {
        $this->set('radiotypes',$this->NetworkRadio->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    /*
     * Set an array of antenna types (preconfigured by an administrator).
     */
    function getAntennaTypes() {
        $this->set('antennatypes',$this->NetworkRadio->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    
    /*
     * Set an array of allowed radio modes (preconfigured by an administrator).
     */
    function getRadioModes() {
        $this->set('radiomodes',$this->NetworkRadio->RadioMode->find('list',
            array(
                'order' => array(
                    'RadioMode.name ASC'
            )))
        );
    }
    
    /*
     * Save an array of SNMP types the project may be using
     */
    private function getSnmpTypes() {
        $this->set('snmptypes',$this->NetworkRadio->SnmpType->find('list',
            array(
                'order' => array(
                    'SnmpType.name'
            )))
        );
    }
    
    /*
     * Set the NetworkSwitch for this radio.  Note this function is only
     * called when the add/edit page is first loaded.
     */
    function getNetworkSwitch( $id ) {
        /*
        previously we were just returning all switches in the database, e.g.
        
        $this->set('networkswitches',$this->NetworkRadio->NetworkSwitch->find('list',
            array(
                'order' => array(
                    'NetworkSwitch.name ASC'
            )))
        );
        */
        
        // this is basically now a duplicate of getSwitchForSite in NetworkSwitchesController
        // should probably move this to a model function on NetworkSwitch?        
        $this->loadModel('Site', $id);
        $this->Site->id = $id;
                
        // now get the NetworkSwitch on that site
        // $network_switch_id = $this->Site->field('network_switch_id');
        $this->loadModel('NetworkSwitch', $this->Site->field('network_switch_id'));
        $this->NetworkSwitch->id = $this->Site->field('network_switch_id');
        
        $networkswitches = array();        
        if ( $this->NetworkSwitch->field('name') != null ) {
            
            // get an array of other radios that are attached to this switch
            $this->NetworkSwitch->NetworkRadio->recursive = -1; // we only need radio data
            $radios_on_switch = $this->NetworkSwitch->NetworkRadio->findAllByNetworkSwitchId( $this->NetworkSwitch->id );
            // reswizzle the array so that we can search it easier below
            // and denote which ports are available or occupied
            $unavailable_ports = array();
            foreach ( $radios_on_switch as $r ) {
                $unavailable_ports[$r['NetworkRadio']['switch_port']] = $r['NetworkRadio']['name'];
            }
  
            // now load the SwitchType
            $this->loadModel('SwitchType', $this->NetworkSwitch->field('switch_type_id'));
            $this->SwitchType->id = $this->NetworkSwitch->field('switch_type_id');
            $ports = $this->SwitchType->field('ports');
            
            // switches are labeled 1 to N not 0 to N
            for ($i = 1; $i <= $ports; $i++) {
                // if something is already on the switch at that port, then denote
                // that it's not available by showing the radio on that port
                if ( isset($unavailable_ports[$i] )) {
                    $label = $unavailable_ports[$i]; //['NetworkRadio']['name'];
                } else {
                    // otherwise it's free
                    $label = 'Available ('.$this->NetworkSwitch->field('name') . ' #'.$i.')';
                }
                $networkswitches[$i] = $label;
            }
        } else {
            $networkswitches[0] = $this->Site->field('name').' has no switch';
        }
        $this->set('network_switch_id',$this->NetworkSwitch->id);
        $this->set('networkswitches',$networkswitches);        
    }
    
    /*
     * Add a new NetworkRadio
     */
    public function add() {
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getRadioModes();
        $this->getFrequencies(); // for the frequency dropdown
        $first_site = $this->getAllSitesForProject();
        $this->getNetworkSwitch($first_site);
        
        if ($this->request->is('post')) {
            $this->NetworkRadio->create();            
            $this->request->data = $this->setMagAzimuth($this->request->data);
            if ($this->NetworkRadio->save($this->request->data)) {
                $this->Session->setFlash('The radio has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The radio could not be saved. Please, try again.');
            }
        }
        $this->getSnmpTypes();
    }

    /*
     * Edit an existing NetworkRadio
     */
    public function edit($id = null) {
        $this->NetworkRadio->id = $id;
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getRadioModes();
        $this->getFrequencies(); // for the frequency dropdown
        $this->getAllSitesForProject();
        $this->getNetworkSwitch($this->NetworkRadio->field('site_id'));
        
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException('Invalid radio');
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            $data = $this->request->data;
            $this->request->data = $this->setMagAzimuth($this->request->data);
            
            if ($this->NetworkRadio->save($this->request->data)) {
                $this->Session->setFlash('The radio has been saved.');
                $this->redirect(array('action' => 'view',$this->NetworkRadio->id));
            } else {
                $this->Session->setFlash('Error!  The radio could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->NetworkRadio->read(null, $id);
        }
        $this->getSnmpTypes();
    }
    
    /*
     * Pull radio configuration from linked radio
     * - SSID
     * - Frequency
     * - Invert radio mode of the source radio
     */
    function pullConfig( $to, $from ) {
        $this->NetworkRadio->recursive = -1; // we don't need related model data
        $to_radio = $this->NetworkRadio->read( null, $to );
        $from_radio = $this->NetworkRadio->read( null, $from );
        //$this->pcdebug( $to_radio, false );
        //$this->pcdebug( $from_radio, false );
        // and now the dirty work!
        // overwrite the radio''s configuration from the other radio's data
        $to_radio['NetworkRadio']['ssid'] = $from_radio['NetworkRadio']['ssid'];
        $to_radio['NetworkRadio']['frequency'] = $from_radio['NetworkRadio']['frequency'];
        
        // this one is a bit tricker, as we need to get the opposite radio mode
        $this->loadModel('RadioMode');
        $radiomode = $this->RadioMode->read( null, $from_radio['NetworkRadio']['radio_mode_id'] );
        $to_radio['NetworkRadio']['radio_mode_id'] = $radiomode['RadioMode']['inverse_mode_id'];
        
        //$this->pcdebug( $to_radio, false );
        $this->NetworkRadio->save( $to_radio );
        if ($this->NetworkRadio->save( $to_radio )) {
            $this->Session->setFlash('The radio\'s configiraton has been updated.');
            $this->redirect(array('action' => 'view',$this->NetworkRadio->id));
        } else {
            $this->Session->setFlash('Error!  The radio\'s configiraton could not be updated. Please, try again.');
        }
        //die;
    }
    
    /*
     * Set the magnetic azimuth on a NetworkRadio
     */
    public function setMagAzimuth($data) {
        if (isset($data['NetworkRadio']['true_azimuth'])) {
            $this->loadModel('Site',$data['NetworkRadio']['site_id']);
            $declination = $this->Site->getDeclination($this->Site->field('lat'), $this->Site->field('lon'));
            $data['NetworkRadio']['mag_azimuth'] = $data['NetworkRadio']['true_azimuth'] - $declination;
        }
        return $data;
    }
    
    /*
     * Delete a NetworkRadio
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        
        $this->NetworkRadio->id = $id;
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException('Invalid radio');
        }

        if ($this->NetworkRadio->delete()) {
            $this->Session->setFlash('Radio deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Radio was not deleted.');
        $this->redirect(array('action' => 'index'));
    }
    
    /*
     * Set an array of frequencies for the select dropdown.  
     * Note Ubiquity devices support 4920 MHz to 6100 MHz in 5 MHz increments
     * and that 4920 starting value is hard-coded.
     */
    private function getFrequencies() {
        $frequencies = array();
        $frequency = 4920;        
        for ($i = 0; $i <= 236; ++$i) {
            // we want the key and value in this array be the same here
            $frequencies[$frequency] = $frequency;
            $frequency += 5;
        }
        $this->set('frequencies',$frequencies);
    }
    
    public function provision( $id = null ) {        
        // $this->NetworkRadio->id = $id;
        $this->NetworkRadio->read(null, $id);
        $name = $this->NetworkRadio->data['NetworkRadio']['name'];
        $type = $this->NetworkRadio->data['RadioType']['name'];
        $ip_addr = $this->NetworkRadio->data['NetworkRadio']['ip_address'];
        $foreign_id = parent::provision_node( $name, $type, $ip_addr, true );
        
        if ( !is_null( $foreign_id ) ) {
            $this->NetworkRadio->saveField('foreign_id', $foreign_id);
            $this->Session->setFlash('Provisioned radio.  Foreign ID '.$foreign_id);
            
        } else {
            $this->Session->setFlash('Error provisioning radio.');
        }
        $this->redirect(array('action' => 'view',$this->NetworkRadio->id));
    }
    
    
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        // everyone can see the list and view individual Contacts
        if ($this->action === 'index' || $this->action === 'view') {
            return true;
        }
        
        // allow users with the rolealias of "edit" to add/edit/delete
        if ($this->action === 'add' || $this->action === 'edit' || $this->action === 'delete') {
            if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'edit') {
                return true;
            }
        }
        
        return parent::isAuthorized($user);
    }
}

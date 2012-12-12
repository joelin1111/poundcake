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

class NetworkRadiosController extends AppController {

    var $helpers = array('MyHTML');
    
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkRadio.name' => 'asc'
        )
    );
    
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
        
        // $this->NetworkRadio->Behaviors->attach('Containable');
        
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
        
//        echo "<pre>";
//        print_r($data);
//        echo "</pre>";
//        die;
        $this->set('networkradios',$data);
    }

    public function view($id = null) {
        $this->NetworkRadio->id = $id;
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        // get all the radios this radio may be linked to
        $query = 'call sp_get_remote_links('.$id.')';
        $links = $this->NetworkRadio->query( $query );
//        echo '<pre>';
//        print_r($links);
//        echo '</pre>';
//        die;
        
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
            // $declination = $this->NetworkRadio->Site->field('declination');
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
                
//                echo '<pre>';
//                print_r($this->NetworkRadio->data['Site']['declination']);
//                echo "Dec: ".$declination;
//                echo '</pre>';
//                die;
                if ($true_azimuth > 0) {
                    $mag_azimuth = $true_azimuth - $declination;
                }               
                $link['network_radios']['mag_azimuth'] = $mag_azimuth;
                
                // save it back to the links array
                $links[$u] = $link;
                $u++;
    //            die;
                /*
                if ($this->NetworkRadio->field('link_id') > 0) {
                    $id = $this->NetworkRadio->field('id');
                    $link_id = $this->NetworkRadio->field('link_id');
                    $link_distance = $this->NetworkRadio->getLinkDistance($id, $link_id);

                    $true_azimuth = $this->NetworkRadio->getRadioBearing($id, $link_id);
                    if ($true_azimuth > 0) {
                        $mag_azimuth = $true_azimuth - $declination;
                    }
                }
                */
            }
        }
        $this->set('links', $links);
        $this->set('sector',$sector);
    }

    function getRadioTypes() {
        $this->set('radiotypes',$this->NetworkRadio->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    function getAntennaTypes() {
        $this->set('antennatypes',$this->NetworkRadio->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    
    function getRadioModes() {
        $this->set('radiomodes',$this->NetworkRadio->RadioMode->find('list',
            array(
                'order' => array(
                    'RadioMode.name ASC'
            )))
        );
    }
    
    function getNetworkSwitch($id) {
        // this function is only called when the add/edit page is first loaded
        // NetworkRadios should not be created without a corresponding Site
        // and thus the Site select is set to not allow empty values
        
        /*
        previously we were just returning all switches in the database, e.g.
        
        $this->set('networkswitches',$this->NetworkRadio->NetworkSwitch->find('list',
            array(
                'order' => array(
                    'NetworkSwitch.name ASC'
            )))
        );
        */
        
        // this is basically now a diplicate of getSwitchForSite in NetworkSwitchesController
        // should probably move this to a model function on NetworkSwitch?
        
        $this->loadModel('Site', $id);
        $this->Site->id = $id;
                
        // now get the NetworkSwitch on that site
        // $network_switch_id = $this->Site->field('network_switch_id');
        $this->loadModel('NetworkSwitch', $this->Site->field('network_switch_id'));
        $this->NetworkSwitch->id = $this->Site->field('network_switch_id');
        
        $networkswitches = array();        
        if ( $this->NetworkSwitch->field('name') != null ) { 
            // now load the SwitchType
            $this->loadModel('SwitchType', $this->NetworkSwitch->field('switch_type_id'));
            $this->SwitchType->id = $this->NetworkSwitch->field('switch_type_id');

            $ports = $this->SwitchType->field('ports');
            // switches are labeled 1 to N
            for ($i = 1; $i <= $ports; $i++) {
                //$switchports[$i] = $i . " switch id: ".$switch_id ." ports ".$ports."";
                $networkswitches[$i] = $this->NetworkSwitch->field('name') . ' #'.$i;
                //$networkswitches[$i] = 'Port '.$i;
            }
        } else {
            $networkswitches[0] = $this->Site->field('site_name').' has no switch';
        }
        
        $this->set('network_switch_id',$this->NetworkSwitch->id);
        $this->set('networkswitches',$networkswitches);        
    }
    
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
    }

    public function edit($id = null) {
        $this->NetworkRadio->id = $id;
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getRadioModes();
        $this->getFrequencies(); // for the frequency dropdown
        $this->getAllSitesForProject();
        $this->getNetworkSwitch($this->NetworkRadio->field('site_id'));
        
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
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
    }
    
    public function setMagAzimuth($data) {
        if (isset($data['NetworkRadio']['true_azimuth'])) {
            $this->loadModel('Site',$data['NetworkRadio']['site_id']);
            $declination = $this->Site->getDeclination($this->Site->field('lat'), $this->Site->field('lon'));
            $data['NetworkRadio']['mag_azimuth'] = $data['NetworkRadio']['true_azimuth'] - $declination;
        }
        return $data;
    }
    
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
    
    function getFrequencies() {
        $frequencies = array();
        $frequency = 4920;
        // Ubiquity devices support 4920 MHz to 6100 MHz in 5 MHz increments
        for ($i = 0; $i <= 236; ++$i) {
            // we want the key and value in this array be the same here
            $frequencies[$frequency] = $frequency;
            $frequency += 5;
        }
        $this->set('frequencies',$frequencies);
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

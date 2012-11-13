<?php
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
        
        //$this->set('link_name',$this->getLinkName($this->NetworkRadio->field('link_id')));
        $this->set('networkradio', $this->NetworkRadio->read(null, $id));
        $ip_addresses = $this->getAllIPAddresses($this->NetworkRadio->field('name'));
        $this->set(compact('ip_addresses'));
        
        if ( $this->NetworkRadio->field('sector') > 0 ) {
            $link_distance = 0;
            $true_azimuth = $this->NetworkRadio->field('true_azimuth');
            $mag_azimuth = $this->NetworkRadio->field('mag_azimuth');
        } else {
            
            $u = 0;
            $declination = $this->NetworkRadio->Site->field('declination');
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
//        $this->set('link_distance',$link_distance);
//        $this->set('true_azimuth',$true_azimuth);
//        $this->set('mag_azimuth', $mag_azimuth);
    }

    // return all the sites to allow the radio to be assigned to
    function getSites() {
        $this->set('sites',$this->NetworkRadio->Site->find('list',
            array(
                'order' => array(
                    'Site.site_code',
                    'Site.site_name ASC'
            )))
        );
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
    
    function getNetworkSwitches() {
        $this->set('networkswitches',$this->NetworkRadio->NetworkSwitch->find('list',
            array(
                'order' => array(
                    'NetworkSwitch.name ASC'
            )))
        );
    }
    
    function getNumPorts() {
        return $this->NetworkRadio->NetworkSwitch->SwitchType->field('ports');
    }
    
    function getNetworkSwitchPorts() {
        // this function is only called when the add/edit page is first loaded
        // we want to set the number of available ports on the switch equal
        // to the number of ports on the switch's SwitchType
        
        // anytime a user changes the switch, the select (the listing of ports
        // for the SwitchType) is updated via AJAX -- see NetworkSwitchesController
        // getPortsBySwitchType
        
        // and really, I'm dying today -- my brain is not working
        // this is hideous, but seems functional
        
        
        $id = $this->NetworkRadio->id;
        $switchports = '';
        // if there is a switch associated with this radio (this would only happen
        // on edit), get the number of ports associated with that switch
        if (isset($id)) {
            //echo '<pre>';
            $network_switch_id = $this->NetworkRadio->field('network_switch_id');
            //echo "Network Switch ID ".$network_switch_id;
            
            //$this->NetworkRadio->NetworkSwitch->recursive = 2; // set recursive to 2 to get the data related to Contacts
            $switch_data = $this->NetworkRadio->NetworkSwitch->find('all', array('conditions' => array('NetworkSwitch.id' => $network_switch_id)));
            //print_r($switch_data);
            if (count($switch_data) > 0) {
                $ports = $switch_data[0]['SwitchType']['ports'];
                //echo "NetworkRadio ID ".$id."<BR>";
                //echo "NetworkSwitch ID ".$network_switch_id."<BR>";
                //echo "Ports ".$ports;
                //echo '</pre>';

                //$this->request->data = $this->NetworkRadio->NetworkSwitch->read(null, $network_switch_id);
                //$ports = $this->request->data['SwitchType']['ports'];
                //print_r($this->request->data );

                // SEE ALSO NetworkSwitchesController getPortsBySwitchType
                if (isset($ports)) {
                    for ($i = 1; $i <= $ports; $i++) {
                        $switchports[$i] = 'Port #'.$i;
                    }
                }
            }
        }
        $this->set('switchports',$switchports);
    }
    
    public function add() {
        $this->getSites();
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getRadioModes();
        $this->getFrequencies(); // for the frequency dropdown
        
        if ($this->request->is('post')) {

            $this->NetworkRadio->create();
            
            $this->request->data = $this->setMagAzimuth($this->request->data);
//            echo '<pre>';
//            echo 'Request:<BR>';
//            print_r($this->request->data);
//            echo '</pre>';
            if ($this->NetworkRadio->save($this->request->data)) {
                $this->Session->setFlash(__('The radio has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio could not be saved. Please, try again.'));
            }
        }
        
        $this->getNetworkSwitches();
        $this->getNetworkSwitchPorts();
    }

    public function edit($id = null) {
        $this->NetworkRadio->id = $id;
        $this->getSites();
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getRadioModes();
        $this->getFrequencies(); // for the frequency dropdown
        
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            $data = $this->request->data;
            $this->request->data = $this->setMagAzimuth($this->request->data);
            
            if ($this->NetworkRadio->save($this->request->data)) {
                $this->Session->setFlash(__('The radio has been saved'));
                $this->redirect(array('action' => 'view',$this->NetworkRadio->id));
            } else {
                $this->Session->setFlash(__('The radio could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->NetworkRadio->read(null, $id);
        }
        $this->getNetworkSwitches();
        $this->getNetworkSwitchPorts();
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
            throw new NotFoundException(__('Invalid radio'));
        }

        if ($this->NetworkRadio->delete()) {
            $this->Session->setFlash(__('Radio deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Radio was not deleted'));
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
    // return the logical name of a linked radio
    function getLinkName($id) {
        $link_name = '';
        if ($id > 0) {
            $link_name = $this->NetworkRadio->read('name', $id);
            
            $link_name = $link_name['NetworkRadio']['name'];
//            echo '<pre>';
//            echo 'ID of link '.$id;
//            //echo "Linked to: " . $link_radio['NetworkRadio']['name'];
//            //echo "Link name: ".print_r($link_name);
//            echo "Link name: ".$link_name;
//            echo '</pre>';
        }
        return $link_name;
    }
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

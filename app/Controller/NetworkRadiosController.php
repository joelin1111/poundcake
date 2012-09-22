<?php
App::uses('AppController', 'Controller');

class NetworkRadiosController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'NetworkRadio.name' => 'asc'
        )
    );
    
    public function index() {
        $this->NetworkRadio->recursive = 1;
        $this->set('networkradios', $this->paginate());
    }

    public function view($id = null) {
        $this->NetworkRadio->id = $id;
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        $this->set('link_name',$this->getLinkName($this->NetworkRadio->field('link_id')));
        $this->set('networkradio', $this->NetworkRadio->read(null, $id));
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
        $this->getFrequencies(); // for the frequency dropdown
        
        if ($this->request->is('post')) {
//            echo '<pre>';
//            echo 'Request:<BR>';
//            print_r($this->request->data);
//            echo '</pre>';
            $this->NetworkRadio->create();
            if ($this->NetworkRadio->save($this->request->data)) {
                
                $last = $this->NetworkRadio->read(null,$this->NetworkRadio->id);
                $new_id = $last['NetworkRadio']['id'];
                $link_id = $last['NetworkRadio']['link_id']; //$this->NetworkRadio->read(null, $id);
                if ( $link_id > 0 ) {
                    //echo '<pre>';
                    //echo "New ID:".$new_id."<br>";
                    //echo "Link ID:".$link_id."<br>";
                    //echo '</pre>';
                    //
                    // need to verify these values before passing them to the sp
                    // 
                    // update the link_id on the corresponding radio
                    $query = 'call sp_add_link_id('.$new_id.','.$link_id.')';
                    $this->NetworkRadio->query( $query );
                }
                
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
        $this->getFrequencies(); // for the frequency dropdown
//        $this->getNetworkSwitches();
//        $this->getNetworkSwitchPorts();
        $this->set('link_name',$this->getLinkName($this->NetworkRadio->field('link_id')));
        
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
//            echo '<pre>:';
//            print_r($this->request->data);
//            echo '</pre>';
            $data = $this->request->data;
            $old_link_id = $data['NetworkRadio']['link_id'];
            if ($this->NetworkRadio->save($this->request->data)) {
//                echo '<pre>:';
//                print_r($this->request->data);
//                echo '</pre>';
                //die;
                // update the link_id and possible clear out the old
                // link_id on related radio
                $link_id = $this->NetworkRadio->field('link_id');
                if ($link_id > 0) {
                    //echo "link ".$id." to ".$link_id;
                    $query = 'call sp_add_link_id('.$id.','.$link_id.')';
                    $this->NetworkRadio->query( $query );
                } else {
                    //echo "old link: ".$old_link_id;
                    if (!isset($old_link_id)) {
                        $old_link_id = 'NULL';
                    }
                    $query = 'call sp_rm_link_id('.$old_link_id.')';
                    $this->NetworkRadio->query( $query );
                    
                }
                $this->Session->setFlash(__('The radio has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->NetworkRadio->read(null, $id);
        }
        $this->getNetworkSwitches();
        $this->getNetworkSwitchPorts();
    }
    
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->NetworkRadio->id = $id;
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        
        $link_to = $this->NetworkRadio->field('link_id');
        //echo "Radio ".$id." links to ".$link_to."<br>";
        //die;
        if ($this->NetworkRadio->delete()) {
            // cleanup the link_id on the corresponding radio
            // we have to pass something into the sp, parameters are not optional
            if (!(isset($link_to))) {
                $link_to = 'NULL';
            }
            //echo "link_to: ".$link_to;
            $query = 'call sp_rm_link_id('.$link_to.')';
            $this->NetworkRadio->query( $query );
            
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

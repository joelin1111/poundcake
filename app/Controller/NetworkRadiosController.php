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
                'NetworkRadio.name LIKE' => $name_arg
            )
        );
        $this->paginate = array(
            'NetworkRadio' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                'order' => array(
                    'NetworkRadio.name' => 'asc',
                ),
            ));
        $this->NetworkRadio->recursive = 1;
        $data = $this->paginate('NetworkRadio');
        $this->set('networkradios',$data);
        // end search stuff
        // $this->set('networkradios', $this->paginate());
    }

    public function view($id = null) {
        $this->NetworkRadio->id = $id;
        if (!$this->NetworkRadio->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        $this->set('link_name',$this->getLinkName($this->NetworkRadio->field('link_id')));
        $this->set('networkradio', $this->NetworkRadio->read(null, $id));
        $ip_addresses = $this->getAddress($this->NetworkRadio->field('name'));
        $this->set(compact('ip_addresses'));
        
        //$true_azimuth = $this->NetworkRadio->field('true_azimuth');
        $declination = $this->NetworkRadio->Site->field('declination');
        
        if ($this->NetworkRadio->field('link_id') > 0) {
            $id = $this->NetworkRadio->field('id');
            $link_id = $this->NetworkRadio->field('link_id');
            $this->set('link_distance',$this->getLinkDistance($id, $link_id));
            
            $true_azimuth = $this->getBearing($id, $link_id);
            $this->set('true_azimuth',$true_azimuth);
            $this->set('mag_azimuth', $true_azimuth - $declination);
            
        }
        
        // Converting azimuths with easterly G-M angle
        // To convert a grid azimuth to a magnetic azimuth, subtract the G-M angle from the grid azimuth.
        // 
        // Converting azimuths with westerly G-M angle
        // To convert a grid azimuth to a magnetic azimuth, add the value of the G-M angle to the grid azimuth.
        // 
        // http://www.armystudyguide.com/content/SMCT_CTT_Tasks/Skill_Level_1/land-nav-task-9-convert-a.shtml

        //echo "Declination  ".$declination; die;
        
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
                    if ($old_link_id == "") {
                        $old_link_id = 0;
                    }
                    $query = 'call sp_rm_link_id('.$old_link_id.')';
//                    echo $query;
//                    die;
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
    
    // return the distance between two radios
    function getLinkDistance($id, $link_id) {
        // uses Haversine formula
        // http://sgowtham.net/blog/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
            
        $earth_radius = 3960.00; # in miles
        
        $radio1 = $this->NetworkRadio->findById($id);
        $radio2 = $this->NetworkRadio->findById($link_id);

        $lat1 = $radio1['Site']['lat'];
        $lon1 = $radio1['Site']['lon'];
        $lat2 = $radio2['Site']['lat'];
        $lon2 = $radio2['Site']['lon'];
        
        //global $earth_radius;
        $delta_lat = $lat2 - $lat1;
        $delta_lon = $lon2 - $lon1;

        $alpha  = $delta_lat/2;
        $beta = $delta_lon/2;
        $a = sin(deg2rad($alpha)) * sin(deg2rad($alpha)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin(deg2rad($beta)) * sin(deg2rad($beta)) ;
        $c = asin(min(1, sqrt($a)));
        $distance = 2*$earth_radius * $c;
        $distance = round($distance, 4);
        
        // return the distance as kilometers
        return $distance * 1.60934;
    }
    
    function getBearing($id, $link_id) {
        $radio1 = $this->NetworkRadio->findById($id);
        $radio2 = $this->NetworkRadio->findById($link_id);
        
        $lat1 = deg2rad($radio1['Site']['lat']);
        $lon1 = deg2rad($radio1['Site']['lon']);
        $lat2 = deg2rad($radio2['Site']['lat']);
        $lon2 = deg2rad($radio2['Site']['lon']);

        // http://mathforum.org/library/drmath/view/60398.html
        // http://mathforum.org/library/drmath/view/55417.html
        // The algorithm it gives for bearing (or course) between two points is this:
        // tc1=mod(atan2(sin(lon2-lon1)*cos(lat2),cos(lat1)*sin(lat2)-sin(lat1)*cos(lat2)*cos(lon2-lon1)),2*pi)
        // The formula gives the initial heading for a great-circle route from point A to point B. The heading will change in the course of the trip. The quantities in the formula have these meanings:
        // lon1 = longitude of point A
        // lat1 = latitude of point A
        // lon2 = longitude of point B
        // lat2 = latitude of point B
        // tc1 = direction of point B from point A (angle east of north)
        // $pi = 3.141596;
        // The magnetic poles drift over years. The current location of the magnetic north pole is somewhere around 78.3 deg N, 104.0 deg W. Use 
        // these coordinates for point B and your own location for point A when using the formula on the page above.
    
        //$b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1)) % (2*pi());
        // http://www.ig.utexas.edu/outreach/googleearth/latlong.html
        $b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1));
        $b = rad2deg($b);
        //$b = $b * (180/pi());
        //$b = ($b + 360) % 360;
        if ($b < 0) {
            $b += 360;
        }
        //echo "B is $b";
        return $b;
        
        
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

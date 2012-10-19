<?php

// maybe we'll need this?
//App::uses('Sanitize','Utility');

class SitesController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // AltGoogleMapV3 is the Marc Fernandez Google Map helper, just renamed
    // AutoCompleteHelper removed -- not used
    var $helpers = array(
        'AjaxMultiUpload.Upload',
        'GoogleMap',
        'MyHTML'
    );
    //var  $uses = null; // needed by Pdf helper?

    public $components = array('AjaxMultiUpload.Upload','RequestHandler'); //,'DebugKit.Toolbar'
    
    public $presetVars = array(
        // field names for the form itself , 'model' => 'Site'
        array('field' => 'site_name', 'type' => 'value'),
        //?? revisit:  array('field' => 'district', 'type' => 'lookup', 'formField' => 'district_input', 'modelField' => 'district', 'model' => 'Site'),
    );
    
    public function beforeFilter() {
        parent::beforeFilter();
        $this->set('site_name', $this->Site->site_name);
    }
    
    function getUserProjects() {
        // return only the projects this user has access to
        $this->loadModel('User');
        $uid = CakeSession::read("Auth.User.id");
        $options['joins'] = array(
            array('table' => 'projects_users',
                'alias' => 'ProjectsUser',
                'type' => 'INNER',
                'conditions' => array(
                    //"Site.project_id  =  Project.id",
                    'ProjectsUser.user_id =  '.$uid,
                    'ProjectsUser.project_id = Project.id'
                )
            )
        );
        $projects = $this->User->Project->find('list', $options);
        $this->set('projects',$projects);
//        echo '<pre>';
//        print_r($projects);
//        echo '</pre>';
//        die;
        return $projects;
    }
    
    function index($id = null) {
        // not really sure how to save this -- the array of projects the current user
        // has access to needs to go to the beforeFind function on the Site controller
        // so that we only return sites this user has access to
        //$this->Site->data['Site']['projects'] = $this->getUserProjects();
        
//        echo '<pre>';
//        print_r($this->projects);
//        echo '</pre>';
//        die;

        
        $conditions = "";
                
        $site_code_arg = "";
        $site_name_arg = "";
        //echo $this->passedArgs['Site.site_code'];
        
        // used by search
        if (isset($this->passedArgs['Site.site_code'])) {
            $site_code_arg = str_replace('*','%',$this->passedArgs['Site.site_code']);
        }
        // used by search
        if (isset($this->passedArgs['Site.site_name'])) {
            $site_name_arg = str_replace('*','%',$this->passedArgs['Site.site_name']);
        }
        
        // if neither argument was passed, default to a wildcard
        if ($site_code_arg == "") {
            $site_code_arg = '%';
        }
        if ($site_name_arg == "") {
            $site_name_arg = '%';
        }
        
        //echo "Site code 2:<pre>".$this->passedArgs['Site.site_code']."</pre>";            
        $conditions = array(
            'AND' => array(
                'Site.site_code LIKE' => $site_code_arg,
                'Site.site_name LIKE' => $site_name_arg,
            )
        );
        
//        echo '<pre>';
//        print_r($conditions);
//        echo '</pre>';
        
        $this->paginate = array(
            'Site' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                'order' => array(
                    'Site.site_code' => 'asc',
                    'Site.site_name' => 'asc',
                ),
            ));
        
        $data = $this->paginate('Site');
        $this->set('sites',$data);
        
        $this->set('installteams',$this->Site->InstallTeam->find('list'));
    }
 
    public function buildLegend() {
        $allSiteStates = $this->Site->SiteState->find('all');
        $this->set('allSiteStates', $allSiteStates);
        //echo print_r($allSiteStates);
    }
    
    public function overview() {
        
        // get all the sites for display on the map - ignor any without lat/lon
        // skip any that don't have coordinates in the db
        $conditions = array ("NOT" => array ("Site.lat" => null));
        $sites = $this->Site->find('all', array('conditions' => $conditions));
        $this->set('sites', $sites);
        $this->buildLegend();
    }
    
    /*
    function getSitesNearby($id = null, $max_sites = 5) {
        // return the nearest sites using the MySQL stored procedure
        // sp_nearby
        if ($id != null && $max_sites != null) {
            $query = 'call sp_nearby('.$id.','.$max_sites.')';
            $nearby = $this->Site->query( $query );
//            not really sure why the distance comes back in its own array here,
//             example:
//             
//                [2] => Array
//                    (
//                        [sites] => Array
//                            (
//                                [id] => 2
//                                [site_name] => CHITANDI
//                            )
//
//                        [0] => Array
//                            (
//                                [distance] => 5.8482689198309625
//                            )
//
//                    )
             
            $this->set('nearby', $nearby);
        }
    }
    */
    
    function getContacts($id = null) {
        // sometimes I think my head is going to explode - I had a haard time finding
        // contacts for this site's tower owner, this is the model setup:
        // 
        // Site belongsTo TowerOwner
        // TowerOwner hasMany Sites
        // TowerOwner hasMany Contacts
        // Contact belongsTo TowerOwner
        
        // get the ID of the current site's tower owner
        $id = $this->Site->data['Site']['tower_owner_id'];
        //echo "ID is" . $id;
        $conditions = array (
            //'id' => $id // tower_owner.id = site.tower_owner_id
            'tower_owner_id' => $this->Site->data['Site']['tower_owner_id']
        );
        
        $contacts = $this->Site->TowerOwner->Contact->find(
                'all',
                array('conditions' => $conditions,
                //array('order' => $order)
                'order' => 'priority ASC')
        );
        
        $i=0;
        foreach ($contacts as $contact) {
            $contacts[$i++]['Contact']['phone'] = str_replace(',', '<br/>', $contact['Contact']['phone']);
            //$i++;
        }
//        echo '<pre>';
//        print_r($contacts);
//        echo '</pre>';
//        die;
        
        // clean up the listing, since some of these can be long
        $this->set(compact('contacts'));
    }
    
    function getBuildItems() {
       $this->loadModel('BuildItems');
       $builditems = $this->BuildItems->find('all');
       $this->set('builditems', $builditems);
       
       // sum up all the radios, antennas for this site
       $query = 'call sp_count_radios('.$this->Site->id.')';
       $this->set('radio_counts', $this->Site->query( $query ));
       $query = 'call sp_count_antennas('.$this->Site->id.')';
       $this->set('antenna_counts', $this->Site->query( $query ));
       
       // this is probably not the best way to do this, but if an admin deletes
       // then re-creates a power source I can't assume the primary key for the
       // 24/48 volt PowerType
       
       $board = array('quantity' => '1','name' => $this->Site->data['PowerType']['volts']. ' Volt Board');
       
       $this->set('board', $board);
    }
    
    function schedule($id) {
        //echo '<pre>';
        $this->Site->InstallTeam->id=$id;
        //$this->set('installteams',$this->Site->InstallTeam->find('first'));
        //print_r ($this->Site->InstallTeam);
        $this->set('teamname',$this->Site->InstallTeam->field('name'));
        if ($id != null) {
            $query = 'call sp_schedule('.$id.')';
            $this->set('schedule',$this->Site->InstallTeam->query( $query ));
            // results not paginated
//            print_r($XX);
//            echo '</pre>';
        }
        
    }
    function view($id = null) {
        $this->Site->id = $id;
        $this->set('id',$id);
        //$this->getSitesNearby($id,5);
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        $this->set('site', $this->Site->read(null, $id));
        $this->getContacts($id);
        
        $this->getAllSites($id);
        
        $this->getBuildItems();
        
        $site_code = $this->Site->data['Site']['site_code'];       
        $radios = $this->Site->NetworkRadios->findAllBySiteId($id);
        $n = 0;
        foreach ($radios as $radio) {
            $d = $this->getLinkLatLon($radio['NetworkRadios']['link_id']);
            $radio['NetworkRadio']['link_lat'] = $d[0];
            $radio['NetworkRadio']['link_lon'] = $d[1];
            $radio['NetworkRadio']['link_icon'] = $d[2];
            $radio['NetworkRadio']['window_text'] = $d[3];
//            print_r($d);
            $radios[$n] = $radio;
//            echo '<pre>';
//            print_r($d);
//            echo '</pre>';
            $n++;
        }
//        echo '<pre>';
//        print_r($radios);
//        echo '</pre>';
         $this->set('radios', $radios);
        //$ip_addresses = $this->getAllIPAddresses($this->Site->field('site_code'));
        $ip_addresses = $this->getAllIPAddresses($site_code);
        $this->set(compact('ip_addresses'));
        
        /*
        // user has changed the field
        if ($this->request->is('post') || $this->request->is('put')) {
            $remote $this->request->data['Site']['declination'];
            $distance = 
        }
        */
    }
    
    function getRemoteSite($id) {
        // get the lat/lon of the current site
        $site = $this->Site->read(null,$id);
        $lat = $site['Site']['lat'];
        $lon = $site['Site']['lon'];
        // get the lat/lon of the remote site
        $r_site_id = $this->request->data['Site']['sites'];
        $r_site = $this->Site->read(null,$r_site_id);
        $r_lat = $r_site['Site']['lat'];
        $r_lon = $r_site['Site']['lon'];
        $r_dist = $this->Site->getDistance($lat, $lon, $r_lat,$r_lon);
        
        $true_azimuth = $this->Site->getBearing($lat, $lon, $r_lat, $r_lon);
        $declination = $this->getDeclination($lat,$lon);
        if ($true_azimuth > 0) {
                $mag_azimuth = $true_azimuth - $declination;
            }
        $this->set('remote',array($r_dist,$true_azimuth,$mag_azimuth));
        //$this->set('remote',print_r($this->request->data));
        //$this->set('remote',$remote_site_id);
        $this->layout = 'ajax';
    }
    
    // get the lat/lon of the Site for the remote radio
    function getLinkLatLon($r_radio_id) {
//        echo "Remote radio ID is ".$remote_radio_id;
        $this->loadModel('NetworkRadio',$r_radio_id);
        $r_radio = $this->NetworkRadio->read(null,$r_radio_id);
//        echo '<pre>';
//        echo "Remote Site for that radio is ". $r_radio['NetworkRadio']['site_id'];
//        echo '</pre>';
        $r_site = $this->Site->read(null,$r_radio['NetworkRadio']['site_id']);     
//        echo '<pre>';
//        //print_r($r_site);
//        echo $r_site['Site']['site_vf'];
//        echo '</pre>';
        //die;
        return array (
            $r_site['Site']['lat'],
            $r_site['Site']['lon'],
            'data:'.$r_site['SiteState']['img_type'].';base64,'.base64_encode( $r_site['SiteState']['img_data'] ),
            $r_site['Site']['site_vf']
        );        
    }
    
    function getZones() {
        // return a list of zones (which will be put into a drop-down menu
        // on the add/edit forms)
        $this->set('zones',$this->Site->Zone->find('list',array('order' => array('Zone.name ASC'))));
    }
    
    function getConnectivityTypes() {
        // identical to getZones
        $this->Site->ConnectivityType->
        $this->set('connectivitytypes',$this->Site->ConnectivityType->find('list'));
    }
    
    function getTowerOwners() {
        // identical to getZones
        $this->set('towerowners',$this->Site->TowerOwner->find('list'));
    }
    
    function getSiteStates() {
        // identical to getZones
        $this->set('sitestates',$this->Site->SiteState->find('list'));
    }
    
    function getPowerTypes() {
        // identical to getZones
        $this->set('powertypes',$this->Site->PowerType->find('list'));
    }
    
    function getTowerTypes() {
        // identical to getZones
        $this->set('towertypes',$this->Site->TowerType->find('list'));
    }
    
    function getTowerMembers() {
        // identical to getZones
        $this->set('towermembers',$this->Site->TowerMember->find('list'));
    }
    
    function getEquipmentSpace() {
        // identical to getZones
        $this->set('equipmentspace',$this->Site->EquipmentSpace->find('list'));
    }
    
    function getTowerMounts() {
        // identical to getZones
        $this->set('towermounts',$this->Site->TowerMount->find('list'));
    }   
    
    function getNetworkSwitches() {
        // identical to getZones
        $this->set('networkswitches',$this->Site->NetworkSwitch->find('list'));
    }
    
    function getNetworkRouters() {
        // identical to getZones
        $this->set('networkrouters',$this->Site->NetworkRouter->find('list'));
    }
    
    function getNetworkRadios() {
        // identical to getZones
        //$this->Site->recursive = 2;
        $this->Site->bindModel(array('hasMany' => array('NetworkRadio' => 
                             array('foreignKey' => 'site_id'))));
        $this->set('networkradios',$this->Site->NetworkRadio->find('list'));
    }
    
    function getRadioTypes() {
        //$this->set('antennatypes',$this->Site->NetworkSwitch->find('list'));
        $this->set('radiotypes',$this->Site->NetworkRadio->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    function getAntennaTypes() {
        //$this->set('antennatypes',$this->Site->NetworkSwitch->find('list'));
        $this->set('antennatypes',$this->Site->NetworkRadio->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    
    function getInstallTeams() {
        //$this->set('antennatypes',$this->Site->NetworkSwitch->find('list'));
        $this->set('installteams',$this->Site->InstallTeam->find('list',
            array(
                'order' => array(
                    'InstallTeam.name ASC'
            )))
        );
    }
    
    function getAllSites() {
        //$this->set('antennatypes',$this->Site->NetworkSwitch->find('list'));
        $this->set('sites',$this->Site->find('list',
            array(
                'order' => array(
                    'Site.site_name ASC'
            )))
        );
    }
    function add() {
        $this->Site->create();
        
        // Cake has lazy model binding -- it seems we have to do this to allow
        // the saveAssociated bit to work
        $this->Site->bindModel(array('hasMany' => array('NetworkRadio' => 
                             array('foreignKey' => 'site_id'))));

        // get a list of things the Site may belong to
        $this->getTowerOwners();
        $this->getSiteStates();
        $this->getPowerTypes();
        
        $this->getTowerTypes();
        $this->getTowerMembers();
        $this->getEquipmentSpace();
        $this->getTowerMounts();
        
        $this->getNetworkSwitches();
        $this->getNetworkRouters();
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getInstallTeams();
        
        $zones = $this->Site->Zone->find('list');
        $this->set(compact('zones'));
        
        // the user clicked Save on Add screen
        if ($this->request->is('post')) {
            // normally we'd just save here, e.g.
            // if ($this->Site->save($this->request->data)) {
            // saveAssociated allows us to save Radios (Site hasMany Radio) from the
            // site add page
            
            // this allows us to save these attached items even though we don't yet
            // have a site ID
            unset($this->Site->NetworkSwitch->validate['site_id']);
            unset($this->Site->NetworkRouter->validate['site_id']);
            unset($this->Site->NetworkRadio->validate['site_id']);
            
            // remove any blank entries from the array of NetworkRadios
            $this->data = Set::filter($this->data);
            
//            echo '<pre>';
//            print_r($this->request->data);
//            echo '</pre>';
//            
//            if ($this->Site->NetworkRadio->validate) {
//                echo "Validates";
//            } else {
//                echo "Failed validation"; die;               
//            }
            
            // compute the declination then save it back to the request object
            $this->request->data['Site']['declination'] = $this->getDeclination($this->request->data['Site']['lat'],$this->request->data['Site']['lon']);
            
            if ($this->Site->saveAssociated($this->request->data, array('validate'=>true))) {
                $this->Session->setFlash(__('The site has been saved'));
                $this->redirect(array('action' => 'index'));
            }
            
        }
    }
    
    function delete($id) {
        $this->Site->id = $id;
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        
        if ($this->Site->delete()) {
            // now cleanup any files associated with this site
            $this->Upload->deleteAll('Site', $id);
            $this->Session->setFlash(__('Site deleted'));
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->setFlash(__('Site was not deleted'));
            $this->redirect(array('action' => 'index'));
        }
    }

    function edit($id = null) {
        $this->Site->id = $id;
        
        // get a list of zones, etc. the site may belong to
        $this->getZones();
        $this->getTowerOwners();
        $this->getSiteStates();
        $this->getPowerTypes();
        
        $this->getTowerTypes();
        $this->getTowerMembers();
        $this->getEquipmentSpace();
        $this->getTowerMounts();
        
        $this->getNetworkSwitches();
        $this->getNetworkRouters();
        $this->getNetworkRadios();
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getInstallTeams();
        $this->getUserProjects();
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            // see comments in add
            unset($this->Site->NetworkRadio->validate['site_id']);
            $this->data = Set::filter($this->data);
            //echo '<pre>';print_r($this->request->data);echo '</pre>';
            
            // it appears that on edit, we should save the related data using
            // the right controller
            // http://book.cakephp.org/2.0/en/models/saving-your-data.html
            //echo '<pre>';print_r($this->request->data);echo '</pre>';
            // The ID of the newly created user has been set
            // as $this->User->id.
            //$this->request->data['NetworkRadio'][0]['name'] = 'foo';
            //$this->request->data['NetworkRadio'][0]['site_id'] = $this->Site->id;
            
            // before we can save any radios on this site we have to set the site_id
            // so walk throug that array here and save that
            
            // compute the declination then save it back to the request object
            $this->request->data['Site']['declination'] = $this->getDeclination($this->request->data['Site']['lat'],$this->request->data['Site']['lon']);
            
            if ($this->Site->saveAll($this->request->data, array('deep' => true))) {
                
                // if the specified a new switch
                if (isset($this->request->data['NetworkSwitch'])) {
                    // thre is only 1 switch per site, so set the site_id before save
                    $this->request->data['NetworkSwitch']['site_id'] = $this->Site->id;
                    $this->Site->NetworkSwitch->save($this->request->data['NetworkSwitch']);
                }
                
                // if they specified a router
                if (isset($this->request->data['NetworkRouter'])) {
                    // as above
                    $this->request->data['NetworkRouter']['site_id'] = $this->Site->id;
                    $this->Site->NetworkRouter->save($this->request->data['NetworkRouter']);
                }
                
                // keeping this loop code for now -- previously we had the ability to add many
                // radios on the add/edit page
                if (isset($this->request->data['NetworkRadio'])) {
                    foreach ($this->request->data['NetworkRadio'] as $key => $value) {
                        //echo "Key: $key; Value: $value<br />\n";
                        $this->request->data['NetworkRadio'][$key]['site_id'] = $this->Site->id;
                    }
                    $this->Site->NetworkRadio->saveAll($this->request->data['NetworkRadio']);
                }
                
                $this->Session->setFlash(__('The site has been saved'));
                //$this->redirect(array('action' => 'index'));
                // keep the user on the edit page
                $this->redirect(array('action' => 'edit', $this->Site->id));


            } else {
                $this->Session->setFlash(__('The site could not be saved. [Error 002]'));
            }
        } else {
            // show edit page
            $this->request->data = $this->Site->read(null, $id);
//            echo '<pre>';
//            print_r($this->request->data);
//            echo '</pre>';
        }
    }
    
    function getDeclination($lat, $lon) {
        $dec = null;
        if (isset($lat) && isset($lon)) {
            //$lat=45.53704;
            //$lon=-122.599793;
            $url='http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1='.$lat.'&lon1='.$lon.'&resultFormat=csv';
            //http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1=45.53704&lon1=122.599793&resultFormat=csv
            //$x = readfile ("http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1='.$lat.'&lon1='.$lon.'&resultFormat=xml");
            //echo "URL is ".$url.'<br><br>';
            //$x = readfile($url);
            $x = file_get_contents($url);
            $y = str_getcsv($x);
            
            // count should be > 1 unless the web service is down or some other network error
            if (count($y) > 1) {
                //echo '<br><br><pre>';
                //print_r($y[3]);
                $dec = $y[3];
            } else {
                $dec = 0;
            }
            //echo '</pre>';
        }
        return $dec;
    }
    
    public function workorder($id) {
        $conditions = '';
        $sites = $this->Site->findById($id);
        $conditions = array (
            "Contact.contact_type_id" => "2", // 2 is the primary key of the technical contact
            "Contact.priority" => "1", // 1 is the base priority level
            //"Contact.tower_owner_id" => $this->Site->TowerOwner->field('id')
            "Contact.tower_owner_id" => $sites['Site']['tower_owner_id']
        );
        $towercontacts = $this->Site->TowerOwner->Contact->find('all',array('conditions' => $conditions));        
        $router = $this->Site->NetworkRouter->findByRouterTypeId($sites['NetworkRouter']['router_type_id']);
        $switch = $this->Site->NetworkSwitch->findBySwitchTypeId($sites['NetworkSwitch']['switch_type_id']);
        $radios = $this->Site->NetworkRadios->findAllBySiteId($id);
        
//        echo '<pre>';
//        print_r($sites);
//        print_r( $this->Site->TowerOwner->field('id') );
//        print_r($conditions);        
//        print_r($towercontacts);        
//        echo '</pre>';
//        die;
        
        // this seems kind of crazy -- and it is -- but since I'm not saving the link distance or bearing on the
        // NetworkRadio object (they are computed at view time), and really I can't do that since
        // link_id isn't set until after save (by a trigger), now I have to go compute those values again and save them
        // back to my array
        $n = 0;
        foreach ($radios as $radio) {
            //echo $radio['NetworkRadios']['name']."<br>";
            $this->loadModel('NetworkRadio');
            $d = $this->NetworkRadio->getLinkDistance($radio['NetworkRadios']['id'],$radio['NetworkRadios']['link_id']);
            $radio['NetworkRadios']['distance'] = $d;
            
            $b = $this->NetworkRadio->getRadioBearing($radio['NetworkRadios']['id'],$radio['NetworkRadios']['link_id']);
            $radio['NetworkRadios']['true_azimuth'] = $b;
            
            $ip_address = '';
            $ip_address = $this->getIPAddress($radio['NetworkRadios']['name']);
            $radio['NetworkRadios']['ip_address'] = $ip_address;
            
            $gw_address = '';
            $gw_address = $this->getGatewayAddress($radio['NetworkRadios']['name']);
            $radio['NetworkRadios']['gw_address'] = $gw_address;
            
//            echo '<pre>';
//            echo $radio['NetworkRadios']['name']. " ";
//            print_r($ip_address);
//            echo '</pre>';
            //die;
            
            //$radio['NetworkRadios']['ip_address'] = 
            //$this->Product->findByOrderStatus(‘3’);
                    
//            $s = $this->Site->findById($radio['NetworkRadios']['site_id']);
//            echo "S is ".$s['Site']['declination']."<br>";

            //$d = $this->NetworkRadio->Site->getLinkDistance($radio['NetworkRadios']['id'],$radio['NetworkRadios']['link_id']);
            //$radio['NetworkRadios']['mag_azimuth'] = $b - ;
            
            
            //print_r($radio);
            $radios[$n] = $radio;
            $n++;
        }
//        echo '<pre>';
//        print_r($radios);
//        echo '</pre>';
//        die;
        $this->set('site', $sites);
        $this->set('towercontacts', $towercontacts);
        $this->set('router', $router);
        $this->set('switch', $switch);
        $this->set('radios', $radios);
        
        // generate the Excel file but without all the other stuff
        // in the layout -- so set the layout to null then set it back
        //$layout = $this->layout;
        $this->layout = 'blank';
        //$this->layout = null;
        //$this->layout = 'ajax'; // anything other than default
        //$this->autoLayout = false; 
        //$this->render('workorder');
        //$this->layout = null; 
        //$this->render('workorder','blank',null);
        $this->render('workorder');
        //$this->autoLayout = true; 
        $this->layout = 'default';
    }
    
    public function isAuthorized($user) {
        // everyone can see the list and view individual Contacts
        if ($this->action === 'index' || $this->action === 'view') {
            return true;
        }
        
        if ($this->action === 'overview' || $this->action === 'workorder') {
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
        
//    function auto_complete() {
//        $sites = $this->Site->find('all', array( 
//            'conditions' => array( 
//                'Site.site_name LIKE' => $this->params['url']['autoCompleteText'].'%' 
//            ), 
//            'fields' => array('site_name'), 
//            'limit' => 3, 
//            'recursive'=>-1, 
//        )); 
//        $sites = Set::Extract($sites,'{n}.Site.site_name'); 
//        $this->set('sites', $sites); 
//        $this->layout = 'ajax';     
//    }
    
//    private function array_non_empty_items($input) {
//        // If it is an element, then just return it
//        if (!is_array($input)) {
//            return $input;
//        }
//        $non_empty_items = array();
//
//        foreach ($input as $key => $value) {
//            // Ignore empty cells
//            if ($value) {
//                // Use recursion to evaluate cells 
//                $non_empty_items[$key] = $this->array_non_empty_items($value);
//            }
//        }
//
//        // Finally return the array without empty items
//        return $non_empty_items;
//      }
    
}

?>

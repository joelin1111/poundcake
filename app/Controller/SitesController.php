<?php

// maybe we'll need this?
//App::uses('Sanitize','Utility');

class SitesController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // AltGoogleMapV3 is the Marc Fernandez Google Map helper, just renamed
    // AutoCompleteHelper removed -- not used
    var $helpers = array('AjaxMultiUpload.Upload','AltGoogleMapV3','MyHTML');
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
    
    function index($id = null) {
        
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
        //echo "Conditions: ".print_r($conditions);
        
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
//        $yy = $this->Site->InstallTeam->find('all');
//        echo '<pre>';
//        print_r($yy);
//        echo '</pre>';
//        die;
        
    }
 
    public function buildLegend() {
        $allSiteStates = $this->Site->SiteState->find('all');
        $this->set('allSiteStates', $allSiteStates);
        //echo print_r($allSiteStates);
    }
    
    public function overview() {
        // find('all') would return all sites, no matter what
        //$sites = $this->Site->find('all');
        
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
        $conditions = array(
            'id' => $id // tower_owner.id = site.tower_owner_id
        );
        //$this->set('contacts',$this->Site->TowerOwner->find('all', array('contain' => false, 'conditions' => $conditions)));
        
        $this->Site->TowerOwner->recursive = 2; // set recursive to 2 to get the data related to Contacts
        $contacts = $this->Site->TowerOwner->find('all', array('conditions' => $conditions));
        $this->set(compact('contacts'));
    }
    
    function getBuildItems() {
       $this->loadModel('BuildItems');
       $builditems = $this->BuildItems->find('all');
       $this->set('builditems', $builditems);
//       echo "<pre>";
//       print_r($buildItems);
//       echo '</pre>';
//       die;
       
       
       // sum up all the radios, antennas for this site
       $query = 'call sp_count_radios('.$this->Site->id.')';
       $this->set('radio_counts', $this->Site->query( $query ));
       $query = 'call sp_count_antennas('.$this->Site->id.')';
       $this->set('antenna_counts', $this->Site->query( $query ));
       
       // this is probably not hte best way to do this, but if an admin deletes
       // then re-creates a power source I can't assume the primary key for the
       // 24/48 volt PowerType
        if (preg_match("/48/", $this->Site->data['PowerType']['name'], $matches)) {
             $board = array('quantity' => '1','name' => '48V Board');
        } elseif (preg_match("/24/", $this->Site->data['PowerType']['name'], $matches)) {
            $board = array('quantity' => '1','name' => '48V Board');
        } else {
            $board = array('quantity' => '1','name' => 'Other Board');
        }
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
        //$this->getBearing();
        
        $this->Site->id = $id;
        //$this->getSitesNearby($id,5);
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        $this->set('site', $this->Site->read(null, $id));
        $this->getContacts($id);
        $this->getBuildItems();
        //$this->getInstallTeams();
        
        //$this->set('ip_addresses',$this->getAddress($this->Site->field('site_code')));
        
        $ip_addresses = $this->getAddress($this->Site->field('site_code'));
        $this->set(compact('ip_addresses'));
    }
    
    function getZones() {
        // return a list of zones (which will be put into a drop-down menu
        // on the add/edit forms)
        //$this->set('zones',$this->Site->Zone->find('list'));
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
    
    function getTowerEquipment() {
        // identical to getZones
        $this->set('towerequipment',$this->Site->TowerEquipment->find('list'));
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
        $this->getTowerEquipment();
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
        $this->getTowerEquipment();
        $this->getTowerMounts();
        
        $this->getNetworkSwitches();
        $this->getNetworkRouters();
        $this->getNetworkRadios();
        $this->getRadioTypes();
        $this->getAntennaTypes();
        $this->getInstallTeams();
        
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
            #$lat=45.53704;
            #$lon=-122.599793;
            $url='http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1='.$lat.'&lon1='.$lon.'&resultFormat=csv';
            //http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1=45.53704&lon1=122.599793&resultFormat=csv
            //$x = readfile ("http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1='.$lat.'&lon1='.$lon.'&resultFormat=xml");
            #echo "URL is ".$url.'<br><br>';
            //$x = readfile($url);
            $x = file_get_contents($url);
            $y = str_getcsv($x);
            //echo '<br><br><pre>';
            //print_r($y[3]);
            $dec = $y[3];
            //echo '</pre>';
        }
        return $dec;
    }
    
    public function isAuthorized($user) {
        // everyone can see the list and view individual Contacts
        if ($this->action === 'index' || $this->action === 'view') {
            return true;
        }
        
        if ($this->action === 'overview') {
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

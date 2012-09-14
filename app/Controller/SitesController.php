<?php

// maybe we'll need this?
//App::uses('Sanitize','Utility');

class SitesController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // AltGoogleMapV3 is the Marc Fernandez Google Map helper, just renamed
    // AutoCompleteHelper removed -- not used
    var $helpers = array('AjaxMultiUpload.Upload','AltGoogleMapV3');
    
    public $components = array('AjaxMultiUpload.Upload'); //,'DebugKit.Toolbar'
    
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
        
        if (isset($this->passedArgs['Site.site_code'])) {
            $site_code_arg = str_replace('*','%',$this->passedArgs['Site.site_code']);
        }
        
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
        //print_r($sites);
        /*
        for($i = 0; $i < sizeof($sites); ++$i) {
            // for each site, decode the lat/lon and save it back to the
            // array of sites
            //echo "<pre> Site ID = ".$sites[$i]['Site']['id']."</pre>";
            // we're actually overwriting the Site's "location" field (which
            // comes back as a binary object) with the decoded lat/lon
            $sites[$i]['Site']['location'] = $this->getLatLon( $sites[$i]['Site']['id'], 'sites' );
        }
        */
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
    
    function view($id = null) {
        $this->Site->id = $id;
        //$this->getSitesNearby($id,5);
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        $this->set('site', $this->Site->read(null, $id));
        $this->getContacts($id);
        
        switch ($this->Site->data['Site']['site_state_id']){
            case 0:
                $label = 'label label-warning';
                break;
            case 15:
                $label = 'label label-success';
                break;
            case 20:
                $label = 'label label-important';
                break;
            default:
                $label = 'label label-warning';
                break;
            }
        // label-success - green
        // label-important - red
        // label-warning - yellow
        $this->set('state_class',$label);
        
    }
    
    function getZones() {
        // return a list of zones (which will be put into a drop-down menu
        // on the add/edit forms)
        $this->set('zones',$this->Site->Zone->find('list'));
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
    
    function getRoadTypes() {
        // identical to getZones
        $this->set('roadtypes',$this->Site->RoadType->find('list'));
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
        $this->set('networkradios',$this->Site->NetworkSwitch->find('list'));
    }
    
    function add() {
        $this->Site->create();

        // get a list of things the Site may belong to
        $this->getTowerOwners();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->getNetworkSwitches();
        $this->getNetworkRouters();
        $this->getNetworkRadios();
        
        $zones = $this->Site->Zone->find('list');
        
        $this->set(compact('zones'));
                
        // should I wrap all the following with?
        // if ($this->request->is('post')) {        

        // I don't think this is needed anymore?!
        if ( $this->request->data != null ) {
            $this->set('lat',$this->request->data['Site']['lat']);
            $this->set('lon',$this->request->data['Site']['lon']);
        }

        // store the currently logged in user as a reference for the created site
        // The user() function provided by the component returns any column from
        // the currently logged in user.  We used this method to add the data into
        // the request info that is saved.
        //$this->request->data['Site']['user_id'] = $this->Auth->user('id');

        if ($this->Site->save($this->request->data)) {
            $this->Session->setFlash(__('The site has been saved'));
            $this->redirect(array('action' => 'index'));
        }
        // as above, before adding the belongsTo this caluse was in here, but this
        // no longer works -- this gets called on opening the add view
        // commenting out for now
        /*
        else {
            //$this->Session->setFlash(__('The site could not be saved. [Error 001]'));
        }
        */
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
        $this->getNetworkSwitches();
        $this->getNetworkRouters();
        $this->getNetworkRadios();
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Site->save($this->request->data)) {
                $this->Session->setFlash(__('The site has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The site could not be saved. [Error 002]'));
            }
        } else {
            // show edit page
            $this->request->data = $this->Site->read(null, $id);
        }
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

    
}

?>

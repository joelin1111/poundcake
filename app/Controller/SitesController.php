<?php
/**
 * Controller for sites.
 *
 * This is a very basic controller to add/view/update/delete sites, a
 * core object within the Poundcake application.
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
 * @since         SitesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

class SitesController extends AppController
{
    /*
     * Helpers we use:
     * - AjaxMultiUpload is used for the file upload plugin
     * - GoogleMap is the Marc Fernandez Google Map helper (previously renamed
     * AltGoogleMapV3 if that's visible in the comments anyplace)
     * - MyHTML makes de-links hyperlinks for view-only users
     * - PhpThumb does image thumbnails for attached images
     */
    var $helpers = array(
        'AjaxMultiUpload.Upload',
        'GoogleMap',
        'MyHTML',
        'PhpThumb'
    );
    
    /*
     * Compoenents to import
     */
    public $components = array('AjaxMultiUpload.Upload','RequestHandler'); //,'DebugKit.Toolbar'
    
    /*
     * Field names for the form itself, 'model' => 'Site'
     */
    public $presetVars = array(
        array(
            'field' => 'name',
            'type' => 'value'
        ),
    );
    
    /*
     * Callback function, can't remember exact usage
     */
    public function beforeFilter() {
        parent::beforeFilter();
        // allow anyone access to the cron page -- this should be restricted
        // by Apache
        $this->Auth->allow( 'cron' );
        $this->set('name', $this->Site->name);
    }
    
    /*
     * Main listing for all Sites - is a bit more complicated as it also handels
     * search, loading past searches and wildcarding searches
     */
    function index($id = null) {
        
        $this->getSiteStates();

        // passing checkbox search parameters in-between pages with the
        // Pagination controller is not working!  So we're using the session
        // variable here.
        $loadPastSearch = false;
        
        // this is true if the user is navigating around the paginated results
        if ( $this->params->action == 'index' ) {            
            $loadPastSearch = true;
        }

        // this is true when the user hits the index page for the first time
        if ( ( $this->params->action == 'index' ) && ($this->Session->read('conditions') == null) ) {            
            $loadPastSearch = false;
        }
        
        // this is a new search
        if ( isset($this->params->data['Site']) ) {
             $loadPastSearch = false;
        }

        // if the form has no values, and the users is coming from the index page
        // (i.e. going in-between paginated results) grab conditions from the Session
        // if they are coming from somewhere else, default to a new search
        if ( $loadPastSearch ) {
            $conditions = $this->Session->read('conditions');
            // this just makes sure that any past searches re-populate in the
            // fields for site code, site name, and the checkboxes
            // on the search form
            
            // turn % back into *
            $code = '';
            if (isset($conditions['AND']['0']['AND'])) {
                $code = str_replace('%','*',$conditions['AND']['0']['AND']['Site.code LIKE']);
                //echo "Site code from past search: ". $code."<br>";
            }
            $this->request->data['Site']['code'] =  $code;
                    
            // turn % back into *
            $name = '';
            if (isset($conditions['AND']['0']['AND'])) {
                $name = str_replace('%','*',$conditions['AND']['0']['AND']['Site.name LIKE']);
                //echo "Site name from past search: ". $name."<br>";
            }
            $this->request->data['Site']['name'] =  $name;
            
            // this array just tells the view what boxes to keep checked
            // when the page refreshes
            $checked = array();
            if (isset($conditions['AND']['1']['OR'])) {
                foreach ($conditions['AND']['1']['OR'] as $key => $val) {
                    if (isset($val['Site.site_state_id']))
                        array_push($checked,$val['Site.site_state_id']);
                }
            }
            $this->request->data['Site']['site_state_id'] = $checked;            
            
        } else {
            // get search stuff from the form that was sent in
            $conditions = "";                
            $code_arg = "";
            $name_arg = "";
            $site_state_id_arg = "";
            // this indexes should always exist, but they may be empty!

            if (isset($this->data['Site']['code'])) {
                $code_arg = str_replace('*','%',$this->data['Site']['code']);
            }
            if (isset($this->data['Site']['name'])) {
                $name_arg = str_replace('*','%',$this->data['Site']['name']);
            }

            $site_states = array();
            if (isset($this->data['Site']['site_state_id'])) {
                $states = $this->data['Site']['site_state_id'];            
                if ( isset($states[0] )) {
                    foreach ( $states as $state ) {
                        array_push( $site_states, array('Site.site_state_id' => $state) );
                    }
                }           
            }

            // greedy search
            $code_arg .= '%';
            $name_arg .= '%';
            
            // we basically have to have something in the site_state_id field, so if the
            // user didn't check anything, stick a wildcard in there
            if ( count( $site_states ) == 0 ) {
                $site_states = array('Site.site_state_id LIKE' => '%');
            }

            $conditions = array(
                'AND' => array(
                    array('AND' => array(
                        'Site.code LIKE' => $code_arg,
                        'Site.name LIKE' => $name_arg,
                        //'Site.site_state_id ' => $site_state_id_arg,
                        'Site.project_id' => $this->Session->read('project_id') // only show sites for the current project
                    )),
                    array('OR' => $site_states)
            ));

            $this->Session->write( 'conditions', $conditions );
        }
        
        // paginate the results
        $this->paginate = array(
            // limit is the number per page 
            'limit' => 20,
            'conditions' => $conditions,
            'order' => array(
                'Site.code' => 'asc',
                'Site.name' => 'asc',
            ),
        );
        
        $data = $this->paginate('Site');
        
//        $log = $this->Site->getDataSource()->getLog(false, false);
//        debug($log);
//        
        $this->set('sites',$data);        
        $this->set('installteams',$this->Site->InstallTeam->find('list'));
    }
 
    /*
     * Set an array of site states for use in the legend
     */
    public function buildLegend() {
        $allSiteStates = $this->Site->SiteState->find('all');
        $this->set('allSiteStates', $allSiteStates);
    }
    
    /*
     * Overivew page with main project map
     */
    public function overview() {
        /*
        // get all the sites for display on the map - ignore any without lat/lon
        // skip any that don't have coordinates in the db
        $conditions = array (
            "NOT" => array (
                "Site.lat" => null
                )
            );
        */
        
        $conditions = array(
            'AND' => array(
                'Site.project_id' => $this->Session->read('project_id') // only show sites for the current project
            )
        );
        
        $this->Site->recursive = 0;
        $sites = $this->Site->find('all', array('conditions' => $conditions));
        
        //$sites = $this->Site->findByProjectId( $this->Session->read('project_id') );
        $this->set('sites', $sites);
        $this->getSiteStates();
        $this->buildLegend();
        //$project = $this->Site->Project->findById($this->Site->field('project_id'));
        $project = $this->Site->Project->findById($this->Session->read('project_id'));
        $this->set('default_lat', $project['Project']['default_lat']);
        $this->set('default_lon', $project['Project']['default_lon']);
    }
    
    /*
     * Import a KML file of sites
     */
    public function import() {
        if ($this->request->data != null ) {
            
            $overwrite = false;
            if ( isset($this->request->data['overwrite'] )) {
                if ( $this->request->data['overwrite'] == 'true') {
                    $overwrite = true;
                }
            }
            
            if (is_uploaded_file( $this->request->data['Site']['File']['tmp_name'] )) {
                $fileData = fread(fopen($this->request->data['Site']['File']['tmp_name'], "r"), $this->request->data['Site']['File']['size']);

                $filename = $this->request->data['Site']['File']['tmp_name'];
                $finfo = finfo_open(FILEINFO_MIME_TYPE);
                $mime = finfo_file($finfo, $filename);
                
                // .kmz files are MIME type application/zip
                if ( $mime == 'application/xml' ) {
                    $xml = simplexml_load_file( $filename );
                    if ( $xml != null ) {
                        // $this->parseKML( $xml->Document->Folder->children(), $overwrite );
                        $this->parseKML( $xml->Document->children(), $overwrite );
                    }
                    $this->redirect(array('action' => 'index'));
                }
            }
        }
    }
    
    /*
     * Recursive KML parser
     */
    private function parseKML( $xml, $overwrite ) {
        if ( $xml != null ) {
//            debug ($xml);
            if ( isset( $xml->Folder ) ) {
                // this is untested, but should recurse if there are nested folders
                $this->parseKML( $xml->Folder->children(), $overwrite );
            } else {
                $count = $xml->Placemark->count();
                $i = 0;
                while ( $i < $count ) {
//                    debug($xml);
                    // must cast to string here
                    $name = (string)$xml->Placemark[$i]->name;
                    
                    $coords = explode(",", $xml->Placemark[$i]->Point->coordinates);
                    $lon = $coords[0];
                    $lat = $coords[1];
                    
                    // we need a site code -- remove all special characters,
                    // whitespace, grab the first 6 characters and make it
                    // uppercase -- the user can change it later
                    $code = $name;
                    preg_replace('/[^a-zA-Z0-9_ %\[\]\.\(\)%&-]/s', '', $code);
                    $code = str_replace(' ', '', $code);
                    $code = strtoupper( substr($code, 0, 6) );
                    
                    if ( $overwrite ) {
                        $site = $this->Site->findByname( $name );
                        if (isset( $site['Site']['id'] )) {
                            $this->Site->delete( $site['Site']['id'] );
                        }
                    }
//                    echo( "$name, Code: $code, is at $lat, $lon<br>" );
                    $this->Site->create();
                    $this->Site->set( 'name', $name );
                    $this->Site->set( 'code', $code );
                    $this->Site->set( 'lat', $lat );
                    $this->Site->set( 'lon', $lon );
                    $this->Site->set( 'project_id', $this->Session->read('project_id') );
                    $this->Site->save();
//                    debug( $this->Site->data );
                    $i++;
                }
            }
        }        
        return;
    }
    
    /*
     * Recursive KML parser - deprecated, was used with Sam's KML for InternetNow
     */
    private function parseKML_old_Sam ( $xml, $overwrite ) {
        if ($xml != null ) {
            if ( $xml->Folder != null ) {
                $count = $xml->Folder->count();
                if ( $count == 0 ) {
                    $children = $xml->children();
//                    debug( $xml );
                    foreach ( $children as $child ) {
                        if ( $child->Point->coordinates ) {
                            $coords = explode(",", $child->Point->coordinates);
                            $name = $child->name;
                            debug ($name);
                            $lat = $coords[0];
                            $lon = $coords[1];
                            if ($overwrite) {
                                $site = $this->Site->findByname( $name );
                                if (isset($site['Site']['id'])) {
                                    $this->Site->delete($site['Site']['id']);
                                }
                            }                   
                            $this->Site->create();
                            $this->Site->set( 'name', (string)$name ); // converts it from SimpleXMLElement Object back to a string
                            $this->Site->set( 'lat', $lat );
                            $this->Site->set( 'lon', $lon );
                            $this->Site->set( 'project_id', $this->Session->read('project_id') );
                            $this->Site->save();
                        }
                    }
                }
                
                $i = 0;
                while ( $i < $count ) {
                        $this->parseKML( $xml->Folder[$i], $overwrite );
                    $i++;
                }
            }
        }
        return;
    }
   
    /*
     * Export sites into a KML file
     * @see https://developers.google.com/kml/articles/phpmysqlkml
     */
    public function export() {
        $dom = new DOMDocument('1.0', 'UTF-8');
        // Creates the root KML element and appends it to the root document.
        $node = $dom->createElementNS('http://earth.google.com/kml/2.1', 'kml');
        $parNode = $dom->appendChild($node);
        // Creates a KML Document element and append it to the KML element.
        $dnode = $dom->createElement('Document');
        $docNode = $parNode->appendChild($dnode);
        // Creates the two Style elements, one for restaurant and one for bar, and append the elements to the Document element.
        $restStyleNode = $dom->createElement('Style');
        $restStyleNode->setAttribute('id', 'restaurantStyle');
        $restIconstyleNode = $dom->createElement('IconStyle');
        $restIconstyleNode->setAttribute('id', 'restaurantIcon');
        $restIconNode = $dom->createElement('Icon');
        $restHref = $dom->createElement('href', 'http://maps.google.com/mapfiles/kml/pal2/icon63.png');
        $restIconNode->appendChild($restHref);
        $restIconstyleNode->appendChild($restIconNode);
        $restStyleNode->appendChild($restIconstyleNode);
        $docNode->appendChild($restStyleNode);
        $barStyleNode = $dom->createElement('Style');
        $barStyleNode->setAttribute('id', 'barStyle');
        $barIconstyleNode = $dom->createElement('IconStyle');
        $barIconstyleNode->setAttribute('id', 'barIcon');
        $barIconNode = $dom->createElement('Icon');
        $barHref = $dom->createElement('href', 'http://maps.google.com/mapfiles/kml/pal2/icon27.png');
        $barIconNode->appendChild($barHref);
        $barIconstyleNode->appendChild($barIconNode);
        $barStyleNode->appendChild($barIconstyleNode);
        $docNode->appendChild($barStyleNode);

        // if the user ran a search then grab that search and generate the KML
        // based on that set of sites, else grab all sites for this project
        $conditions = $this->Session->read('conditions');
        $this->Site->recursive = -1; // we only need Site data, not related data
        if ( $conditions != null ) {
            $sites = $this->Site->find('all',array('conditions' => $conditions ));
        } else {
            $sites = $this->Site->findAllByProjectId( $this->Session->read('project_id') );
        }
        
        foreach ($sites as $site ) {
            $node = $dom->createElement('Placemark');
            $placeNode = $docNode->appendChild($node);
            // Creates an id attribute and assign it the value of id column.
            $placeNode->setAttribute('id', 'placemark' . $site['Site']['id']); // CakePHP primary key -- not sure if this should be code?
            // Create name, and description elements and assigns them the values of the name and address columns from the results.
            $nameNode = $dom->createElement('name',htmlentities($site['Site']['name']));
            $placeNode->appendChild($nameNode);
            // Creates a Point element.
            $pointNode = $dom->createElement('Point');
            $placeNode->appendChild($pointNode);
            // Creates a coordinates element and gives it the value of the lng and lat columns from the results.
            $coorStr = $site['Site']['lon'] . ','  . $site['Site']['lat'];
            $coorNode = $dom->createElement('coordinates', $coorStr);
            $pointNode->appendChild($coorNode);
        }

        $kmlOutput = $dom->saveXML();
        $this->set('data',$kmlOutput);
        
        $project_name = preg_replace('/\s+/', '', $this->Session->read('project_name'));
        $project_name = preg_replace('/(\(|\))/', '', $project_name);
        $this->set('filename',$project_name);
        
        $this->layout = 'blank';
        $this->render('export');
        $this->layout = 'default';        
    }
    
    /*
     * 
     */
    function getContacts($id = null) {
        // sometimes I think my head is going to explode - I had a hard time finding
        // contacts for this site's tower owner, this is the model setup:
        // 
        // Site belongsTo Organization
        // Organization hasMany Sites
        // Organization hasMany Contacts
        // Contact belongsTo Organization
        
        // get the ID of the current site's tower owner
        $id = $this->Site->data['Site']['organization_id'];
        //echo "ID is" . $id;
        $conditions = array (
            //'id' => $id // tower_owner.id = site.organization_id
            'organization_id' => $this->Site->data['Site']['organization_id']
        );
        
        $contacts = $this->Site->Organization->Contact->find(
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

        // clean up the listing, since some of these can be long
        $this->set(compact('contacts'));
    }
    
    /*
     * Get an array of build items -- items for the "board" build
     */
    function getBuildItems() {
       $this->loadModel('BuildItems');
       $this->BuildItems->bindModel(array('belongsTo' => array('BuildItemTypes' => 
                             array('foreignKey' => 'build_item_type_id'))));
       $options = array('order' => 'BuildItems.build_item_type_id', 'recursive'=> 2); // order by item type
       $builditems = $this->BuildItems->find('all', $options); //,array('recursive' => 2));
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
    
    /*
     * 
     */
    function schedule($id) {
        $this->Site->InstallTeam->id=$id;
        $this->set('teamname',$this->Site->InstallTeam->field('name'));
        if ($id != null) {
            $query = 'call sp_schedule('.$id.')';
            $this->set('schedule',$this->Site->InstallTeam->query( $query ));
        }
    }
    
    /*
     * Manually check if the user is allowed to view this site by checking them
     * against the projects table
     */
    function isAllowed($project_id, $uid) {
        //  There is probably a Cake-ier way to do this!
        $query = 'select * from projects_users where user_id='.$uid.' and project_id='.$project_id;
        $result = $this->Site->query($query);
        return (sizeof($result) > 0 ? true : false);
    }
    
    /*
     * View a site
     */
    function view($id = null) {
        $this->Site->id = $id;
        $this->set('id',$id);
        
        if (!$this->Site->exists()) {
            throw new NotFoundException('Invalid site');
        }
  
        $site = $this->Site->read(null, $id);
        
        // don't go any further if the user is not in the same project as this site
        if (!$this->isAllowed($this->Site->data['Site']['project_id'], $this->Auth->user('id')) ) {
            $this->redirect(array('action' => 'index'));
        }
        
        $this->getContacts($id);
        $this->getAllSitesForProject();
        
        $this->getBuildItems();
        $code = $this->Site->data['Site']['code'];       
        $radios = $this->Site->NetworkRadios->findAllBySiteId($id);
        $n = 0;
        foreach ($radios as $radio) {
            // get the ID of any remote radio
            // this site could be a multipoint end, so there could be more than
            // one attached radio
            $query = 'call sp_get_remote_links('.$radio['NetworkRadios']['id'].')';
            $links = $this->Site->query( $query );
            foreach ($links as $link) {
                $d = $this->getLinkLatLon($link['radios_radios']['dest_radio_id']);
                $radio['NetworkRadios']['link_lat'] = $d[0];
                $radio['NetworkRadios']['link_lon'] = $d[1];
                $radio['NetworkRadios']['link_icon'] = $d[2];
                $radio['NetworkRadios']['window_text'] = $d[3];
            }
            $radios[$n] = $radio;
            $n++;
        }
        $this->set('radios', $radios);
        
        $ip_addresses = $this->getAllIPAddresses($code);
        $this->set(compact('ip_addresses'));
        $this->set('site', $site);
    }

    /*
     * 
     */
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
        $declination = $this->Site->getDeclination($lat,$lon);        
        $mag_azimuth = 0;
        if ($true_azimuth > 0) {
            $mag_azimuth = $true_azimuth - $declination;
        }
        
        $this->set('remote',array($r_dist,$true_azimuth,$mag_azimuth));
        $this->layout = 'ajax';
    }
    
    /*
     * Retuns an array containing the lat/lon of the Site for the remote radio
     */
    function getLinkLatLon($r_radio_id) {
        $this->loadModel('NetworkRadio',$r_radio_id);
        $r_radio = $this->NetworkRadio->read(null,$r_radio_id);
        $r_site = $this->Site->read(null,$r_radio['NetworkRadio']['site_id']);     
        return array (
            $r_site['Site']['lat'],
            $r_site['Site']['lon'],
            'data:'.$r_site['SiteState']['img_type'].';base64,'.base64_encode( $r_site['SiteState']['img_data'] ),
            $r_site['Site']['site_vf']
        );        
    }
    
    /*
     * Sets an array of zones
     */
    function getZones() {
        $this->set('zones',$this->Site->Zone->find('list',array('order' => array('Zone.name ASC'))));
    }
    
    /*
     * Save an array of connectivity types
     */
    function getConnectivityTypes() {
        $this->Site->ConnectivityType->
        $this->set('connectivitytypes',$this->Site->ConnectivityType->find('list'));
    }
    
    /*
     * Save an array of site states
     */
    function getSiteStates() {
        $this->set('sitestates',$this->Site->SiteState->find('list'));
    }
    
    /*
     * Save an array of power types
     */
    function getPowerTypes() {
        $this->set('powertypes',$this->Site->PowerType->find('list'));
    }
    
    /*
     * Save an array of tower types
     */
    function getTowerTypes() {
        $this->set('towertypes',$this->Site->TowerType->find('list'));
    }
    
    /*
     * Save an array of tower members
     */
    function getTowerMembers() {
        $this->set('towermembers',$this->Site->TowerMember->find('list'));
    }
    
    /*
     * Save an array of equipment spaces
     */
    function getEquipmentSpace() {
        $this->set('equipmentspace',$this->Site->EquipmentSpace->find('list'));
    }
    
    /*
     * Save an array of tower mounts
     */
    function getTowerMounts() {
        $this->set('towermounts',$this->Site->TowerMount->find('list'));
    }   
    
    /*
     * Save an array of network switches
     */
    function getNetworkSwitches() {
        $this->set('networkswitches',$this->Site->NetworkSwitch->find('list'));
    }
    
    /*
     * Save an array of network routers
     */
    function getNetworkRouters() {
        $this->set('networkrouters',$this->Site->NetworkRouter->find('list'));
    }
    
    /*
     * Save an array of network radios
     */
    function getNetworkRadios() {
        // Cake uses lazy binding, so we must explicitly bind here
        $this->Site->bindModel(array('hasMany' => array('NetworkRadio' => 
                             array('foreignKey' => 'site_id'))));
        $this->set('networkradios',$this->Site->NetworkRadio->find('list'));
    }
    
    /*
     * Save an array of radio types
     */
    function getRadioTypes() {
        $this->set('radiotypes',$this->Site->NetworkRadio->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    /*
     * Save an array of antenna types
     */
    function getAntennaTypes() {
        $this->set('antennatypes',$this->Site->NetworkRadio->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    
    /*
     * Save an array of install teams
     */
    function getInstallTeams() {
        $this->set('installteams',$this->Site->InstallTeam->find('list',
            array(
                'order' => array(
                    'InstallTeam.name ASC'
            )))
        );
    }
    
    /*
     * Return all the organizations the user may be assigned to
     */
    function getOrganizations() {
        // moved this into AppController since ContactsController has to do the same thing
        return parent::getOrganizationsForCurrentProject('Site');
    }
    
    /*
     *
     */
    function add() {
        $this->Site->create();
        
        // Cake has lazy model binding -- it seems we have to do this to allow
        // the saveAssociated bit to work
        $this->Site->bindModel(array('hasMany' => array('NetworkRadio' => 
                             array('foreignKey' => 'site_id'))));

        $this->getOrganizations();
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
        //$this->getUserProjects();
        $this->getZones();
        
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

            // if there is a lat/lon, compute the declination then save it back to the request object
            if (isset($this->request->data['Site']['lat']) && isset($this->request->data['Site']['lon'])) {
                $this->request->data['Site']['declination'] = $this->Site->getDeclination($this->request->data['Site']['lat'],$this->request->data['Site']['lon']);
            }
            
            //if ($this->Site->saveAssociated($this->request->data, array('validate'=>true))) {
            if ($this->Site->saveAssociated($this->request->data, array('validate'=>false))) {
                $this->Session->setFlash('Success! The site has been saved.');
                $this->redirect(array('action' => 'index'));
            }
        }
    }
    
    /*
     * Delete a site
     */
    function delete($id) {
        $this->Site->id = $id;
        if (!$this->Site->exists()) {
            throw new NotFoundException('Invalid site');
        }
        
        if ($this->Site->delete()) {
            // Cleanup any files associated with this site
            $this->Upload->deleteAll('Site', $id);
            $this->Session->setFlash('Site deleted.');
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->setFlash('Error!  Site was not deleted.');
            $this->redirect(array('action' => 'index'));
        }
    }

    /*
     * Edit a site
     */
    function edit($id = null) {
        $this->Site->id = $id;
        
        // get a list of zones, etc. the site may belong to
        $this->getZones();
        $this->getOrganizations();
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
        
        if (!$this->Site->exists()) {
            throw new NotFoundException('Invalid site');
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
            $this->request->data['Site']['declination'] = $this->Site->getDeclination($this->request->data['Site']['lat'],$this->request->data['Site']['lon']);
            
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
                
                $this->Session->setFlash('The site has been saved.');
                // keep the user on the edit page so they can continue
                // adding radios to the site
                $this->redirect(array('action' => 'edit', $this->Site->id));


            } else {
                $this->Session->setFlash('Error!  The site could not be saved.');
            }
        } else {
            // show edit page
            $this->request->data = $this->Site->read(null, $id);
            
            // don't go any further if the user is not in the same project as this site
            if (!$this->isAllowed($this->Site->data['Site']['project_id'], $this->Auth->user('id')) ) {
                $this->redirect(array('action' => 'index'));
            }
//            echo '<pre>';
//            print_r($this->request->data);
//            echo '</pre>';
        }
    }
    
    /*
     * Generates an Excel XML workorder
     */
    public function workorder($id) {
        $conditions = '';
        $sites = $this->Site->findById($id);
        $conditions = array (
            "Contact.contact_type_id" => "2", // 2 is the primary key of the technical contact
            "Contact.priority" => "1", // 1 is the base priority level
            "Contact.organization_id" => $sites['Site']['organization_id']
        );
        $towercontacts = $this->Site->Organization->Contact->find('all',array('conditions' => $conditions));        
        $router = $this->Site->NetworkRouter->findByRouterTypeId($sites['NetworkRouter']['router_type_id']);
        $switch = $this->Site->NetworkSwitch->findBySwitchTypeId($sites['NetworkSwitch']['switch_type_id']);
        
        $radios = $this->Site->NetworkRadios->findAllBySiteId($id,array(),array('NetworkRadios.switch_port' => 'ASC'));
        
        // this seems kind of crazy -- and it is -- but since I'm not saving the link distance or bearing on the
        // NetworkRadio object (they are computed at view time), and really I can't do that since
        // link_id isn't set until after save (by a trigger), now I have to go compute those values again and save them
        // back to my array
        $n = 0;
        foreach ($radios as $radio) {
            //echo $radio['NetworkRadio']['name']."<br>";
            $this->loadModel('NetworkRadio');
            
            // get all the radios this radio may be linked to
            $query = 'call sp_get_remote_links('.$radio['NetworkRadios']['id'].')';
            $links = $this->NetworkRadio->query( $query );       
//            echo '<pre>';
//            print_r($links);
//            echo '</pre>';
            
            // this is pretty much usually going to be an array of one, except if
            // it's a multipoint radio, in which case distance and true_azimuth
            // will be set to the value of the final
            // item in the link array
            // guessing the person editing the work order will tweak that anyhow
            foreach ($links as $link) {
                $radio['NetworkRadios']['distance'] = 'N/A';
                // if it's not a sector radio, then calculate link distance and bearing
                if ($radio['NetworkRadios']['sector'] == 0 ) {
                    $link_id = $link['radios_radios']['dest_radio_id'];
                    $d = $this->NetworkRadio->getLinkDistance($radio['NetworkRadios']['id'],$link_id);
                    $radio['NetworkRadios']['distance'] = $d;

                    $b = $this->NetworkRadio->getRadioBearing($radio['NetworkRadios']['id'],$link_id);
                    $radio['NetworkRadios']['true_azimuth'] = $b;
                }
            }            
            
            $ip_address = '';
            $ip_address = $this->getIPAddress($radio['NetworkRadios']['name']);
            $radio['NetworkRadios']['ip_address'] = $ip_address;
            
            $gw_address = '';
            $gw_address = $this->getGatewayAddress($radio['NetworkRadios']['name']);
            $radio['NetworkRadios']['gw_address'] = $gw_address;
            
            $radios[$n] = $radio;
            $n++;
        }
//        echo "***********";
//        echo '<pre>';
//        print_r($radios);
//        echo '</pre>';
//        die;
        $this->set('site', $sites);
        $this->set('towercontacts', $towercontacts);
        $this->set('router', $router);
        $this->set('switch', $switch);
        $this->set('radios', $radios);
        
//        echo '<pre>';
//        print_r($sites);
//        echo '</pre>';
//        die;
        
        // the title on a work order is part of a project's meta-data
        if (isset($sites['Project']['workorder_title'])) {
            $title = $sites['Project']['workorder_title'];
        } else {
            $title = 'Inveneo Work Order';
        }
        $this->set('title',$title);
        
        // generate the Excel file but without all the other stuff
        // in the layout -- so set the layout to null then set it back
        //$layout = $this->layout;
        $this->layout = 'blank';
        $this->render('workorder');
        $this->layout = 'default';
    }
    
    /*
     * 
     */
    public function cron( $project_id ) {
        // there is no view
        // $this->autoRender = false;
        $this->layout = 'blank';
        if ( $project_id > 0 ) {
//            echo $project_id;

            // we could get this off each site, but let's try to keep it faster
            // by getting project info first, then making recurive -1 below
            $this->loadModel( 'Project', $project_id );
            $project = $this->Project->read();
            $ms_url = $this->Project->field( 'monitoring_system_url' );
            $ms_user = $this->Project->field( 'monitoring_system_username' );
            $ms_pass = $this->Project->field( 'monitoring_system_password' );
            
            if ( isset( $ms_url ) && isset( $ms_user ) && isset( $ms_pass ) ) {
                
                $HttpSocket = parent::getMonitoringSystemSocket( $ms_user, $ms_pass );
                
                if ( !is_null( $HttpSocket ) ) {
                    
                    // we need to correlate node IDs with devices in our system
                    // so first, go get all the nodes in the system
                    $response = $HttpSocket->request(
                        array(
                            'method' => 'GET',
                            'uri' => $ms_url.'/nodes?limit=0',
                            'header' => array('Content-Type' => 'application/xml')
                        )
                    );
                    
                    // now let's iterate through them
                    $xmlIterator = new SimpleXMLIterator( $response->body );
                    
                    $n = 0;
                    for( $xmlIterator->rewind(); $xmlIterator->valid(); $xmlIterator->next() ) {
                        if( $xmlIterator->hasChildren() ) {
                            $attrs = $xmlIterator->current()->attributes();
//                            debug( $attrs );
                            
                            $node_label = $xmlIterator->current()->attributes()->label;
                            $node_id = $xmlIterator->current()->attributes()->id;
                            $node_foreign_id = $xmlIterator->current()->attributes()->foreignId;  
                            
                            echo $node_label.'<br>';
                            echo $node_id.'<br>';
                            echo $node_foreign_id.'<br><br>';
                            
                            // now get the status of the intefaces on that node
                            $response2 = $HttpSocket->request(
                                array(
                                    'method' => 'GET',
                                    'uri' => $ms_url.'/nodes/'.$node_id.'/ipinterfaces',
                                    'header' => array('Content-Type' => 'application/xml')
                                )
                            );
                            
                            // debug( $response->body );
                            
                            $xmlIterator2 = new SimpleXMLIterator( $response2->body );
//                            $u = 0;
//                            $j = null; // array to hold ip -> status pairs
                            for( $xmlIterator2->rewind(); $xmlIterator2->valid(); $xmlIterator2->next() ) {
                                if( $xmlIterator2->hasChildren() ) {
                                    
                                    // debug( $xmlIterator2->current() );
                                    $snmpPrimary = (string)$xmlIterator2->current()->attributes()->snmpPrimary;
                                    
                                    // we're only concerned about the primary interface
                                    if ( $snmpPrimary == "P" ) {
                                    
                                        // reset our variables
                                        $ip = null;
                                        $is_down = null;
                                        $radio = null;

                                        // var_dump($xmlIterator->current());

                                        // get the IP address
                                        $ip = (string)$xmlIterator2->current()->ipAddress;
                                        debug($ip);

                                        // get the status
                                        $is_down = (string)$xmlIterator2->current()->attributes()->isDown;
                                        if ( $is_down === "false" )
                                            $is_down = 0;
                                        else
                                            $is_down = 1;
                                        echo "is_down: $is_down <br>";

                                        // find the radio by the foreign Id
                                        $this->loadModel( 'NetworkRadio' );
                                        $this->NetworkRadio->recursive = -1; // we only need radio data
                                        $radio = $this->NetworkRadio->findByForeignId( $node_foreign_id );
                                        if ( $radio != null ) {
                                            $radio['NetworkRadio']['is_down'] = $is_down;
                                            debug( $radio['NetworkRadio'] );
                                            $this->NetworkRadio->save( $radio );
                                        }
                                    }
                                }
                            }
                            $response2 = null;
                            $node_label = null;
                            $node_id = null;
                            $node_foreign_id = null;
                        }
                    }
                    die;
                    
                    /*
                    //$this->Site->recursive = -1; // only return Site data
                    $sites = $this->Site->findAllByProjectId( $project_id );
                    foreach ( $sites as $site ) {
                        //debug($site['Project']['name']);
                        echo '<pre>';
                        foreach( $site['NetworkRadios'] as $radio ) {
                            print_r( $radio );
                        }

                        echo '</pre>';

                        debug($site['Site']['name']);
    //                    debug( $site );
                    }
                    */
                }
            }
        }
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        // pages that anyone (basically with the view rolealias) can access
        $allowed = array( "index", "view", "overview", "workorder", "cron" );
        if ( in_array( $this->action, $allowed )) {
            return true;
        }
        
        // pages that editors can access
        $allowed = array( "add","edit", "delete", "export" );
        if ( in_array( $this->action, $allowed )) {
            // maybe this is duplicative to check role here...
            if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'edit') {
                return true;
            }
        }
        
        // else you must be an admin
        return parent::isAuthorized($user);
    }   
}
?>

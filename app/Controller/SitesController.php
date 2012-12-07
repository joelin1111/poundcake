<?php

//App::uses('Xml', 'Utility'); // needed?

class SitesController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // AltGoogleMapV3 is the Marc Fernandez Google Map helper, just renamed
    // AutoCompleteHelper removed -- not used
    var $helpers = array(
        'AjaxMultiUpload.Upload',
        'GoogleMap',
        'MyHTML',
        'PhpThumb.PhpThumb',
        'PhpThumb',
        //'XmlView'
    );

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
    
    /*
    I don't think this is needed anymore since the current project is available
    as a session variable
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
        return $projects;
    }
    */
    
    function index($id = null) {
        
        $this->getSiteStates();

        // passing checkbox search parameters in-between pages with the
        // Pagination controller is not working!  So we're using the session
        // variable here.
        
//        echo '<pre>Params>Data:<BR>';
//        print_r($this->params->controller);
//        print_r($this->params->action);
        
        $loadPastSearch = false;
        // this is true if the user is navigating around the paginated results
        if ( $this->params->action == 'index' ) {            
            $loadPastSearch = true;
        }
        
        // this is a new search
        if ( isset($this->params->data['Site']) ) {
             $loadPastSearch = false;
        }
        
//        if ( isset($this->params->data['Site']) ) {
//            echo "Params:<BR>";
//            print_r($this->params->data['Site']);
//        } else {
//            echo "No params";
//        }
//        //echo "<Br>Action:".$this->params->action;
//        //print_r($this->params);
//        echo '</pre>';
        
        // if the form has no values, and the users is coming from the index page
        // (i.e. going in-between paginated results) grab conditions from the Session
        // if they are coming from somewhere else, default to a new search
        if ( $loadPastSearch ) {
            $conditions = $this->Session->read('conditions');
//            echo '<pre>Conditions:<BR>';
//            print_r($conditions['AND']['0']['AND']);
//            echo '</pre>';
            
            // this just makes sure that any past searches re-populate in the
            // fields for site code, site name, and the checkboxes
            // on the search form
            
            // turn % back into *
            $site_code = '';
            if (isset($conditions['AND']['0']['AND'])) {
                $site_code = str_replace('%','*',$conditions['AND']['0']['AND']['Site.site_code LIKE']);
                //echo "Site code from past search: ". $site_code."<br>";
            }
            $this->request->data['Site']['site_code'] =  $site_code;
                    
            // turn % back into *
            $site_name = '';
            if (isset($conditions['AND']['0']['AND'])) {
                $site_name = str_replace('%','*',$conditions['AND']['0']['AND']['Site.site_name LIKE']);
                //echo "Site name from past search: ". $site_name."<br>";
            }
            $this->request->data['Site']['site_name'] =  $site_name;
            
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
            $site_code_arg = "";
            $site_name_arg = "";
            $site_state_id_arg = "";
            // this indexes should always exist, but they may be empty!

            if (isset($this->data['Site']['site_code'])) {
                $site_code_arg = str_replace('*','%',$this->data['Site']['site_code']);
            }
            if (isset($this->data['Site']['site_name'])) {
                $site_name_arg = str_replace('*','%',$this->data['Site']['site_name']);
            }

            $site_states = array();
            if (isset($this->data['Site']['site_state_id'])) {
                $states = $this->data['Site']['site_state_id'];            
    //            echo '<pre>';
    //            print_r($this->data['Site']);
    //            print_r("Len:".$len);
    //            echo '</pre>';

                if ( isset($states[0] )) {
                    foreach ( $states as $state ) {
                        array_push( $site_states, array('Site.site_state_id' => $state) );
                    }
                }           
    //            echo '</pre>';
    //            print_r($site_states);
    //            echo '</pre>';            
            }

            // greedy search
            $site_code_arg .= '%';
            $site_name_arg .= '%';
            
            // we basically have to have something in the site_state_id field, so if the
            // user didn't check anything, stick a wildcard in there
            if (count($site_states) == 0 ) {
                $site_states = array('Site.site_state_id LIKE' => '%');
            }

            $conditions = array(
                'AND' => array(
                    array('AND' => array(
                        'Site.site_code LIKE' => $site_code_arg,
                        'Site.site_name LIKE' => $site_name_arg,
                        //'Site.site_state_id ' => $site_state_id_arg,
                        'Site.project_id' => $this->Session->read('project_id') // only show sites for the current project
                    )),
                    array('OR' => $site_states)
            ));

            $this->Session->write('conditions',$conditions);
        }
        
//        echo '<pre>';
//        print_r($conditions);
//        echo '</pre>';      

        
        
        $this->paginate = array(
            // limit is the number per page 
            'limit' => 20,
            'conditions' => $conditions,
            'order' => array(
                'Site.site_code' => 'asc',
                'Site.site_name' => 'asc',
            ),
        );
        $data = $this->paginate('Site');
        $this->set('sites',$data);
        
//        debug($this->Site->getDataSource()->getLog(false, false));
        
        $this->set('installteams',$this->Site->InstallTeam->find('list'));
    }
 
    public function buildLegend() {
        $allSiteStates = $this->Site->SiteState->find('all');
        $this->set('allSiteStates', $allSiteStates);
    }
    
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

    //            echo '<pre>';            
    //            print_r( $this->request->data['Site']['File']['tmp_name']  . '<br>' );
    //            print_r( '-'.$mime . '-<br>' );
    //            echo '</pre>';

                // .kmz files are MIME type application/zip
                if ( $mime == 'application/xml' ) {
//                    echo "Reading XML file<BR>";
                    $xml = simplexml_load_file( $filename );
                    $this->parseKML( $xml->Document->Folder->children(), $overwrite );
                    $this->redirect(array('action' => 'index'));
                }
            }
        }
    }
    
    function parseKML( $xml, $overwrite ) {
        // recursively step through the KML XML syntax looking for Placemarks
//        echo '<pre>';
        if ($xml != null ) {
            if ( $xml->Folder != null ) {
                $count = $xml->Folder->count();
                if ( $count == 0 ) {
                    //echo "look into placemarks<br>";
                    $children = $xml->children();
                    foreach ( $children as $child ) {
                        //print_r($child);
                        if ( $child->Point->coordinates ) {
                            //print_r( $child );
                            $coords = explode(",", $child->Point->coordinates);
                            //print_r($coords);
                            $site_name = $child->name;
                            $lat = $coords[0];
                            $lon = $coords[1];
//                            echo "$site_name is at $lat and $lon<br>";
                            if ($overwrite) {
//                                echo "Overwrite existing data!<BR>";
                                $site = $this->Site->findBySite_name( $site_name );
//                                echo "Site:";
//                                print_r($site);
//                                echo "<br>";
                                if (isset($site['Site']['id'])) {
//                                    echo "Delete existing site, existing ID = ".$site['Site']['id']."<BR>";
                                    $this->Site->delete($site['Site']['id']);
//                                    echo "Deleted<br>";
                                }
                            }                   
                            $this->Site->create();
                            $this->Site->set( 'site_name', (string)$site_name ); // converts it from SimpleXMLElement Object back to a string
                            $this->Site->set( 'lat', $lat );
                            $this->Site->set( 'lon', $lon );
                            $this->Site->set( 'project_id', $this->Session->read('project_id') );
//                            print_r($this->Site->data);
                            $this->Site->save();
                        }
                    }
                }
                //echo "Has $count subfolders!";
                $i = 0;
                while ( $i < $count ) {
                    //print_r( $xml->Folder[$i] );
                    $this->parseKML( $xml->Folder[$i], $overwrite );
                    $i++;
                }
            }
        }
//        echo '</pre>';
        return;
    }
    
    public function export() {
        // See:  https://developers.google.com/kml/articles/phpmysqlkml
        
        // Creates the Document.
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

        $this->Site->recursive = -1; // we only need Site data
        $sites = $this->Site->findAllByProjectId( $this->Session->read('project_id') );
        foreach ($sites as $site ) {
//            echo '<pre>';
//            print_r($site);
//            echo '</pre>';
            // creating one Placemark for each site.
            // Creates a Placemark and append it to the Document.

            $node = $dom->createElement('Placemark');
            $placeNode = $docNode->appendChild($node);

            // Creates an id attribute and assign it the value of id column.
            $placeNode->setAttribute('id', 'placemark' . $site['Site']['id']); // CakePHP primary key -- not sure if this should be site_code?

            // Create name, and description elements and assigns them the values of the name and address columns from the results.
            $nameNode = $dom->createElement('name',htmlentities($site['Site']['site_name']));
            $placeNode->appendChild($nameNode);
//            $descNode = $dom->createElement('description', $row['address']);
//            $placeNode->appendChild($descNode);
//            $styleUrl = $dom->createElement('styleUrl', '#' . $row['type'] . 'Style');
//            $placeNode->appendChild($styleUrl);

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
    
    function schedule($id) {
        //echo '<pre>';
        $this->Site->InstallTeam->id=$id;
        //$this->set('installteams',$this->Site->InstallTeam->find('first'));
        //print_r ($this->Site->InstallTeam);
        $this->set('teamname',$this->Site->InstallTeam->field('name'));
        if ($id != null) {
            $query = 'call sp_schedule('.$id.')';
            $this->set('schedule',$this->Site->InstallTeam->query( $query ));
        }
    }
    
    function isAllowed($project_id, $uid) {
        // manually check if the user is allowed to view this site by checking them
        // against the projects table -- theres probably a Cake-ier way to do this!
        $query = 'select * from projects_users where user_id='.$uid.' and project_id='.$project_id;
        $result = $this->Site->query($query);
        return (sizeof($result) > 0 ? true : false);
    }
    
    function view($id = null) {
        $this->Site->id = $id;
        $this->set('id',$id);
        
        if (!$this->Site->exists()) {
            throw new NotFoundException(__('Invalid site'));
        }
        
        $this->set('site', $this->Site->read(null, $id));
        
        // don't go any further if the user is not in the same project as this site
        if (!$this->isAllowed($this->Site->data['Site']['project_id'], $this->Auth->user('id')) ) {
            $this->redirect(array('action' => 'index'));
        }
        
        $this->getContacts($id);
        //$this->getAllSites($id);
        $this->getAllSitesForProject();
        
        $this->getBuildItems();
        $site_code = $this->Site->data['Site']['site_code'];       
        $radios = $this->Site->NetworkRadios->findAllBySiteId($id);
        $n = 0;
        foreach ($radios as $radio) {
            // get the ID of any remote radio
            // this site could be a multipoint end, so there could be more than
            // one attached radio
            $query = 'call sp_get_remote_links('.$radio['NetworkRadios']['id'].')';
            $links = $this->Site->query( $query );
            foreach ($links as $link) {
                //print_r($link);
                //$d = $this->getLinkLatLon($radio['NetworkRadios']['link_id']);
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
        
        $ip_addresses = $this->getAllIPAddresses($site_code);
        $this->set(compact('ip_addresses'));
        
        
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
        $declination = $this->Site->getDeclination($lat,$lon);        
        $mag_azimuth = 0;
        if ($true_azimuth > 0) {
            $mag_azimuth = $true_azimuth - $declination;
        }
        
        $this->set('remote',array($r_dist,$true_azimuth,$mag_azimuth));
        $this->layout = 'ajax';
    }
    
    // get the lat/lon of the Site for the remote radio
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
    
    function getZones() {
        $this->set('zones',$this->Site->Zone->find('list',array('order' => array('Zone.name ASC'))));
    }
    
    function getConnectivityTypes() {
        $this->Site->ConnectivityType->
        $this->set('connectivitytypes',$this->Site->ConnectivityType->find('list'));
    }
    
    function getSiteStates() {
        $this->set('sitestates',$this->Site->SiteState->find('list'));
    }
    
    function getPowerTypes() {
        $this->set('powertypes',$this->Site->PowerType->find('list'));
    }
    
    function getTowerTypes() {
        $this->set('towertypes',$this->Site->TowerType->find('list'));
    }
    
    function getTowerMembers() {
        $this->set('towermembers',$this->Site->TowerMember->find('list'));
    }
    
    function getEquipmentSpace() {
        $this->set('equipmentspace',$this->Site->EquipmentSpace->find('list'));
    }
    
    function getTowerMounts() {
        $this->set('towermounts',$this->Site->TowerMount->find('list'));
    }   
    
    function getNetworkSwitches() {
        $this->set('networkswitches',$this->Site->NetworkSwitch->find('list'));
    }
    
    function getNetworkRouters() {
        $this->set('networkrouters',$this->Site->NetworkRouter->find('list'));
    }
    
    function getNetworkRadios() {
        // Cake uses lazy binding, so we must explicitly bind here
        $this->Site->bindModel(array('hasMany' => array('NetworkRadio' => 
                             array('foreignKey' => 'site_id'))));
        $this->set('networkradios',$this->Site->NetworkRadio->find('list'));
    }
    
    function getRadioTypes() {
        $this->set('radiotypes',$this->Site->NetworkRadio->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    function getAntennaTypes() {
        $this->set('antennatypes',$this->Site->NetworkRadio->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    
    function getInstallTeams() {
        $this->set('installteams',$this->Site->InstallTeam->find('list',
            array(
                'order' => array(
                    'InstallTeam.name ASC'
            )))
        );
    }
    
    /*
    function getAllSites() {
        // return sites for the currently selected/active project
        $conditions = array (
            'conditions' => array('Site.project_id' => $this->Session->read('project_id'))
            );
        $this->set('sites',$this->Site->find('list', $conditions));        
    }
    */
    
    // return all the organizations the user may be assigned to
    function getOrganizations() {
        // moved this into AppController since ContactsController has to do the same thing
        return parent::getOrganizationsForCurrentProject('Site');
    }
    
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
                
                $this->Session->setFlash(__('The site has been saved'));
                //$this->redirect(array('action' => 'index'));
                // keep the user on the edit page
                $this->redirect(array('action' => 'edit', $this->Site->id));


            } else {
                $this->Session->setFlash(__('The site could not be saved.'));
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
}

?>

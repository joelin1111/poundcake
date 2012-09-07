<?php

// maybe we'll need this?
//App::uses('Sanitize','Utility');

class SchoolsController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // AltGoogleMapV3 is the Marc Fernandez Google Map helper, just renamed
    // AutoCompleteHelper removed -- not used
    var $helpers = array('AjaxMultiUpload.Upload','AltGoogleMapV3');
    
    public $components = array('AjaxMultiUpload.Upload'); //,'DebugKit.Toolbar'
    
    public $presetVars = array(
        // field names for the form itself , 'model' => 'School'
        array('field' => 'school_name', 'type' => 'value'),
        //?? revisit:  array('field' => 'district', 'type' => 'lookup', 'formField' => 'district_input', 'modelField' => 'district', 'model' => 'School'),
    );
    
    public function beforeFilter() {
        parent::beforeFilter();
        $this->set('school_name', $this->School->school_name);
    }
    
    /*
    public $paginate = array(
        'fields' => array('School.school_code', 'School.school_name'),
        'limit' => 25,
        'order' => array(
            'School.school_code' => 'asc'
        )
    );
    */
    function about() {
        // show the about page
    }
    
    function index($id = null) {
        
        $conditions = "";
        $school_code_arg = "";
        $school_name_arg = "";
        //echo $this->passedArgs['School.school_code'];
        
        if (isset($this->passedArgs['School.school_code'])) {
            $school_code_arg = str_replace('*','%',$this->passedArgs['School.school_code']);
        }
        
        if (isset($this->passedArgs['School.school_name'])) {
            $school_name_arg = str_replace('*','%',$this->passedArgs['School.school_name']);
        }
        
        // if neither argument was passed, default to a wildcard
        if ($school_code_arg == "") {
            $school_code_arg = '%';
        }
        if ($school_name_arg == "") {
            $school_name_arg = '%';
        }
        
        //echo "School code 2:<pre>".$this->passedArgs['School.school_code']."</pre>";            
        $conditions = array(
            'AND' => array(
                'School.school_code LIKE' => $school_code_arg,
                'School.school_name LIKE' => $school_name_arg,
            )
        );
        //echo "Conditions: ".print_r($conditions);
        
        $this->paginate = array(
            'School' => array(
                // limit is the number per page 
                'limit' => 20,
                'conditions' => $conditions,
                'order' => array(
                    'School.school_code' => 'asc',
                    'School.school_name' => 'asc',
                ),
            ));
        
        $data = $this->paginate('School');
        $this->set('schools',$data);
    }
 
    public function overview() {
        // find('all') would return all schools, no matter what
        //$schools = $this->School->find('all');
        
        // filter out ones w/o a location (since we can't display them on the
        // map without coordinates)
        
        // get all the schools for display on the map, and deal with their lat/lon
        
        // skip any that don't have coordinates in the db
        $conditions = array ("NOT" => array ("School.location" => null));
        $schools = $this->School->find('all', array('conditions' => $conditions));
        for($i = 0; $i < sizeof($schools); ++$i) {
            // for each school, decode the lat/lon and save it back to the
            // array of schools
            //echo "<pre> School ID = ".$schools[$i]['School']['id']."</pre>";
            // we're actually overwriting the School's "location" field (which
            // comes back as a binary object) with the decoded lat/lon
            $schools[$i]['School']['location'] = $this->getLatLon( $schools[$i]['School']['id'], 'schools' );
        }
        $this->set('schools', $schools);
    }
    
    function getSchoolsNearby($id = null, $max_schools = 5) {
        // return the nearest schools using the MySQL stored procedure
        // sp_nearby
        if ($id != null && $max_schools != null) {
            $query = 'call sp_nearby('.$id.','.$max_schools.')';
            $nearby = $this->School->query( $query );
            /* not really sure why the distance comes back in its own array here,
             example:
             
                [2] => Array
                    (
                        [schools] => Array
                            (
                                [id] => 2
                                [school_name] => CHITANDI
                            )

                        [0] => Array
                            (
                                [distance] => 5.8482689198309625
                            )

                    )

             */
            $this->set('nearby', $nearby);
        }
    }
    
    function setLatLon($id = null) {
        // this function sets the decoded latitude and logitude for a school to
        // a varaible on the School model
        
        //echo '<pre> (setLatLon) ID: ' . $id . '</pre>';
        if ($id <> null) {
            // normally this would be $this->School->Location->find() but since
            // the location table has a column that is not in text (e.g. MySQL
            // spatial extensions, type POINT) we have to override it and use
            // to the GPS coordinates back as text
            // calling X(location) returns the latitude coordinate, Y(location)
            // returns the longitude coordinate
            // for future reference?  Note AsText(location)
            $query = 'SELECT X(location) AS lat, Y(location) AS lon FROM schools WHERE id = ' . $id;
            $location = $this->School->query( $query );
            /*
            echo '<pre>' . print_r( $location ) . '</pre>';
            echo '<pre>' . print_r($location[0]) . '</pre>';
            echo '<pre>' . print_r($location[0][0]) . '</pre>';
            */
            //echo '<pre> (setLatLon)  Latitude: ' . $location[0][0]['lat'] . '</pre>';
            //echo '<pre> (setLatLon) Longitude: ' . $location[0][0]['lon'] . '</pre>';
            
            // not sure if this is the best way to do this, but I'm having a
            // hard time unpacking the spatial data type in the view, so saving
            // lat/lon to a variable on the School model
            $this->set('lat', $location[0][0]['lat']);
            $this->set('lon', $location[0][0]['lon']);
            //Debugger::dump($this->School->Location);
            //$this->School->Location->set('lat',$location[0][0]['lat']);
            //$this->set('lon',$location[0][0]['lon']);
            //$this->set('location',$location[0][0]);
            //$this->set('location',$location[0][0]);
        }
    }
    
    function getLatLon($id = null, $table) {
        // this function is basically like setLatLong except that it returns the 
        // lat/lon as an array
        //echo '<pre> (getLatLon) ID: ' . $id . '</pre>';
        $latlon = null;
        if ($id <> null) {
            $query = 'SELECT X(location) AS lat, Y(location) AS lon FROM '.$table.' WHERE id = ' . $id;
            $location = $this->School->query( $query );
            //echo '<pre> (getLatLon)  Latitude: ' . $location[0][0]['lat'] . '</pre>';
            //echo '<pre> (getLatLon) Longitude: ' . $location[0][0]['lon'] . '</pre>';
            $latlon = array (
                'lat' => $location[0][0]['lat'],
                'lon' => $location[0][0]['lon']
            );
            //Debugger::dump($this->School->Location);
            //$this->School->Location->set('lat',$location[0][0]['lat']);
            //$this->set('lon',$location[0][0]['lon']);
            //$this->set('location',$location[0][0]);
            //$this->set('location',$location[0][0]);
        }
        return $latlon;
    }
    
    function view($id = null) {
        $this->School->id = $id;
        $this->getSchoolsNearby($id,5);
         
        if (!$this->School->exists()) {
            throw new NotFoundException(__('Invalid school'));
        }
        // get the school's coordinates
        $this->setLatLon( $id );
        $this->set('school', $this->School->read(null, $id));
        
    }
    
    function getZones() {
        // return a list of zones (which will be put into a drop-down menu
        // on the add/edit forms)
        $this->set('zones',$this->School->Zone->find('list'));
    }
    
    function getConnectivityTypes() {
        // identical to getZones
        $this->set('connectivitytypes',$this->School->ConnectivityType->find('list'));
    }
    
    function getInterventionTypes() {
        // identical to getZones
        $this->set('interventiontypes',$this->School->InterventionType->find('list'));
    }
    
    function getServiceProviders() {
        // identical to getZones
        $this->set('serviceproviders',$this->School->ServiceProvider->find('list'));
    }
    
    function getSiteStates() {
        // identical to getZones
        $this->set('sitestates',$this->School->SiteState->find('list'));
    }
    
    function getPowerTypes() {
        // identical to getZones
        $this->set('powertypes',$this->School->PowerType->find('list'));
    }
    
    function getRoadTypes() {
        // identical to getZones
        $this->set('roadtypes',$this->School->RoadType->find('list'));
    }
    
    function add() {
        // Note prior to adding the belongsTo relationship (school belongs to
        // region) I had this if in advance of actually calling the save method
        // -- this failed after I added belongsTo and I'm not sure why
        // commenting out for now
        // if ($this->request->is('school')) {
        $this->School->create();

        // get a list of regions, link and intervention types
        // the School may belong to
        // Catchments/Areas/Districts now handled by Ajax due to their new
        // relationships
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->getRoadTypes();
        
        /*
        // return all areas that match the default catchment
        $areas = $this->School->District->Area->find(
                        'list',
                        array(
                            'conditions' => array('Area.catchment_id' => 1)
                        )
                );
        // return all districts that match the default area
        $districts = $this->School->District->find(
                        'list',
                        array(
                            'conditions' => array('District.area_id' => 1)
                        )
                );
        */
        
        // get all Zones
        $zones = $this->School->Zone->find('list');
        
        $this->set(compact('zones'));
                
        // should I wrap all the following with?
        // if ($this->request->is('post')) {        

        if ( $this->request->data != null ) {
            $this->set('lat',$this->request->data['School']['lat']);
            $this->set('lon',$this->request->data['School']['lon']);
        }

        // store the currently logged in user as a reference for the created school
        // The user() function provided by the component returns any column from
        // the currently logged in user.  We used this method to add the data into
        // the request info that is saved.
        //$this->request->data['School']['user_id'] = $this->Auth->user('id');

        if ($this->School->save($this->request->data)) {
            // see comments in edit()
            $query =  "UPDATE schools SET location=";
            $query .= "GeomFromText('POINT(".$this->request->data['School']['lat'];
            $query .= " ".$this->request->data['School']['lon'].")') ";
            $query .= " WHERE id = " . $this->School->id;
            //print $query;
            $this->School->query($query);

            $this->Session->setFlash(__('The school has been saved'));
            $this->redirect(array('action' => 'index'));
        }
        // as above, before adding the belongsTo this caluse was in here, but this
        // no longer works -- this gets called on opening the add view
        // commenting out for now
        /*
        else {
            //$this->Session->setFlash(__('The school could not be saved. [Error 001]'));
        }
        */
    }
    
    function delete($id) {
        // this came from one of the search examples, not sure why it's here
        // if (!$this->request->is('post')) {
        //      throw new MethodNotAllowedException();
        //}
        $this->School->id = $id;
        if (!$this->School->exists()) {
            throw new NotFoundException(__('Invalid school'));
        }
        
        if ($this->School->delete()) {
            // now cleanup any files associated with this school
            $this->Upload->deleteAll('School', $id);
            $this->Session->setFlash(__('School deleted'));
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->setFlash(__('School was not deleted'));
            $this->redirect(array('action' => 'index'));
        }
    }

    function edit($id = null) {
        $this->School->id = $id;
        
        // get a list of regions, link and installation types
        // the School may belong to
        $this->getZones();
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->getRoadTypes();
        
        $this->setLatLon( $id );
        
        if (!$this->School->exists()) {
            throw new NotFoundException(__('Invalid school'));
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            //echo "<pre> New Lat:".print_r( $this->request )."</pre>";
            //echo '<pre>' . print_r($this->request->data) . '</pre>';
            //echo '<pre> New Lat: ' . $this->request->data['School']['lat'] . '</pre>';            
            //$loc = "GeomFromText('POINT(".$this->request->data['School']['lat'];
            //$loc .= " ".$this->request->data['School']['lon'].")') ";
            //$this->request->data['School']['location'] = $loc;
            ////Debugger::dump($this->School);
            
            if ($this->School->save($this->request->data)) {
                // now that the school data is saved, we have to actually do
                // an update on the same record to effectively re-save the same
                // lat/lon -- only now as MySQL spatial data types
                // see also add()
                $query =  "UPDATE schools SET location=";
                $query .= "GeomFromText('POINT(".$this->request->data['School']['lat'];
                $query .= " ".$this->request->data['School']['lon'].")') ";
                $query .= " WHERE id = " . $id;
                print $query;
                $this->School->query($query);
                
                // and save the lat/long back to the variables on School
                $this->set('lat', $this->request->data['School']['lat']);
                $this->set('lon', $this->request->data['School']['lon']);
            
                //$gLat = 42.450071;
                //$gLong = -76.487664;
                //$this->School->query("UPDATE schools SET location = GeomFromText('POINT({$gLat} {$gLong})')");
                $this->Session->setFlash(__('The school has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The school could not be saved. [Error 002]'));
            }
        } else {
            // show edit page
            $this->request->data = $this->School->read(null, $id);
        }
    }
    
    public function isAuthorized($user) {
            // everyone can see the list and view individual Schools
            if ($this->action === 'index' || $this->action === 'view' || $this->action === 'overview' || $this->action === 'about') {
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
//        $schools = $this->School->find('all', array( 
//            'conditions' => array( 
//                'School.school_name LIKE' => $this->params['url']['autoCompleteText'].'%' 
//            ), 
//            'fields' => array('school_name'), 
//            'limit' => 3, 
//            'recursive'=>-1, 
//        )); 
//        $schools = Set::Extract($schools,'{n}.School.school_name'); 
//        $this->set('schools', $schools); 
//        $this->layout = 'ajax';     
//    }

    
}

?>

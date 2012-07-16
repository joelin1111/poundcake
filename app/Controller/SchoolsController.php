<?php

// maybe we'll need this?
//App::uses('Sanitize','Utility');

class SchoolsController extends AppController
{
    // AjaxMultiUpload is used for the file upload plugin
    // GoogleMapV3 is for... duh
    var $helpers = array('AjaxMultiUpload.Upload','Html','Js','GoogleMapV3');
    
    // pagination of results ($paginate) is down in the index function

    // make Schools visible to the search plugin
    public $components = array('Search.Prg','AjaxMultiUpload.Upload');
    
    public $presetVars = array(
        // field names for the form itself , 'model' => 'School'
        array('field' => 'primary_school', 'type' => 'value'),
        //array('field' => 'district', 'type' => 'value'),
        array('field' => 'district', 'type' => 'lookup', 'formField' => 'district_input', 'modelField' => 'district', 'model' => 'School'),
    );
    
    public function beforeFilter() {
        $this->set('primary_school', $this->School->primary_school);
        $this->set('district', $this->School->district);    
        parent::beforeFilter();
    }
    
    public function find() {
        //Debugger::dump($this->School);
        $this->Prg->commonProcess();
        $this->set('schools', $this->paginate());
    }
    // end Search plugin
    
    function index($id = null) {
        // begin Search
        $this->Prg->commonProcess();
        
        $this->paginate = array(
            'School' => array(
                // limit is the number per page 
                'limit' => 10,
                'conditions' => $this->School->parseCriteria($this->passedArgs),
                'order' => array(
                    'School.primary_school' => 'asc'
                )
                )
        );
        
        if ( $id != null ) {
            // this gets executed when we've searched on a school
            // pagination unclear here:
            $this->set('school', $this->School->read(null, $id));
        } else {
            // this gets executed after add school, when there is no School passed in
            
            //$log = $this->School->getDataSource()->getLog(false, false);
            //debug($log);
            
            // with pagination:
            $data = $this->paginate('School');
            $this->set('schools', $data);
            // without pagination:
            //$allSchools = $this->School->find('all');
            //$this->set('schools', $allSchools);
            
        }
    }
    
    public function overview() {
        $schools = $this->School->find('all');
        for($i = 0; $i < sizeof($schools); ++$i) {
            // for each school, decode the lat/lon and save it back to the
            // array of schools
            //echo "<pre> School ID = ".$schools[$i]['School']['id']."</pre>";
            // we're actually overwriting the School's "location" field (which
            // comes back as a binary object) with the decoded lat/lon
            $schools[$i]['School']['location'] = $this->getLatLon( $schools[$i]['School']['id'] );
        }
        $this->set('schools', $schools);
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
    
    function getLatLon($id = null) {
        // this function is basically like setLatLong except that it returns the 
        // lat/lon as an array
        //echo '<pre> (getLatLon) ID: ' . $id . '</pre>';
        $latlon = null;
        if ($id <> null) {
            $query = 'SELECT X(location) AS lat, Y(location) AS lon FROM schools WHERE id = ' . $id;
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
        if (!$this->School->exists()) {
            throw new NotFoundException(__('Invalid school'));
        }
        // get the school's coordinates
        $this->setLatLon( $id );
        $this->set('school', $this->School->read(null, $id));
        
    }
    
    function getProvinces() {
        // return a list of regions (which will be put into a drop-down menu
        // on the add/edit forms)
        $provinces = $this->School->Province->find('list');
        // save the array back to the school object
        // have also seen this syntax, which I'm unsure about:
        // $this->School->set(compact('regions'));
        $this->set('provinces',$provinces);
    }
    
    function getConnectivityTypes() {
        // identical to getRegions
        $connectivitytypes = $this->School->ConnectivityType->find('list');
        $this->set('connectivitytypes',$connectivitytypes);
    }
    
    function getInterventionTypes() {
        // identical to getRegions
        $interventiontypes = $this->School->InterventionType->find('list');
        $this->set('interventiontypes',$interventiontypes);
    }
    
    function getServiceProviders() {
        // identical to getRegions
        $serviceproviders = $this->School->ServiceProvider->find('list');
        $this->set('serviceproviders',$serviceproviders);
    }
    
    function getSiteStates() {
        // identical to getRegions
        $sitestates = $this->School->SiteState->find('list');
        $this->set('sitestates',$sitestates);
    }
    
    function getPowerTypes() {
        // identical to getRegions
        $powertypes = $this->School->PowerType->find('list');
        $this->set('powertypes',$powertypes);
    }
    
    function add() {
        // get a list of regions, link and intervention types
        // the School may belong to
        $this->getProvinces();
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        
        // Note prior to adding the belongsTo relationship (school belongs to
        // region) I had this if in advance of actually calling the save method
        // -- this failed after I added belongsTo and I'm not sure why
        // commenting out for now
        // if ($this->request->is('school')) {
        $this->School->create();
        
        if ( $this->request->data != null ) {
            $this->set('lat',$this->request->data['School']['lat']);
            $this->set('lon',$this->request->data['School']['lon']);
        }
        //$this->getLatLon( );
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
            $this->Session->setFlash(__('School deleted'));
            $this->redirect(array('action' => 'index'));
        }
        else {
            $this->Session->setFlash(__('School was not deleted'));
            $this->redirect(array('action' => 'index'));
        }
    }

    function edit($id = null) {
        $this->School->id = $id;
        
        // get a list of regions, link and installation types
        // the School may belong to
        $this->getProvinces();
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->setLatLon( $id );
        
        if (!$this->School->exists()) {
            throw new NotFoundException(__('Invalid school'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            //echo "<pre> New Lat:".print_r( $this->request )."</pre>";
            //echo '<pre>' . print_r($this->request->data) . '</pre>';
            //echo '<pre> New Lat: ' . $this->request->data['School']['lat'] . '</pre>';            
            //Debugger::dump($this->School);
            if ($this->School->save($this->request->data)) {
                // now that the school data is saved, we have to actually do
                // an update on the same record to effectively re-save the same
                // lat/lon -- only now as MySQL spatial data types
                // see also add()
                $query =  "UPDATE schools SET location=";
                $query .= "GeomFromText('POINT(".$this->request->data['School']['lat'];
                $query .= " ".$this->request->data['School']['lon'].")') ";
                $query .= " WHERE id = " . $id;
                //print $query;
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
            $this->request->data = $this->School->read(null, $id);
        }
    }
}
?>

<?php
App::uses('AppController', 'Controller');
/**
 * Trcs Controller
 *
 * @property Trc $Trc
 */
class TrcsController extends AppController {

    var $helpers = array('AjaxMultiUpload.Upload','AltGoogleMapV3');
    
    public $components = array('AjaxMultiUpload.Upload'); //,'DebugKit.Toolbar'

    function index($id = null) {
        
        $conditions = "";
        $name_arg = "";
        
        if (isset($this->passedArgs['Trc.trc_name'])) {
            $name_arg = str_replace('*','%',$this->passedArgs['Trc.trc_name']);
        }
        
        // if neither argument was passed, default to a wildcard
        if ($name_arg == "") {
            $name_arg = '%';
        }
        
//        echo "School code arg: " . $school_code_arg;
//        echo "<BR>Site name arg: " . $school_name_arg;
//        echo "<BR>";
        
        //echo "School code 2:<pre>".$this->passedArgs['School.school_code']."</pre>";            
        $conditions = array(
            'AND' => array(
                'Trc.trc_name LIKE' => $name_arg
            )
        );
        // echo "Conditions: ".print_r($conditions);
        
        $this->paginate = array(
            'Trc' => array(
                // limit is the number per page 
                'limit' => 10,
                //'conditions' => $this->School->parseCriteria($this->passedArgs),
                'conditions' => $conditions,
                'order' => array(
                    'Trc.name' => 'asc'
                ),
            ));
        
        $this->Trc->recursive = 0;
        $this->set('trcs', $this->paginate());
            
    }

    public function view($id = null) {
        $this->Trc->id = $id;
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->getRoadTypes();

        if (!$this->Trc->exists()) {
                throw new NotFoundException(__('Invalid trc'));
        }
        
        // get the school's coordinates
        $this->setLatLon( $id );
        $this->set('trc', $this->Trc->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->Trc->create();
            if ($this->Trc->save($this->request->data)) {
                    $this->Session->setFlash(__('The trc has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The trc could not be saved. Please, try again.'));
            }
        }
    }
        
    public function edit($id = null) {
        $this->Trc->id = $id;
        $this->getConnectivityTypes();
        $this->getInterventionTypes();
        $this->getServiceProviders();
        $this->getSiteStates();
        $this->getPowerTypes();
        $this->getRoadTypes();

        $this->setLatLon( $id );

        //$this->getSchools();
        if (!$this->Trc->exists()) {
                throw new NotFoundException(__('Invalid trc'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->Trc->save($this->request->data)) {
                        $this->Session->setFlash(__('The trc has been saved'));
                        $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The trc could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->Trc->read(null, $id);

        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        $this->Trc->id = $id;
        if (!$this->Trc->exists()) {
                throw new NotFoundException(__('Invalid trc'));
        }
        if ($this->Trc->delete()) {
                $this->Session->setFlash(__('Trc deleted'));
                $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Trc was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
        
    public function isAuthorized($user) {
        // everyone can see the list and view individual TRCs
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
    
    function getConnectivityTypes() {
        // identical to getCatchments
        $this->set('connectivitytypes',$this->Trc->ConnectivityType->find('list'));
    }
    
    function getInterventionTypes() {
        // identical to getCatchments
        $this->set('interventiontypes',$this->Trc->InterventionType->find('list'));
    }
    
    function getServiceProviders() {
        // identical to getCatchments
        $this->set('serviceproviders',$this->Trc->ServiceProvider->find('list'));
    }
    
    function getSiteStates() {
        // identical to getCatchments
        $this->set('sitestates',$this->Trc->SiteState->find('list'));
    }
    
    function getPowerTypes() {
        // identical to getCatchments
        $this->set('powertypes',$this->Trc->PowerType->find('list'));
    }
    
    function getRoadTypes() {
        // identical to getCatchments
        $this->set('roadtypes',$this->Trc->RoadType->find('list'));
    }
    
    function setLatLon($id = null) {
        // see documentation under Schools
        if ($id <> null) {
            $query = 'SELECT X(location) AS lat, Y(location) AS lon FROM trcs WHERE id = ' . $id;
            $location = $this->Trc->query( $query );
            $this->set('lat', $location[0][0]['lat']);
            $this->set('lon', $location[0][0]['lon']);
        }
    }
    
    function getLatLon($id = null) {
        // see documentation under Schools
        $latlon = null;
        if ($id <> null) {
            $query = 'SELECT X(location) AS lat, Y(location) AS lon FROM trcs WHERE id = ' . $id;
            $location = $this->Trc->query( $query );
            $latlon = array (
                'lat' => $location[0][0]['lat'],
                'lon' => $location[0][0]['lon']
            );
        }
        return $latlon;
    }
}

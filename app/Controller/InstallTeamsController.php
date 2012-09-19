<?php
App::uses('AppController', 'Controller');

class InstallTeamsController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'InstallTeam.name' => 'asc'
        )
    );
    
    public function index() {
        $this->InstallTeam->recursive = 0;
        $this->set('installteams', $this->paginate());
    }

    public function view($id = null) {
        $this->InstallTeam->id = $id;
        if (!$this->InstallTeam->exists()) {
            throw new NotFoundException(__('Invalid install team'));
        }
        $this->set('installteam', $this->InstallTeam->read(null, $id));
    }

    /*
    function getRadioTypes() {
        $this->set('install teamtypes',$this->InstallTeam->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    function getAntennaTypes() {
        $this->set('antennatypes',$this->InstallTeam->AntennaType->find('list',
            array(
                'order' => array(
                    'AntennaType.name ASC'
            )))
        );
    }
    */
    public function add() {
//        $this->getSites();
//        $this->getRadioTypes();
//        $this->getAntennaTypes();
        
        if ($this->request->is('post')) {
            $this->InstallTeam->create();
            if ($this->InstallTeam->save($this->request->data)) {
                $this->Session->setFlash(__('The install team has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The install team could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->InstallTeam->id = $id;
//        $this->getSites();
//        $this->getRadioTypes();
//        $this->getAntennaTypes();
        
        if (!$this->InstallTeam->exists()) {
            throw new NotFoundException(__('Invalid install team'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->InstallTeam->save($this->request->data)) {
                    $this->Session->setFlash(__('The install team has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The install team could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->InstallTeam->read(null, $id);
        }
    }
    
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->InstallTeam->id = $id;
        if (!$this->InstallTeam->exists()) {
            throw new NotFoundException(__('Invalid install team'));
        }
        if ($this->InstallTeam->delete()) {
            $this->Session->setFlash(__('Radio deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Radio was not deleted'));
        $this->redirect(array('action' => 'index'));
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

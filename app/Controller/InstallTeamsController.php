<?php
App::uses('AppController', 'Controller');

class BuildItemsController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'BuildItem.name' => 'asc'
        )
    );
    
    public function index() {
        $this->BuildItem->recursive = 0;
        $this->set('builditems', $this->paginate());
    }

    public function view($id = null) {
        $this->BuildItem->id = $id;
        if (!$this->BuildItem->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        $this->set('builditem', $this->BuildItem->read(null, $id));
    }

    // return all the sites to allow the radio to be assigned to
    function getSites() {
        $this->set('sites',$this->BuildItem->Site->find('list',
            array(
                'order' => array(
                    'Site.site_code',
                    'Site.site_name ASC'
            )))
        );
    }
    /*
    function getRadioTypes() {
        $this->set('radiotypes',$this->BuildItem->RadioType->find('list',
            array(
                'order' => array(
                    'RadioType.name ASC'
            )))
        );
    }
    
    function getAntennaTypes() {
        $this->set('antennatypes',$this->BuildItem->AntennaType->find('list',
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
            $this->BuildItem->create();
            if ($this->BuildItem->save($this->request->data)) {
                $this->Session->setFlash(__('The radio has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The radio could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->BuildItem->id = $id;
//        $this->getSites();
//        $this->getRadioTypes();
//        $this->getAntennaTypes();
        
        if (!$this->BuildItem->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->BuildItem->save($this->request->data)) {
                    $this->Session->setFlash(__('The radio has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The radio could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->BuildItem->read(null, $id);
        }
    }
    
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->BuildItem->id = $id;
        if (!$this->BuildItem->exists()) {
            throw new NotFoundException(__('Invalid radio'));
        }
        if ($this->BuildItem->delete()) {
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

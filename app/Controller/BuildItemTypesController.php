<?php
App::uses('AppController', 'Controller');

class BuildItemTypesController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'BuildItemType.name' => 'asc'
        )
    );
    
    public function index() {
        $this->BuildItemType->recursive = 0;
        $this->set('builditemtypes', $this->paginate());
    }

    public function view($id = null) {
        $this->BuildItemType->id = $id;
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException(__('Invalid build item'));
        }
        $this->set('builditemtypes', $this->BuildItemType->read(null, $id));
    }

    // return all the sites to allow the build item to be assigned to
    function getSites() {
        $this->set('sites',$this->BuildItemType->Site->find('list',
            array(
                'order' => array(
                    'Site.site_code',
                    'Site.site_name ASC'
            )))
        );
    }
    
    public function add() {
        
        if ($this->request->is('post')) {
            $this->BuildItemType->create();
            if ($this->BuildItemType->save($this->request->data)) {
                $this->Session->setFlash(__('The build item has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The build item could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->BuildItemType->id = $id;
        
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException(__('Invalid build item'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->BuildItemType->save($this->request->data)) {
                    $this->Session->setFlash(__('The build item has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The build item could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->BuildItemType->read(null, $id);
        }
    }
    
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->BuildItemType->id = $id;
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException(__('Invalid build item'));
        }
        if ($this->BuildItemType->delete()) {
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

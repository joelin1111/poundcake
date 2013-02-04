<?php
/**
 * Controller for build item types.
 *
 * This is a very basic controller to add/view/update/delete build item types.
 * 
 * These tasks would typically be performed by a user with administrative level
 * permissions within Poundcake.
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
 * @since         BuildItemTypesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class BuildItemTypesController extends AppController {

    /*
     * Custom pagination, sort order on index listing
     */
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'BuildItemType.name' => 'asc'
        )
    );
    
    
    /*
     * Main listing for all BuildItemTypes
     */
    public function index() {
        $this->BuildItemType->recursive = 0;
        $this->set('builditemtypes', $this->paginate());
    }

    /*
     * View an existing BuildItemType
     */
    public function view($id = null) {
        $this->BuildItemType->id = $id;
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException('Invalid build item');
        }
        $this->set('builditemtypes', $this->BuildItemType->read(null, $id));
    }

    /*
     * Save an array of  all the sites to allow the build item to be assigned to
     */
    function getSites() {
        $this->set('sites',$this->BuildItemType->Site->find('list',
            array(
                'order' => array(
                    'Site.code',
                    'Site.name ASC'
            )))
        );
    }
    
    /*
     * Add a new BuildItemType
     */
    public function add() {
        if ($this->request->is('post')) {
            $this->BuildItemType->create();
            if ($this->BuildItemType->save($this->request->data)) {
                $this->Session->setFlash('The build item has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The build item could not be saved. Please, try again.');
            }
        }
    }

    /*
     * Edit an existing BuildItemType
     */
    public function edit($id = null) {
        $this->BuildItemType->id = $id;
        
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException('Invalid build item');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->BuildItemType->save($this->request->data)) {
                    $this->Session->setFlash('The build item has been saved.');
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash('Error!  The build item could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->BuildItemType->read(null, $id);
        }
    }
    
    /*
     * Delete an existing BuildItemType
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->BuildItemType->id = $id;
        if (!$this->BuildItemType->exists()) {
            throw new NotFoundException('Invalid build item');
        }
        if ($this->BuildItemType->delete()) {
            $this->Session->setFlash('Build item deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Build item was not deleted.');
        $this->redirect(array('action' => 'index'));
    }

    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
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

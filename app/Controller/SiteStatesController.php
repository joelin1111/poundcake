<?php
/**
 * Controller for antenna types.
 *
 * This is a very basic controller to add/view/update/delete antenna types.
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
 * @since         SiteStatesController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class SiteStatesController extends AppController {

    /*
     * Main listing for all SiteStates
     */
    public function index() {
        $this->SiteState->recursive = 0;
        $this->set('siteStates', $this->paginate());
    }

    
    public function view($id = null) {
        $this->SiteState->id = $id;
        if (!$this->SiteState->exists()) {
                throw new NotFoundException('Invalid site state');
        }
        $this->set('siteState', $this->SiteState->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->SiteState->create();
            //echo "<pre>";
            //print_r($this->request->data['SiteState']);
            //echo "</pre>";
            
            // http://cakebaker.42dh.com/2006/04/15/file-upload-with-cakephp/
            if (is_uploaded_file($this->request->data['SiteState']['File']['tmp_name'])) {
                    $fileData = fread(fopen($this->request->data['SiteState']['File']['tmp_name'], "r"), $this->request->data['SiteState']['File']['size']);

                    $this->request->data['SiteState']['img_name'] = $this->request->data['SiteState']['File']['name'];
                    $this->request->data['SiteState']['img_type'] = $this->request->data['SiteState']['File']['type'];
                    $this->request->data['SiteState']['img_size'] = $this->request->data['SiteState']['File']['size'];
                    $this->request->data['SiteState']['img_data'] = $fileData;
                
                //echo "img_name " . $this->request->data['SiteState']['img_name'] . "<BR>";
                //echo "img_type " . $this->request->data['SiteState']['img_type'] . "<BR>";
                //echo "img_size " . $this->request->data['SiteState']['img_size'] . "<BR>";
                //echo "img_data " . $this->request->data['SiteState']['img_data'];
                }        
            if ($this->SiteState->save($this->request->data)) {
                $this->Session->setFlash('The site state has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The site state could not be saved. Please, try again.');
            }
        }
    }

    public function edit($id = null) {
        $this->SiteState->id = $id;
        if (!$this->SiteState->exists()) {
            throw new NotFoundException('Invalid site state');
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if (is_uploaded_file($this->request->data['SiteState']['File']['tmp_name'])) {
                    $fileData = fread(fopen($this->request->data['SiteState']['File']['tmp_name'], "r"), $this->request->data['SiteState']['File']['size']);

                    $this->request->data['SiteState']['img_name'] = $this->request->data['SiteState']['File']['name'];
                    $this->request->data['SiteState']['img_type'] = $this->request->data['SiteState']['File']['type'];
                    $this->request->data['SiteState']['img_size'] = $this->request->data['SiteState']['File']['size'];
                    $this->request->data['SiteState']['img_data'] = $fileData;
            }
            if ($this->SiteState->save($this->request->data)) {
                $this->Session->setFlash('The site state has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The site state could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->SiteState->read(null, $id);
        }
    }


    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->SiteState->id = $id;
        if (!$this->SiteState->exists()) {
            throw new NotFoundException('Invalid site state');
        }
        if ($this->SiteState->delete()) {
            $this->Session->setFlash('Site state deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  Site state was not deleted.');
        $this->redirect(array('action' => 'index'));
    }
    
    /* used for downloading files
    function download($id) {
        Configure::write('debug', 0);
        $file = $this->MyFile->findById($id);

        header('Content-type: ' . $file['MyFile']['type']);
        header('Content-length: ' . $file['MyFile']['size']); // some people reported problems with this line (see the comments), commenting out this line helped in those cases
        header('Content-Disposition: attachment; filename="'.$file['MyFile']['name'].'"');
        echo $file['MyFile']['data'];

        exit();
    }
    */
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

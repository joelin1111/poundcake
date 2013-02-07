<?php
/**
 * Controller for notifications.
 *
 * This is a ultra basic controller to edit system notifications, which appear
 * in the header to give users a heads up to downtimes, etc.  Available to
 * an administrator only and with one function -- edit.
 *
 * Developed against CakePHP 2.2.5 and PHP 5.4.4.
 *
 * Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Controller
 * @since         NotificationsController was introduced in Poundcake v2.5.2
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class NotificationsController extends AppController {

    /*
     * Edit the notification -- there should only be one!
     */
    public function edit($id = 1) { // hard coded to 1
        $this->Notification->id = $id;
        
        if (!$this->Notification->exists()) {
            debug("2");
            throw new NotFoundException('Invalid notification');
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->Notification->save($this->request->data)) {
                    $this->Session->setFlash('The notification has been saved.');
                    $this->redirect(array('controller' => 'admin', 'action' => 'setup'));
            } else {
                    $this->Session->setFlash('Error!  The notification could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->Notification->read(null, $id);
        }
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

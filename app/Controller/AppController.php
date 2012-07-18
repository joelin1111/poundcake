<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package       app.Controller
 * @link http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {

    // used for the login/ACL
    public $components = array(
        'Session',
        'Auth' => array(
            'loginRedirect' => array('controller' => 'schools', 'action' => 'overview'),
            'logoutRedirect' => array('controller' => 'schools', 'action' => 'overviewalt'),
            'authorize' => array('Controller')
        )
    );

    // used for the login/ACL
    public function beforeFilter() {
        // tell the AuthComponent to not require a login for all index and
        // view actions, in every controller. We want our visitors to be able to
        // read and list the entries without registering in the site.
        $this->Auth->allow('index', 'view', 'overview','overviewalt');
        
        // allows access to nothing if not logged in by forcing them to the login
        // page as served by the User controller
        //$this->Auth->allow('login');
    }
    
    // we could prevent some staff to edit or delete others' schools
    // basic rules for our app are that admin users can access every url, while
    // normal users (the author role) can only access the permitted actions.
    public function isAuthorized($user) {
        // Admin can access every action
        if (isset($user['role']) && $user['role'] === 'admin') {
            return true;
        }

        // Default deny
        return false;
    }
}
?>
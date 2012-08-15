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

    //public $helpers = array('Js' => array('Jquery'));
    //public $helpers = array('Js');
    
    // default pagination
    public $paginate = array(
        'limit' => 20
    );
    
    // used for the login/ACL
    public $components = array(
        'Session',
        //'DebugKit.Toolbar',
        'Auth' => array(
            //'loginRedirect' => array('controller' => 'schools', 'action' => 'overview'),\
            // if the user is not logged in, 
            // if the logged in user accesses a page they are not supposed to (by 
            // typing in the URL manually), send them here
            'loginRedirect' => array('controller' => 'schools', 'action' => 'about'),
            'logoutRedirect' => array('controller' => 'users', 'action' => 'login'),
            //'logoutRedirect' => array('controller' => 'pages', 'action' => 'display', ''),
            'authorize' => array('Controller')
        )
    );

    // used for the login/ACL
    public function beforeFilter() {
        //// tell the AuthComponent to not require a login for all index and
        // view actions, in every controller. We want our visitors to be able to
        // read and list the entries without registering in the site.
        //$this->Auth->allow('index', 'view', 'overview','overviewalt');
        // $this->Auth->allow();
        
        // allows access to nothing if not logged in
        // by only allowing them access to the logout page
        $this->Auth->allow('logout');
    }
    
    // we could prevent some staff to edit or delete others' schools
    // basic rules for our app are that admin users can access every url, while
    // normal users (the author role) can only access the permitted actions.
    public function isAuthorized($user) {
        // Admin can access every action
        if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'admin') {
            return true;
        }

        // Default deny
        return false;
    }
    
    function beforeRender() {
        // In the views $user['User']['username'] would display the logged in users username
        $this->set('user', $this->Auth->user());
    }
    
    function search() {
        // the page we will redirect to at the end
        $url['action'] = 'index';

        // build a URL will all the search elements in it
        // the resulting URL will be 
        // example.com/cake/posts/index/Search.keywords:mykeyword/Search.tag_id:3
        foreach ($this->data as $k=>$v){ 
                foreach ($v as $kk=>$vv){
                        //echo "<BR>VV is".print_r($vv);
                        // remove forward slashes -- school codes can have them!
                        $vv = str_replace('/','*',$vv);
                        $url[$k.'.'.$kk]=$vv; 
                } 
        }
        // redirect the user to the url
        $this->redirect($url, null, true);
    }
}
?>
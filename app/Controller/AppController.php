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

class AppController extends Controller {
    
    // default pagination
    public $paginate = array(
        'limit' => 20 // may be overridden in other controllers!
    );
    
    
    // used for the login/ACL
    public $components = array(
        'Session',
        'Auth' => array(
            //'loginRedirect' => array('controller' => 'schools', 'action' => 'overview'),\
            // if the user is not logged in, 
            // if the logged in user accesses a page they are not supposed to (by 
            // typing in the URL manually), send them here
            'loginRedirect' => array('controller' => 'sites', 'action' => 'overview'),
            'logoutRedirect' => array('controller' => 'users', 'action' => 'login'),
            'authorize' => array('Controller')
        ),
        'RequestHandler'
    );

    // return all the organizations the user may be assigned to
    public function getOrganizationsForCurrentProject($obj) {
        // $this->set('organizations',$this->Contact->Organization->find('list'));
        // the above does not give us what we want -- it gives us a list of all
        // organiations (for use in the select on the Contact add/edit pages)
        // However, we only want to show orgs for the currently selected project
        // e.g. contact <-> organization <-> organizations_projects <-> project
        // I could not sort out how to do this with a Cake join (see below)
        // so I'm doing it manually by running my own SQL and creating the array manually

        // NOTE: this is basically 
//        begin does not work:
//        $orgs = $this->Contact->Organization->find('list');
//        echo '<pre>';
//        echo "For Project ID: ".$this->Session->read('project_id');
//        echo "<br>";
//        print_r($orgs);
//        
//        foreach ($orgs as $key => $value) {
//            $this->loadModel('Organization', $key);
//            $org = $this->Organization->read(null, $key);
//            echo ">";
//            print_r($org);
//        }
//        echo '</pre>';
//        echo "------------";
        
//        $this->Contact->Organization->bindModel(array('hasOne' => array('OrganizationsProjects')));
//        $organizations = $this->Contact->Organization->find('all',array(
//            'fields' => array('DISTINCT Organization.name'),
//            //'fields' => array('Organization.id', 'Organization.name'),
//            'conditions'=> array(
//                    //'Contact.organization_id = OrganizationsProject.organization_id',
//                    'OrganizationsProject.project_id' => $this->Session->read('project_id'),
//                    //'OrganizationsProject.organization_id' => 14
//                ),
//            'recursive' => 0,
//            'joins' => array( 
//                array('table' => 'organizations_projects', 
//                'alias' => 'OrganizationsProject', 
//                'type' => 'INNER',  
//                'conditions'=> array(
//                    //'Contact.organization_id = OrganizationsProject.organization_id',
//                    'OrganizationsProject.project_id' => $this->Session->read('project_id'),
//                    //'OrganizationsProject.organization_id' => 14
//                )
//        ))));
//        end does not work:
        
        $sql = "select distinct organization_id, name from organizations_projects, organizations where project_id=".$this->Session->read('project_id');
        $sql .= " and organizations.id=organizations_projects.organization_id";
        $results = $this->$obj->query($sql);        
        $organizations = array();
        foreach ($results as $key => $value) {
            $organizations[$value['organizations_projects']['organization_id']] = $value['organizations']['name'];
        }
        $this->set(compact('organizations'));
    }
    
    // used for the login/ACL
    public function beforeFilter() {
        // tell the AuthComponent to not require a login for all index and
        // view actions, in every controller. We want our visitors to be able to
        // read and list the entries without registering in the site.
        //$this->Auth->allow('index', 'view', 'overview','overviewalt');
        // $this->Auth->allow();
        
        // allows access to nothing if not logged in
        // by only allowing them access to the logout page
        $this->Auth->allow('logout');
        
        // this is from:  http://stackoverflow.com/questions/7968312/cakephp-mobile-layout-home-redirect-requesthandler-ismobile
        // see also afterFilter
//        if ($this->RequestHandler->isMobile()) {
//            $this->is_mobile = true;
//            $this->set('is_mobile', true );
//            $this->autoRender = false;
//        }
    }
    
    /*
    function afterFilter() {
        // see note above RE: mobile support
        //if (isset($this->is_mobile) && $this->is_mobile) {
            //Configure::read('VIEWS');
            //Configure::read('LAYOUTS');    
        if (isset($this->is_mobile) && $this->is_mobile) {
            $view_file = file_exists( VIEWS . $this->name . DS . 'mobile/' . $this->action . '.ctp' );
            $layout_file = file_exists( LAYOUTS . 'mobile/' . $this->layout . '.ctp' );
            $this->render($this->action, ($layout_file?'mobile/':'').$this->layout, ($view_file?'mobile/':'').$this->action);
        }
    }
    */
    
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
        $banner = $this->Session->read('banner');
        $version = $this->Session->read('version');
        if ( !isset($banner) || !isset($version) ) {
            //echo "setting version";
            // I just need an object on which I can call query, ChangeLog seems OK?
            // maybe this doesn't need to be done here
            $query = "select message from notifications";
            $this->loadModel('ChangeLog');
            $result = $this->ChangeLog->query($query);
            if (count($result) > 0 )
                $this->Session->write('banner',$result[0]['notifications']['message']);

            $query = "select max(version) as version from change_logs";
            $result = $this->ChangeLog->query($query);
            $this->Session->write('version',$result[0][0]['version']);
        }
        //echo "Banner is $banner";
        //echo "Version is $version";
    }
    
    function search() {
        // the page we will redirect to at the end
        $url['action'] = 'index';

        // build a URL will all the search elements in it
        // the resulting URL will be 
        // example.com/cake/posts/index/Search.keywords:mykeyword/Search.tag_id:3
        foreach ($this->data as $k=>$v) {
            //print_r($v);
            foreach ($v as $kk=>$vv){
                //echo "<BR>VV is".print_r($vv);
                // remove forward slashes -- site codes may have them!
                $vv = str_replace('/','*',$vv);
                $url[$k.'.'.$kk]=$vv; 
            } 
        }
        // redirect the user to the url
        $this->redirect($url, null, true);
    }
    
      // this would check for uniqueness among fields in the same instance
//    function checkUnique($data, $fields) {
//        if (!is_array($fields)) {
//                $fields = array($fields);
//            }
//            foreach($fields as $key) {
//                $tmp[$key] = $this->data[$this->name][$key];
//            }
//        if (isset($this->data[$this->name][$this->primaryKey]) && $this->data[$this->name][$this->primaryKey] > 0) {
//                $tmp[$this->primaryKey." !="] = $this->data[$this->name][$this->primaryKey];
//            }
//        //return false;
//        return $this->isUnique($tmp, false); 
//    }
    
    // plural
    public function getAllIPAddresses($name) {
        return ClassRegistry::init('IPAddress')->getAllIPAddresses($name);
    }
    
    // singular
    public function getIPAddress($name) {
        return ClassRegistry::init('IPAddress')->getIPAddress($name);
    }
    
    public function getGatewayAddress($name) {
        return ClassRegistry::init('IPAddress')->getGatewayAddress($name);
    }
}
?>
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
    
    /*
    // default pagination
    public $paginate = array(
        'limit' => 20 // may be overridden in other controllers!
    );
    */
    
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

    /*
     * Helpers we use:
     * - MyHTML makes de-links hyperlinks for view-only users
     */
    var $helpers = array(
        'MyHTML'
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
    
    function getAllSitesForProject() {
        // set sites to the list of sites the currently selected/active project
        // also returns the ID for the first site in that list
        $conditions = array (
            'conditions' => array('Site.project_id' => $this->Session->read('project_id'))
            );
        $this->loadModel('Site');
        // list or findByProjectId?  Hmm...
        //$this->set('sites', $this->Site->find('list', $conditions));
        $sites = $this->Site->find('list', $conditions);
        $this->set( 'sites', $sites );
        return key($sites); // return the ID of the first site        
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
     * Sets two variables (snmp_override, snmp_community) to true/false if
     * the NetworkRadios/NetworkRouters/NetworkSwitch has custom SNMP
     * values defined.
     */
    protected function checkSnmp() {
        $model = $this->modelClass;
        // this is used by each of NetworkRadios/NetworkRouters/NetworkSwitches
        $snmp_override = false;
        $snmp_community = false;
        if ( $this->$model->field('snmp_override') > 0 ) {
            $snmp_override = true;
            // if they are not a view-only user then they can see the community
            // string
            if ( !$this->isViewOnly() ) {
                $snmp_community = true;
            }
        }
        $this->set('snmp_override',$snmp_override);
        $this->set('snmp_community',$snmp_community);
    }
    
    /*
     * Check the ACL to see if this user can perform actions on the view within
     * the controller
     */
    public function isViewOnly( ) {
        $this->loadModel('User');
        $uid = CakeSession::read("Auth.User.id");
        $this->User->read(null,$uid);
        $ret = false;
        if ( $this->User->data['Role']['rolealias'] === 'view' )
            $ret = true;
        return $ret;
    }
    /*
     * Check the ACL to see if this user can perform actions on the view within
     * the controller
     */
    public function isAuthorized( $user ) {
        // there are 3 role alias' in the system:  admin, edit, view
        // users with the rolealias of admin can access every page
        // some controllers override this to allow the rolealias' of
        // edit or view to access the page    
        if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'admin') {
            return true;
        }

        // default deny
        return false;
    }
    
    /*
     * Standard callback function before a view is rendered
     * Used to grab any system messages an admin may have set, and get the 
     * release number
     */
    function beforeRender() {
        // in the views $user['User']['username'] would display the logged in
        // user's username
        $this->set('user', $this->Auth->user());
        
        $banner = $this->Session->read('banner'); // system messages
        $version = $this->Session->read('version'); // current version number
        if ( !isset($banner) || !isset($version) ) {
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
    }
    
    /*
     * Make strings filename safe
     */
//    function sanitizeName( $string ) {
//        return preg_replace(array('/\s/', '/\.[\.]+/', '/[^\w_\.\-]/'), array('_', '.', ''), $string);
//    }
    
    
    function search() {
        // the page we will redirect to at the end
        $url['action'] = 'index';

        // build a URL will all the search elements in it
        // the resulting URL will be 
        // example.com/cake/posts/index/Search.keywords:mykeyword/Search.tag_id:3
        foreach ($this->data as $k=>$v) {
            //print_r($v);
            foreach ($v as $kk=>$vv){
                //echo "<BR>VV is".$vv."<br>";
                $vv .= '*';
                // remove forward slashes -- site codes may have them!
                $vv = str_replace('/','*',$vv);
                //$vv .= '%';
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
    
    /*
     * Return IP addresses (note: plural) for a given item name, used for the
     * HRBN addrpool integration.
     * 
     * @see MySQL stored procedures.
     */
    public function getAllIPAddresses($name) {
        return ClassRegistry::init('IPAddress')->getAllIPAddresses($name);
    }
    
    /*
     * Return IP addresses (note: singular) for a given item name, used for the
     * HRBN addrpool integration.
     * 
     * @see MySQL stored procedures.
     */
    public function getIPAddress($name) {
        return ClassRegistry::init('IPAddress')->getIPAddress($name);
    }
    
    /*
     * Return gateway addresses for a given item name, used for the
     * HRBN addrpool integration.
     * 
     * @see MySQL stored procedures.
     */
    public function getGatewayAddress($name) {
        return ClassRegistry::init('IPAddress')->getGatewayAddress($name);
    }
    
    /**
     * Prettifies an XML string into a human-readable and indented work of art 
     * 
     * @param string $xml The XML as a string 
     * @param boolean $html_output True if the output should be escaped (for use in HTML) 
     */
    
    // see: http://gdatatips.blogspot.com/2008/11/xml-php-pretty-printer.html
    public function xmlpp($xml, $html_output=false) {  
        $xml_obj = new SimpleXMLElement($xml);  
        $level = 4;  
        $indent = 0; // current indentation level  
        $pretty = array();  

        // get an array containing each XML element  
        $xml = explode("\n", preg_replace('/>\s*</', ">\n<", $xml_obj->asXML()));  

        // shift off opening XML tag if present  
        if (count($xml) && preg_match('/^<\?\s*xml/', $xml[0])) {  
          $pretty[] = array_shift($xml);  
        }  

        foreach ($xml as $el) {  
          if (preg_match('/^<([\w])+[^>\/]*>$/U', $el)) {  
              // opening tag, increase indent  
              $pretty[] = str_repeat(' ', $indent) . $el;  
              $indent += $level;  
          } else {  
            if (preg_match('/^<\/.+>$/', $el)) {              
              $indent -= $level;  // closing tag, decrease indent  
            }  
            if ($indent < 0) {  
              $indent += $level;  
            }  
            $pretty[] = str_repeat(' ', $indent) . $el;  
          }  
        }     
        $xml = implode("\n", $pretty);     
        return ($html_output) ? htmlentities($xml) : $xml;  
    }
}
?>
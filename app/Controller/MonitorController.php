<?php
/**
 * Controller for network monitoring tasks.
 *
 * This is a very basic controller with no model.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
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
 * @since         InstallTeamsController was added in Poundcake v2.2.5
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');
//App::uses('AppController', 'Controller', 'HttpSocket', 'Network/Http');

class MonitorController extends AppController {
    
    /*
     * This contoller has no unerlying model
     */
    var $uses = null;
    
    /*
     * Main listing for all objects
     */
    public function index() {
        //$this->InstallTeam->recursive = 0;
        //$this->set('installteams', $this->paginate());

        App::uses('HttpSocket', 'Network/Http');
        $HttpSocket = new HttpSocket();
        // string query
        //$results = $HttpSocket->get('http://www.google.com/search', 'q=cakephp');
        //$results = $HttpSocket->get('https://statler.inveneo.org/opennms/rest/');
        $request_statler = array(
            'method' => 'GET',
            'uri' => array (
                'scheme' => 'https',
                'host' => 'statler.inveneo.org',
                'port' => 443,
                'user' => 'admin',
                'pass' => 'W1f1Rulez',
                // 'path' => '/opennms/rest/nodes/19/ipinterfaces',
                'path' => '/opennms/rest/nodes',
                'query' => null,
                'fragment' => null
            ),
//            'auth' => array (
//                'method' => 'Basic',
//                'user' => 'admin',
//                'pass' => 'W1f1Rulez'
//            ),
            'version' => '1.1',
            'body' => '',
            'line' => null,
            'header' => array (
                'Connection' => 'close',
                'User-Agent' => 'CakePHP/Poundcake'
            ),
            'raw' => null,
            'cookies' => array()
        );
        
        $request_haiti = array(
            'method' => 'GET',
            'uri' => array (
                'scheme' => 'http',
                'host' => '10.0.2.10',
                'port' => 8980,
                'user' => 'admin',
                'pass' => 'Links4@yti',
                // 'path' => '/opennms/rest/nodes/19/ipinterfaces',
                'path' => '/opennms/rest/nodes/',
                'query' => null,
                'fragment' => null
            ),
//            'auth' => array (
//                'method' => 'Basic',
//                'user' => 'admin',
//                'pass' => 'Links4\@yti'
//            ),
            'version' => '1.1',
            'body' => '',
            'line' => null,
            'header' => array (
                'Connection' => 'close',
                'User-Agent' => 'CakePHP/Poundcake'
            ),
            'raw' => null,
            'cookies' => array()
        );
        
        $results = $HttpSocket->request( $request_haiti );
        
        
        // array query
        //$results = $HttpSocket->get('http://www.google.com/search', array('q' => 'cakephp'));
        //debug( $results->body );
        //echo '<pre>' . $this->xmlpp($results->body, true) . '</pre>';
        // 
        //debug($HttpSocket->response);
        
        //$this->traverseNodes( $results->body );
        
        $finder = new XmlFinder( $results->body );
        $id = $finder->findNodeBySysName( 'BAYCT' );
        echo "ID of BAYCT is $id";
        echo '<pre>' . $this->xmlpp($results->body, true) . '</pre>';
    }
}

class XmlFinder
{
    // See:  http://stackoverflow.com/questions/2380755/php-simplexml-recursive-function-to-list-children-and-attibutes
    // Also:  http://www.tuxradar.com/practicalphp/12/3/3
    // http://php.net/manual/en/simplexmlelement.xpath.php
    
    protected $xml;
    
    public function __construct( $xml ) {
        $this->xml = new SimpleXMLElement( $xml );
    }
    
    public function findNodeBySysName( $name ) {
        //debug( $this->xml );
        $attr = false;
        //$el = $this->xml->xpath("//process[@id='$id']");
        //$el = $this->xml->xpath("/nodes/node[@sysName='$name']");
        //$el = $this->xml->xpath("/nodes/node/assetRecord");
        
        $el = $this->xml->xpath("/nodes/node");
        foreach( $el as $e ) {
            if ( $name = $e->sysName ) {
                debug( $e );
            }            
        }
    }
}
?>

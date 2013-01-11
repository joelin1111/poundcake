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
    
    private function getOpenNMSReSTConnection( $url ) {
        $request = null;
        if ( $url != null ) {
            $request =
                array(
                'method' => 'GET',
                'uri' => array (
                    'scheme' => 'https',
                    'host' => 'statler.inveneo.org',
                    'port' => 443,
                    'user' => 'admin',
                    'pass' => 'W1f1Rulez',
                    // 'path' => '/opennms/rest/nodes/19/ipinterfaces',
                    'path' => $url,
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
                    'User-Agent' => 'CakePHP/Poundcake',
                    'Content-type' => 'xml'
                ),
                'raw' => null,
                'cookies' => array()
            );
        }
        return $request;
    }
    
    /*
     * Main listing for all objects
     */
    public function index() {
        App::uses('HttpSocket', 'Network/Http');
        $HttpSocket = new HttpSocket();
        // string query
        //$results = $HttpSocket->get('http://www.google.com/search', 'q=cakephp');
        //$results = $HttpSocket->get('https://statler.inveneo.org/opennms/rest/');
        
        // get all the nodes in the system
        $results = $HttpSocket->request( $this->getOpenNMSReSTConnection( '/opennms/rest/nodes?limit=0' ) );
        $xmlIterator = new SimpleXMLIterator( $results->body );
        
        // these are all the nodes we're looking for -- normally this
        // would be a find all sites by project ID
        $nodes = array (
            'Access Haiti',
            'Archive Fiber IP',
            'Dadaab CollabNet Edge Cisco',
            'Digicel tower HDN296',
            'Haiti Edge Router',
            'InternetNow Gulu Supercenter',
            'Inveneo R4 at Ecole St Claire',
            'Inveneo Web Server',
            'Kisumu District Headquarters',
            'MonkeyBrains.net IP',
            'Multilink',
            'Nanobridge at Ecole St Claire',
            'Orange DDB tower',
            'Orange Nyambene tower',
            'Orange Talek Market tower (NanoBridge)',
            'Orange Tombe tower',
            'Test Node (Waldorf)',
            'Ubiquiti RocketM5 on tower HDC202',
            'Voila',
            'Warfield Fiber IP',
            'haiti-freeside.inveneo.org',
            'monitor.inveneo.org',
            'orange-monitor.inveneo.net'
        );
        
        // empty array to hold our results
        $nodes_ids = array();
        
        /*
         * Get the IDs for all the nodes we're interested in by searching for them
         * in the $nodes array, if found then grab the OpenNMS node ID 
         * 
         * Resulting array:
         * 
            (int) 0 => array(
                    'node' => 'Archive Fiber IP',
                    'id' => '8'
            )
        */
        $n = 0;
        for( $xmlIterator->rewind(); $xmlIterator->valid(); $xmlIterator->next() ) {
            if( $xmlIterator->hasChildren() ) {
//                var_dump($xmlIterator->current());                
//                $attrs = $xmlIterator->current()->attributes();
//                debug( $attrs );
                $node_label = $xmlIterator->current()->attributes()->label;
                $node_id = $xmlIterator->current()->attributes()->id;                
                //echo $node_label.'<br>';                
                $loc = array_search($node_label, $nodes);
                if ( $loc > 0 ) {
//                    echo "Loc is $loc<br>";
//                    echo $n;
//                    debug( $xmlIterator->current()->attributes() );
//                    echo '<br>';
                    $nodes_ids[ $n ] = array(
                        'node' => (string)$node_label,
                        'id' => (string)$node_id
                    );
                    $n++;
                }
            }
        }
        //debug ($nodes_ids);
        
        /*
         * Now that we have OpenNMS IDs for each of our nodes, we will query for
         * all the intefaces on those nodes -- one node can have many interfaces.
         * 
         * Alao get the isDown status on that interface.
         * 
         * Resulting array:
            (int) 0 => array(
                   'node' => 'Archive Fiber IP',
                   'id' => '8',
                   'interfaces' => array(
                           (int) 0 => array(
                                   '208.70.28.164' => 'false'
                           )
                   )
           )
         */
        $n = 0;
        foreach ( $nodes_ids as $q ) {
            $results = $HttpSocket->request( $this->getOpenNMSReSTConnection( '/opennms/rest/nodes/'.$q['id'].'/ipinterfaces' ) );
//            debug( $results->body );            
            $xmlIterator = new SimpleXMLIterator( $results->body );
            $u = 0;
            $j = null; // array to hold ip -> status pairs
            for( $xmlIterator->rewind(); $xmlIterator->valid(); $xmlIterator->next() ) {
                if( $xmlIterator->hasChildren() ) {
//                    var_dump($xmlIterator->current());
                    $ip = (string)$xmlIterator->current()->ipAddress;
                    //debug($ip);
                    $down = (string)$xmlIterator->current()->attributes()->isDown;
                    $j[$u] = array( $ip => $down );
                    $u++;
                }
            }
//            echo "J:<BR>";
//            debug($j);
            $q['interfaces'] = $j;
//            echo "Q:<BR>";
//            debug($q);
            $nodes_ids[$n] = $q;
            $n++;
        }
//        debug($nodes_ids);
        $this->set('nodes_ids',$nodes_ids);
        
        // echo '<pre>DUMP:<BR>' . $this->xmlpp($results->body, true) . '</pre>';
    }
    
    public function provision() {
        App::uses('HttpSocket', 'Network/Http');

        
//        $data = array(
//          'model-import' => array(
//              'non-ip-snmp-primary' => 'N',
//               'non-ip-interfaces'  => 'false',
//              'foreign-source'  => 'xxx',
//              'date-stamp' => '2013-01-08T09:39:07.227-08:00',
//              'xmln' => 'http://xmlns.opennms.org/xsd/config/model-import',
//              'node' => array(
//                  'node-label' => 'zzz',
//                  'foreign-id' => 'yyy'
//        )));        
//        $data = array (
//            'key0' => array(
//            'key1' => 'first value',
//            'key2' => 'other value'
//                )
//        );
//        
//        $data = array(
//            array('key' => 'value')
//        );
//        
//        $data = array(
//            'root' => array(
//                'xmlns:' => 'http://xmlns.opennms.org/xsd/config/model-import',
//                //'node node-label' => 'XXX',
//                //'foreign-id' => 'YYY'
//                'node' => array(
//                    'node-label' => 'zzz',
//                    'foreign-id' => 'yyy'
//              )
//            )
//        );
//        
//        $data = array(
//            'model-import' => array(
//                'non-ip-snmp-primary' => 'N', // will be: <non-ip-snmp-primary>N</non-ip-snmp-primary>
//                'node' => array(
//                    'xmlns:' => 'http://xmlns.opennms.org/xsd/config/model-import',
//                    'node-label' => array(
//                        'item 1',
//                        'item 2'
//                    )
//                )
//        ));
//        
//        $xml_data = Xml::fromArray( $data );
//        $xml_string = $xml_data->asXML();
        
       /*

        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <node node-label="snooplion" foreign-id="snooplion" building="renamed-hiphop-artists">
         <interface snmp-primary="N" status="1" ip-addr="8.8.4.4" descr="">
          <monitored-service service-name="DNS"/>
         </interface>
        </node>
       
       */
        
        // creating XML from a data array -- I could not get attributes to work
        // using Cake's XML class, so I am doing it this way:
        // http://www.viper007bond.com/2011/06/29/easily-create-xml-in-php-using-a-data-array/
        
//        $now = date('his');
//        $digits = 7;
//        $foreign_id = rand(pow(10, $digits-1), pow(10, $digits)-1);
        $foreign_source = 'renamed-hiphop-artists';
        
        $data = array(
            'name' => 'node', // "name" required, all else optional
            'attributes' => array(
                'node-label' => 'snooplion44',
                'foreign-id' => 'snooplion',
                'building' => $foreign_source                
//                'xmlns' => 'http://xmlns.opennms.org/xsd/config/model-import'
            ),
            //'value' => 'Some random value.',
            array(
                'name' => 'interface',
                'attributes' => array(
                    'snmp-primary' => 'N',
                    'status' => 1,
                    'ip-addr' => '8.8.8.8',
                    'descr' => ''
                 ),
                //'value'=> '',
                array(
                    'name' => 'monitored-service',
                    'attributes' => array(
                        'service-name' => 'DNS'
                     ),
                    'value'=> '',
                )
            )
        );
        
        $doc = new DOMDocument( '1.0', 'utf-8' );
        $doc->xmlStandalone = true; // standalone = yes
        $child = $this->generate_xml_element( $doc, $data );
        if ( $child )
           $doc->appendChild( $child );
        $doc->formatOutput = true; // Add whitespace to make easier to read XML
        
        $xml_string = $doc->saveXML();
//        $xml_string = new SimpleXMLElement( $doc->saveXML() );
        
        echo "XML:<BR><pre>";
        debug( $xml_string );
//        echo "JSON:<BR>";
//        debug( json_encode( $data ) );
        //$this->xmlpp( $xml_string );
        echo "</pre><BR>";
        
        /*
        //$this->layout = 'ajax';
        //$results = $HttpSocket->post( $this->getOpenNMSReSTConnection( '/opennms/rest/nodes' ), $xml_string );
        $HttpSocket = new HttpSocket();
        $HttpSocket->configAuth('Basic', 'admin', 'Info4@ll');
        // PipeMsg: http://blog.crazytje.be/xml-to-array-and-array-to-xml-in-cakephp/
        $results = $HttpSocket->post( 'http://lab.inveneo.org:8980/opennms/rest/requisitions/'.$foreign_source.'/nodes', array('PipeMsg' => $xml_string ) );
        */
        
        // JSON HttpSocket example:  http://ask.cakephp.org/questions/view/how_to_post_json_with_httpsocket
        
        $HttpSocket = new HttpSocket();
        $HttpSocket->configAuth('Basic', 'admin', 'Info4@ll');
        $results = $HttpSocket->request(
                array(
                    'method' => 'POST',
                    'uri' => 'http://lab.inveneo.org:8980/opennms/rest/requisitions/'.$foreign_source.'/nodes',
                    'header' => array('Content-Type' => 'application/xml'),
                    'body' => $xml_string,
//                    'header' => array('content-type' => 'application/json'),
//                    'body' => json_encode( $data )
                )
        );
        debug( $results );
        //echo '<pre>DUMP:<BR>' . $this->xmlpp( $results->body, true ) . '</pre>';
        // $this->layout = 'default';
//        $response = $http->put(Router::url(array('action' => 'test'), true), $xml_string);
//        
//        debug($response);
        
        
        
        /*
         critchie@opennms-1:~$ cat snooplion.xml 
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<node node-label="snooplion" foreign-id="snooplion" building="renamed-hiphop-artists">
 <interface snmp-primary="N" status="1" ip-addr="8.8.4.4" descr="">
  <monitored-service service-name="DNS"/>
 </interface>
</node>
critchie@opennms-1:~$ curl -v -u admin:Info4\@ll -X POST -T  snooplion.xml http://localhost:8980/opennms/rest/requisitions/renamed-h
         * 
         */
    }
    
    /*
     * Function to generate XML from a data array
     * @see http://www.viper007bond.com/2011/06/29/easily-create-xml-in-php-using-a-data-array/
     */
    function generate_xml_element( $dom, $data ) {
        if ( empty( $data['name'] ) )
            return false;

        // Create the element
        $element_value = ( ! empty( $data['value'] ) ) ? $data['value'] : null;
        $element = $dom->createElement( $data['name'], $element_value );

        // Add any attributes
        if ( ! empty( $data['attributes'] ) && is_array( $data['attributes'] ) ) {
            foreach ( $data['attributes'] as $attribute_key => $attribute_value ) {
                $element->setAttribute( $attribute_key, $attribute_value );
            }
        }

        // Any other items in the data array should be child elements
        foreach ( $data as $data_key => $child_data ) {
            if ( ! is_numeric( $data_key ) )
                continue;

            $child = $this->generate_xml_element( $dom, $child_data );
            if ( $child )
                $element->appendChild( $child );
        }

        return $element;
    }
}

/*
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
        
        $request_lab = array(
            'method' => 'GET',
            'uri' => array (
                'scheme' => 'http',
                'host' => 'lab.inveneo.org',
                'port' => 8980,
                'user' => 'admin',
                'pass' => 'Info4@ll',
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
*/
?>
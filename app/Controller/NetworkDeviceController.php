<?php
/**
 * Super class controller for network devices (radios, routers, switches).
 * 
 * Developed against CakePHP 2.2.5 and PHP 5.4.4.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Controller
 * @since         NetworkDeviceController was introduced in Poundcake v2.3
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class NetworkDeviceController extends AppController {
    
    const OPENNMS = 1;
    
    /*
     * Return the username required to use the monitoring system's API for the current project
     */
    private function getMonitoringSystemUsername() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_username'];
    }
    
    /*
     * Return the password required to use the monitoring system's API for the
     * current project
     */
    private function getMonitoringSystemPassword() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        // this password is encrypted/decrypted with the CryptableBehavior on
        // the Project
        // addslashes escapes the string properly
        $pass = addslashes( $project['Project']['monitoring_system_password'] );
        return $pass;
    }
    
    
    /*
     * Returns the monitoring system name for the current project
     */
    private function getMonitoringSystemName() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['MonitoringSystemType']['name'];        
    }
    
    /*
     * Return the uniform resource identifier (basically the URL) to the API
     * of the monitoring system for the current project
     */
    private function getMonitoringSystemBaseURI() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() );
        $uri = $project['Project']['monitoring_system_url'];
        
        /*/* append a / if it's missing one
        if ( $uri[strlen($uri)-1] != '/' ) {
            $uri = $uri.'/';
        }
        */
        
        // remove the slash if it has one
        if ( $uri[strlen($uri)-1] === '/' ) {
            $uri = substr($uri, 0, -1);
        }
        return $uri;
    }
    
    /*
     * Return the SNMP community string for the current project
     */
    private function getSnmpCommunity() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['snmp_community_name'];
    }
    
    /*
     * Return the SNMP version for the current project
     */
    private function getSnmpVersion() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['SnmpType']['name'];
    }
    
    /*
     * Temporary function...
     * 
     * @see This now exists as a model of its own -- NetworkService -- but at
     * the moment we're not using it since it clogs up the UI, and ultimately
     * we'll have a more complex UI for provisioning nodes
     */
    private function getMonitoredServices() {
        $services = array (
            'ICMP',
            'SNMP',
            'StrafePing'
        );
        return $services;
    }
    
    /*
     * Called from a sub-class to provision a node (switch, router, radio) into
     * the project's monitoring system
     */
    protected function provisionNode( $name, $ip_addr, $debug ) {
        $system = $this->getMonitoringSystemType();
        $ret = null;
       
        // filter_var returns success when the IP is 0.0.0.0
        // ip2long returns false in the case of an invalid IP
        if( filter_var($ip_addr, FILTER_VALIDATE_IP) && ip2long($ip_addr) ) {
            if ( $system == self::OPENNMS ) {
                $ret = $this->provisionNodeOpenNMS( $name, $ip_addr, $debug );
            }
        }
        
        return $ret;
    }
    
    /*
     * Returns true or false if a string ends with a specific character
     */
    private function endsWith($string, $test) {
        $strlen = strlen($string);
        $testlen = strlen($test);
        if ($testlen > $strlen) return false;
        return substr_compare($string, $test, -$testlen) === 0;
    }

    /*
     * 
     */
    protected function getMonitoringSystemLink( $id ) {
        $new_url = null;
        if ( $id > 0 ) {           
            $system = $this->getMonitoringSystemType();
            
            if ( $system == self::OPENNMS ) {
                // http://lab.inveneo.org:8980/opennms/element/node.jsp?node=50               
                $baseURI = $this->getMonitoringSystemBaseURI();
                //$baseURI = preg_replace( $pattern, $baseURI );
                $info = parse_url($baseURI);
                //var_dump($info);                
                $info["path"]=dirname($info["path"]);
                $new_url = $info["scheme"]."://".$info["host"].':'.$info["port"];
                $new_url .= $info["path"];
                if(!empty($info["query"])) $new_url .= "?".$info["query"];
                if(!empty($info["fragment"])) $new_url .= "#".$info["fragment"];
                // append a slash if it's not already there
                if ( !$this->endsWith( '/', $new_url) )
                    $new_url .= '/';
                $new_url .= 'element/node.jsp?node='.$id;
                //debug($new_url);
            }
        }
        $this->set('node_detail_url', $new_url );
    }
    
    /*
     * Return alarms for a given node
     */
    protected function getAlarms() {
        // revisit - need to add caluses for other network monitoring systems
        $alarms = array();        
        $model = $this->modelClass;
        $type = $this->$model->foreignSource;
        $baseURI = $this->getMonitoringSystemBaseURI();
        $id = $this->$model->data[ $model ]['foreign_id'];
        // http://localhost:8980/opennms/rest/alarms?node.foreignSource=Routers&node.foreignId=1001
        $url = $baseURI.'/alarms?node.foreignSource='.$type.'&node.foreignId='.$id;
        $HttpSocket = parent::getMonitoringSystemSocket( $this->getMonitoringSystemUsername(), $this->getMonitoringSystemPassword() );
        if ( !is_null( $HttpSocket ) && ( isset( $url ))  ) {
            $response = $HttpSocket->request(
                        array(
                            'method' => 'GET',
                            //'uri' => 'http://lab.inveneo.org:8980/opennms/rest/requisitions/'.$type.'/nodes',
                            'uri' => $url
                        )
                );
            //var_dump( $response );
            
            $xmlIterator = new SimpleXMLIterator( $response->body );            
            for( $xmlIterator->rewind(); $xmlIterator->valid(); $xmlIterator->next() ) {
                if( $xmlIterator->hasChildren() ) {
                    // $attrs = $xmlIterator->current()->attributes();
                    // can filter by alarms of major severity here
//                    var_dump( $xmlIterator->current() );
                    // iterate through all alarms 
                    foreach( $xmlIterator->children() as $alarm ) { 
//                        var_dump( $alarm );
//                        echo "<BR>";
                        $node_alarm = array();
                        $severity = (string)$alarm->attributes()->severity;
                        $description = (string)$alarm->description;
                        $firstEventTime = (string)$alarm->firstEventTime;
                        array_push( $node_alarm, $severity );
                        array_push( $node_alarm, $description ); 
                        array_push( $node_alarm, $firstEventTime );                        
                        array_push( $alarms, $node_alarm );
                    }
                }
            }
        }        
        // debug( $alarms );
        return $alarms;
    }
    
    /*
     * Provision a node into OpenNMS
     */
    private function provisionNodeOpenNMS( $name, $ip_addr, $debug ) {
        // $this->autoRender = false;        
        $model = $this->modelClass;
        
        // foreignSource is a variable on the model for each of NetworkRadio/NetworkSwitch/NetworkRouter
        $type = $this->$model->foreignSource;
        
        if (isset($type)) {
            
            // creating XML from a data array -- I could not get attributes to work
            // using Cake's XML class, so I am doing it this way:
            // http://www.viper007bond.com/2011/06/29/easily-create-xml-in-php-using-a-data-array/

            // random number for the foreign-id field
            $foreign_id = $this->generateRandomString( 15 );

            $data = array(
                'name' => 'node', // "name" required, all else optional
                'attributes' => array(
                    'node-label' => $name,
                    'foreign-id' => $foreign_id,
                    'building' => $type
                ),
                array(
                    'name' => 'interface',
                    'attributes' => array(
                        'snmp-primary' => 'P', // N?
                        'status' => 1,
                        'ip-addr' => $ip_addr,
                        'descr' => 'Provisioned by Tower DB'
                     ),
    //                Commenting this out but saving it for posterity.  The rest of
    //                the requisite array/XML values is now added by an array of
    //                monitored services, see below -- getMonitoredServices
    //                
    //                array(
    //                    'name' => 'monitored-service',
    //                    'attributes' => array(
    //                        'service-name' => 'ICMP'
    //                     ),
    //                    'value'=> '',
    //                ),
    //                array(
    //                    'name' => 'monitored-service',
    //                    'attributes' => array(
    //                        'service-name' => 'SNMP'
    //                     ),
    //                    'value'=> '',
    //                )               
                )
            );

            $services = $this->getMonitoredServices();
            foreach ($services as $service ) {
                array_push( $data[0], array (
                    'name' => 'monitored-service',
                    'attributes' => array(
                        'service-name' => $service
                    ),
                    'value'=> '',
                ));
            }

            $xml_string = $this->getXMLStringFromArray( $data );
            
            if ( $debug ) {
                echo 'L/P: '.$this->getMonitoringSystemUsername().' '. $this->getMonitoringSystemPassword().'<BR><pre>';
                echo "Sending this XML:<BR><pre>";
                debug( $xml_string );
                echo "</pre><BR>";
            }

            // send it on to OpenNMS
            // for future reference, JSON HttpSocket example:  http://ask.cakephp.org/questions/view/how_to_post_json_with_httpsocket
            // $HttpSocket = new HttpSocket();
            // $HttpSocket->configAuth('Basic', 'admin', 'xx');        
            // $HttpSocket = $this->getMonitoringSystemSocket( $this->getMonitoringSystemUsername(), $this->getMonitoringSystemPassword() );
            $HttpSocket = parent::getMonitoringSystemSocket( $this->getMonitoringSystemUsername(), $this->getMonitoringSystemPassword() );
            $baseURI = $this->getMonitoringSystemBaseURI();
            
            if ( !is_null( $HttpSocket ) && ( isset( $baseURI ))  ) {
                $response = $HttpSocket->request(
                        array(
                            'method' => 'POST',
                            //'uri' => 'http://lab.inveneo.org:8980/opennms/rest/requisitions/'.$type.'/nodes',
                            'uri' => $baseURI.'/requisitions/'.$type.'/nodes',
                            'header' => array('Content-Type' => 'application/xml'),
                            'body' => $xml_string,
        //                    'header' => array('content-type' => 'application/json'),
        //                    'body' => json_encode( $data )
                        )
                );


                if ( $debug ) {
                    echo "Response 1:<BR><pre>";
                    debug( $response );
                    echo "</pre><BR>";
                }

                // now create the XML for SNMP monitoring
                $data = $this->getSnmpConfig_opennms( $this->getSnmpVersion(), $this->getSnmpCommunity() );
                $xml_string = $this->getXMLStringFromArray( $data );
                
                if ( $xml_string != null ) {

                    if ( $debug ) {
                        echo "Sending this XML:<BR><pre>";
                        debug( $xml_string );
                        echo "</pre><BR>";
                    }

                    $response = $HttpSocket->request(
                            array(
                                'method' => 'PUT',
                                'uri' => $baseURI.'/snmpConfig/'.$ip_addr,
                                'header' => array('Content-Type' => 'application/xml'),
                                'body' => $xml_string,
                            )
                    );

                    if ( $debug ) {
                        echo "Response 2:<BR><pre>";
                        debug( $response );
                        echo "</pre><BR>";
                    }
                }

                // now run the actual import
                $response = $HttpSocket->request(
                        array(
                            'method' => 'PUT',
                            'uri' => $baseURI.'/requisitions/'.$type.'/import',
                            'header' => array('Content-Type' => 'application/xml'),
                            //'body' => $xml_string
                        )
                );

                if ( $debug ) {
                    echo "Response 3:<BR><pre>";
                    debug( $baseURI.'/requisitions/'.$type.'/import' );
                    debug( $response );
                    echo "</pre><BR>";
                }
                
                // Get the status code for the response.
                // OpenNMS seems to return HTTP303 -- because it's an asynchronous call?
                $code = $response->code;
                if ( $code == 303 ) {
                    return $foreign_id;
                }
            }
        }
        
        // otherwise, problem
        return null;
    }
    
    /*
     * Return a class constant (enumarated value) for the monitoring system type
     */
    private function getMonitoringSystemType() {
        $ret = null;
        $system = $this->getMonitoringSystemName();
        if (preg_match( "/opennms/i", $system )) {
            $ret = self::OPENNMS;
        }
        return $ret;
    }
    
    /*
     * Return the datetime format for the current project
     */
    protected function getDateTimeFormat() {
        $model = $this->modelClass;
        // of course this will error if the item doesn't have a relation to project
        return $this->$model->Site->Project->field('datetime_format');
    }
    
    /*
     * Return proper XML from a given data array
     */
    private function getXMLStringFromArray( $data ) {        
        if ( $data != null ) {
            // generate the XML for adding a node
            $doc = new DOMDocument( '1.0', 'utf-8' );
            $doc->xmlStandalone = true; // adds attribute: standalone="yes"
            $child = parent::generateXMLElement( $doc, $data );
            if ( $child )
               $doc->appendChild( $child );
            $doc->formatOutput = true; // add whitespace to make easier to read XML
            return $doc->saveXML();
        }
    }
    
    /*
     * Returns a data array for the SNMP configuration (format is specific to OpenNMS)
     */
    private function getSnmpConfig_opennms( $snmp_version, $snmp_community ) {
        $data = null;
        if ( (isset($snmp_version)) && (isset($snmp_community)) ) {
                $data = array(
                    'name' => 'snmp-info', // "name" required, all else optional
                    array(
                        'name' => 'community',
                        'value' => $snmp_community
                        ),
                    array(
                        'name' => 'port',
                        'value' => '161'
                        ),
                     array(
                        'name' => 'retries',
                        'value' => '1'
                        ),
                    array(
                        'name' => 'timeout',
                        'value' => '1600'
                        ),
                    array(
                        'name' => 'version',
                        'value' => $snmp_version
                        ),
               );
        }
        return $data;
    }
    
    /*
     * Return a random string of length $length (currently used for the foreignID
     * field when provisioning a node into OpenNMS)
     */
    private function generateRandomString( $length = 20 ) {    
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
}
?>

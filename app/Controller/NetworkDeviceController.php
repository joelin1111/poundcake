<?php
/**
 * Super class controller for network devices (radios, routers, switches).
 * 
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
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
    
    /*
     * 
     */
    private function getMonitoringSystemUsername() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_username'];
    }
    
    /*
     * 
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
     * 
     */
    private function getMonitoringSystemBaseURI() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() );
        $uri = $project['Project']['monitoring_system_url'];
        // append a / if it's missing one
//        if ( $uri[strlen($uri)-1] != '/' ) {
//            $uri = $uri.'/';
//        }
        // remove the slash if it has one
        if ( $uri[strlen($uri)-1] === '/' ) {
            $uri = substr($uri, 0, -1);
        }
        return $uri;
    }
    
    /*
     * 
     */
    private function getSnmpCommunity() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['snmp_community_name'];
    }
    
    /*
     * 
     */
    private function getSnmpVersion() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['SnmpType']['name'];
    }
    
    /*
     * 
     */
    /*
    private function getMonitoringSystemSocket( $username, $password ) {
        App::uses('HttpSocket', 'Network/Http');
        
        if ( !(is_null( $username )) && !(is_null( $password )) ) {
            // for future reference, JSON HttpSocket example:  http://ask.cakephp.org/questions/view/how_to_post_json_with_httpsocket
            $HttpSocket = new HttpSocket();
            $HttpSocket->configAuth(
                    'Basic',
                    $username,
                    $password
                );
            return $HttpSocket;
        } else {
            return null;
        }
    }
    */
    
    /*
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
     * 
     */
    protected function provision_node( $name, $ip_addr, $debug ) {
//        $this->autoRender = false;
        
        $model = $this->modelClass;
        // foreignSource is a variable on the model for NetworkRadio/NetworkSwitch/NetworkRouter
        $type = $this->$model->foreignSource;
        if (isset($type)) {
            
            // creating XML from a data array -- I could not get attributes to work
            // using Cake's XML class, so I am doing it this way:
            // http://www.viper007bond.com/2011/06/29/easily-create-xml-in-php-using-a-data-array/

            // build up an array of monitored services
            /* Array
               (
                   [0] => Array
                       (
                           [name] => monitored-service
                           [attributes] => Array
                               (
                                   [service-name] => ICMP
                               )

                           [value] => 
                       )

                   [1] => Array
                       (
                           [name] => monitored-service
                           [attributes] => Array
                               (
                                   [service-name] => SNMP
                               )

                           [value] => 
                       )

               )
             */
            // random number for the foreign-id
    //        $digits = 7;
    //        $foreign_id = rand(pow(10, $digits-1), pow(10, $digits)-1);
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

            // generate the XML for adding a node
            $doc = new DOMDocument( '1.0', 'utf-8' );
            $doc->xmlStandalone = true; // adds attribute: standalone="yes"
            $child = parent::generateXMLElement( $doc, $data );
            if ( $child )
               $doc->appendChild( $child );
            $doc->formatOutput = true; // add whitespace to make easier to read XML

            $xml_string = $doc->saveXML();
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
            
            if ( !is_null($HttpSocket) && ( isset($baseURI))  ) {
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
                $snmp_version = $this->getSnmpVersion();
                $snmp_community = $this->getSnmpCommunity();
                $data = $this->getSnmpConfig( $snmp_version, $snmp_community );
                
                if ( $data != null ) {
                    $doc = new DOMDocument( '1.0', 'utf-8' );
                    $doc->xmlStandalone = true; // adds attribute: standalone="yes"
                    $child = parent::generateXMLElement( $doc, $data );
                    if ( $child )
                       $doc->appendChild( $child );
                    $doc->formatOutput = true; // add whitespace to make easier to read XML

                    $xml_string = $doc->saveXML();
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

                // now do the actual import
                $response = $HttpSocket->request(
                        array(
                            'method' => 'PUT',
                            'uri' => $baseURI.'/'.$type.'/import',
                            'header' => array('Content-Type' => 'application/xml'),
                            'body' => $xml_string
                        )
                );


                if ( $debug ) {
                    echo "Response 3:<BR><pre>";
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
     * 
     */
    private function getSnmpConfig( $snmp_version, $snmp_community ) {
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
     * Return a random string of length $length - used for the foreignID
     * in OpenNMS
     */
    private function generateRandomString( $length = 20 ) {    
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
}
?>

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
//        $username = 'admin';
//        return $username;
//        $model = $this->modelClass; // NetworkRadio, NetworkRouter, NetworkSwitch
//        debug( $this->$model->Site->Project->field( 'monitoring_system_username' )); //MonitoringSystemUsername() );
//        debug( $this->$model->Site->Project->findById( $this->Session->read('project_id') )); //MonitoringSystemUsername() );        
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_username'];
    }
    
    /*
     * 
     */
    private function getMonitoringSystemPassword() {
//        $password = 'Info4@ll';
//        return $password;
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        //debug($project['Project']['monitoring_system_password']);
        // this password is encrypted/decrypted with the CryptableBehavior on
        // the Project
        // addslashes escapes the string properly
        $pass = addslashes( $project['Project']['monitoring_system_password'] );
        return $pass;
        // return $project['Project']['monitoring_system_password'];
    }
    
    /*
     * 
     */
    private function getMonitoringSystemBaseURI() {
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_url'];
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
    private function getMonitoringSystemSocket() {
        App::uses('HttpSocket', 'Network/Http');
        
        $username = $this->getMonitoringSystemUsername();
        $password = $this->getMonitoringSystemPassword();   
        
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
    protected function provision_node( $name, $type, $ip_addr, $debug ) {
        $this->autoRender = false;
        
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
                    'descr' => ''
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
        $child = $this->generateXMLElement( $doc, $data );
        if ( $child )
           $doc->appendChild( $child );
        $doc->formatOutput = true; // add whitespace to make easier to read XML
        
        $xml_string = $doc->saveXML();
        if ( $debug ) {
            echo "XML:<BR><pre>";
            debug( $xml_string );
            echo "</pre><BR>";
        }
        
        // send it on to OpenNMS
        // for future reference, JSON HttpSocket example:  http://ask.cakephp.org/questions/view/how_to_post_json_with_httpsocket
        // $HttpSocket = new HttpSocket();
        // $HttpSocket->configAuth('Basic', 'admin', 'xx');        
        $HttpSocket = $this->getMonitoringSystemSocket();
        if ( !is_null($HttpSocket) ) {
            $response = $HttpSocket->request(
                    array(
                        'method' => 'POST',
                        'uri' => 'http://lab.inveneo.org:8980/opennms/rest/requisitions/'.$type.'/nodes',
                        'header' => array('Content-Type' => 'application/xml'),
                        'body' => $xml_string,
    //                    'header' => array('content-type' => 'application/json'),
    //                    'body' => json_encode( $data )
                    )
            );
        
        
            if ( $debug ) {
                debug( $response );
            }
            
            // now create the XML for SNMP monitoring
            $snmp_version = $this->getSnmpVersion();
            $snmp_community = $this->getSnmpCommunity();
            
            $data = $this->getSnmpConfig( $this->getSnmpVersion(), $this->getSnmpCommunity() );
            if ( $data != null ) {
                $doc = new DOMDocument( '1.0', 'utf-8' );
                $doc->xmlStandalone = true; // adds attribute: standalone="yes"
                $child = $this->generateXMLElement( $doc, $data );
                if ( $child )
                   $doc->appendChild( $child );
                $doc->formatOutput = true; // add whitespace to make easier to read XML

                $xml_string = $doc->saveXML();
                if ( $debug ) {
                    echo "XML SNMP:<BR><pre>";
                    debug( $xml_string );
                    echo "</pre><BR>";
                }

                $response = $HttpSocket->request(
                        array(
                            'method' => 'PUT',
                            'uri' => 'http://lab.inveneo.org:8980/opennms/rest/snmpConfig/'.$ip_addr,
                            'header' => array('Content-Type' => 'application/xml'),
                            'body' => $xml_string,
                        )
                );

                if ( $debug ) {
                    debug( $response );
                }
            }
            
            // Get the status code for the response.
            // OpenNMS seems to return HTTP303 -- because it's an asynchronous call?
            $code = $response->code;
            if ( $code == 303 ) {
                return $foreign_id;
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
     * This function generates XML from a data array
     * 
     * @see http://www.viper007bond.com/2011/06/29/easily-create-xml-in-php-using-a-data-array/
     */
    protected function generateXMLElement( $dom, $data ) {
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

            $child = $this->generateXMLElement( $dom, $child_data );
            if ( $child )
                $element->appendChild( $child );
        }

        return $element;
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

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
 * @since         NetworkDeviceController was introduced in Poundcake v2.2.5
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class NetworkDeviceController extends AppController {
    
    private function getMonitoringSystemUsername() {
//        $username = 'admin';
//        return $username;
//        $model = $this->modelClass; // NetworkRadio, NetworkRouter, NetworkSwitch
//        debug( $this->$model->Site->Project->field( 'monitoring_system_username' )); //MonitoringSystemUsername() );
//        debug( $this->$model->Site->Project->findById( $this->Session->read('project_id') )); //MonitoringSystemUsername() );        
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_username'];        
        die;
    }
    
    private function getMonitoringSystemPassword() {
//        $password = 'Info4@ll';
//        return $password;
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        //debug($project['Project']['monitoring_system_password']);
        $pass = addslashes( $project['Project']['monitoring_system_password'] );
        return $pass;
        // return $project['Project']['monitoring_system_password'];
    }
    
    private function getMonitoringSystemBaseURI() {
//        $uri = 'http://lab.inveneo.org:8980/opennms/rest/';
//        return $uri;
        $project = ClassRegistry::init('Project')->findById( $this->Session->read('project_id') , array() ); 
        return $project['Project']['monitoring_system_url'];
    }
    
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
    
    // probably want to move this into a model of it's own, i.e. so
    // that the admin can dynamically modify this
    private function getMonitoredServices() {
        $services = array (
            'ICMP',
            'SNMP'
        );
        return $services;
    }
    
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
                    'snmp-primary' => 'N',
                    'status' => 1,
                    'ip-addr' => $ip_addr,
                    'descr' => ''
                 ),
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
        
        
        
        // this does not work, the resulting XML has each monitored-service tag
        // closed, and OpenNMS does not like that
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
//        debug( $data );
//        die;
        
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
    
    function generateRandomString( $length = 20 ) {    
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
    }
}

/*        
        if ($this->request->is('post') || $this->request->is('put')) {
            // provision nodes with HttpSocket here
        } else {
            
            $project_id = $this->Session->read('project_id');
            debug( $project_id );
      
            if ( $project_id > 0 ) {
                $conditions = array(
                    'AND' => array(
                        'Site.project_id' => $project_id // only show sites for the current project
                    )
                );
//                $this->Site->recursive = 1;
                $sites = $this->Site->find('all', array(
                    'conditions' => $conditions,
                    'recursive' => 1
                ));
//                $sites = $this->Site->find('all');
                debug( $project_id );
                debug( $sites );
                
                $log = $this->Site->getDataSource()->getLog(false, false);
                debug($log);
                die;
                $this->set('sites', $sites);
                
//                $sites = $this->Site->findByProjectId( $this->Session->read('project_id') );                
//                $sites = ClassRegistry::init('Sites')->find('all', array()); 
//                $sites = ClassRegistry::init('Sites')->findAllByProjectId( $project_id , array() ); 
//                debug($sites);
//                die;
            }
        }
*/
?>

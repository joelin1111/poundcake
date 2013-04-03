<?php
/**
 * Model for IP addresses from the addrpool database.
 * 
 * Note this model is unique within Poundcake -- it representats the addrpool
 * application, an external (Python, not CakePHP) system Inveneo uses for IP
 * address allocation and management.
 * 
 * Developed against CakePHP 2.2.3 and PHP 5.4.x.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         IPAddress precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppModel', 'Model');

class AddrpoolIPAddress extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * IPAddress pulls data from a different datasource
     */
    var $useTable = 'addrpool_subnet'; // This model uses the database table 'addrpool_subnet' in the addrpool db
    
    /*
     * IPAddress pulls data from a different datasource
     */
    var $useDbConfig = 'addrpool';
    
    /*
     * Returns all the IP addresses from addrpool for a given radio name.
     * Note this name is plural
     */
    public function getAllIPAddresses($name) {
        $addresses = '';
        if (isset($name)) {
            $query = 'call sp_get_all_ip_addresses("'.$name.'%")';
            $addresses = ClassRegistry::init('AddrpoolIPAddress')->query( $query );
        }
        return $addresses;
    }
    
    /*
     * Returns the IP address from addrpool for a given radio name.
     * Note this name is singular
     */
    public function getIPAddress($name) {
        $ip_address = '';
        $value = '';
        if (isset($name)) {    
            $query = 'select sp_get_ip_address("'.$name.'")';          
            $ip_address = ClassRegistry::init('AddrpoolIPAddress')->query($query);
            if (is_array($ip_address)) {
                foreach ($ip_address[0][0] as $key => $value) {
                    $ip_address = $value;
                }
            }
        }
        return $ip_address;
    }
    
    /*
     * Returns all gateway IP addresses from addrpool for a given radio name.
     */
    public function getGatewayAddress($name) {
        if (isset($name)) {
            $query = 'call sp_get_gw("'.$name.'")';
            $address = ClassRegistry::init('AddrpoolIPAddress')->query( $query );
            if (is_array($address)) {
                //echo "results";
                foreach ($address[0][0] as $key => $value) {
                    $address = $value;
                }
            } else {
                $address = '';
            }
        }
        return $address;
    }
}

<?php
App::uses('AppModel', 'Model');

class IPAddress extends AppModel {

    public $displayField = 'name';
    var $useTable = 'addrpool_subnet'; // This model uses the database table 'addrpool_subnet' in the addrpool db
    
    var $useDbConfig = 'addrpool';
    
    // plural
    public function getAllIPAddresses($name) {
        $addresses = '';
        if (isset($name)) {
            // current model can be accessed via: $this->modelClass;
            // $name = $this->{$this->modelClass}->field('name');
            $query = 'call sp_get_all_ip_addresses("'.$name.'%")';
            $addresses = ClassRegistry::init('IPAddress')->query( $query );
        }
        return $addresses;
    }
    
    // singular
    public function getIPAddress($name) {
        $address = '';
        if (isset($name)) {
            $query = 'select sp_get_ip_address("'.$name.'")';
            $address = ClassRegistry::init('IPAddress')->query( $query );
            foreach ($address[0][0] as $key => $value) {
                $address = $value;
            }            
        }
        // note we're supressing any PHP warnings when there is no IP address
        //echo $address;
        return @$address;
    }
    
    public function getGatewayAddress($name) {
        $address = '';
        /*
        if (isset($name)) {
            $query = 'select sp_get_gateway("'.$name.'")';
            $address = ClassRegistry::init('IPAddress')->query( $query );
            foreach ($address[0][0] as $key => $value) {
                $address = $value;
            }            
        }
        // note we're supressing any PHP warnings when there is no IP address
        //echo $address;
        */
        return @$address;
    }
}

<?php
App::uses('AppModel', 'Model');

class IPAddress extends AppModel {

    public $displayField = 'name';
    var $useTable = 'addrpool_subnet'; // This model uses the database table 'addrpool_subnet' in the addrpool db
    
    var $useDbConfig = 'addrpool';
    
    public function getAddress($name) {
        $addresses = '';
        if (isset($name)) {
            // current model can be accessed via: $this->modelClass;
            // $name = $this->{$this->modelClass}->field('name');
            $query = 'call sp_get_address("'.$name.'%")';
            $addresses = ClassRegistry::init('IPAddress')->query( $query );
        }
        return $addresses;
    }
}

<?php
// This is a HABTM Through the Join Model relation
// Duplicate of RadioTypeNetworkInterfaceTypes
class RouterTypeNetworkInterfaceTypes extends AppModel {
    public $belongsTo = array(
        'RouterType' => array(
            'className'    => 'RouterType',
            'foreignKey'   => 'router_type_id'
        ),
       'NetworkInterfaceType' => array(
            'className'    => 'NetworkInterfaceType',
            'foreignKey'   => 'network_interface_type_id'
        )
    );
}
?>

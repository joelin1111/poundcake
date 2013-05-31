<?php
// This is a HABTM Through the Join Model relation
class RadioTypeNetworkInterfaceTypes extends AppModel {
    public $belongsTo = array(
//        'RadioType',
//        'NetworkInterfaceType',
        'RadioType' => array(
            'className'    => 'RadioType',
            'foreignKey'   => 'radio_type_id'
        ),
       'NetworkInterfaceType' => array(
            'className'    => 'NetworkInterfaceType',
            'foreignKey'   => 'network_interface_type_id'
        )
    );
}
?>

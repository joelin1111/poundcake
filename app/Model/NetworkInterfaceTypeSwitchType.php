<?php
class NetworkInterfaceTypeSwitchType extends AppModel {
    public $belongsTo = array(
        'NetworkInterfaceType',
        'SwitchType'
    );
}
?>

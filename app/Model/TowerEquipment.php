<?php
App::uses('AppModel', 'Model');

class TowerEquipment extends AppModel {

    public $displayField = 'name';
    
    public $useTable = 'tower_equipment';
    
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
    );
}

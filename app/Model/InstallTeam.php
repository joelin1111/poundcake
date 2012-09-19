<?php
App::uses('AppModel', 'Model');

class InstallTeam extends AppModel {

    public $displayField = 'name';

    /*
    var $belongsTo = array(
        'Site',
        'RadioType',
        'AntennaType'
    );
    */
    public $hasMany = array(
        'Contact'
    );
    
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
        ),
    );
}

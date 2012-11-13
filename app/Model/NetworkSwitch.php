<?php
App::uses('AppModel', 'Model','CakeSession');

class NetworkSwitch extends AppModel {

    public $displayField = 'name';
    
    public $hasMany = array(
        'NetworkRadio'
    );
    
    var $belongsTo = array(
        'SwitchType'
    );

    var $hasOne = array(
        'Site'
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
            )/*,
            'alphanumeric' => array(
                'rule' => array('alphanumeric'),
                'message' => 'Only letters and numbers are allowed.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),*/
        ),
    );
    
    
}

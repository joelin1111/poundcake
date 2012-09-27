<?php
App::uses('AppModel', 'Model');

class RadioMode extends AppModel {
    
    public $displayField = 'name';

    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )/*,
            'alphanumeric' => array(
                'rule' => array('alphanumeric'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),*/
        ),
    );
}

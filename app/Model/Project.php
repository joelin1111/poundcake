<?php
App::uses('AppModel', 'Model');

class Project extends AppModel {

    public $displayField = 'name';
    
    public $hasAndBelongsToMany = array('User');
    
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

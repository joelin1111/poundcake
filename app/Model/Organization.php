<?php
App::uses('AppModel', 'Model');

class Organization extends AppModel {
    
    // not working?
    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'Organizations.name' => 'asc'
        )
    );
    
    public $displayField = 'name';

    public $hasMany = array(
        'Contact',
        'Site'
    );
    
    public $hasAndBelongsToMany = array('Project');

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

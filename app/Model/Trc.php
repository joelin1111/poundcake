<?php
App::uses('AppModel', 'Model');

class Trc extends AppModel {

    var $virtualFields = array('trc_vf' => 'CONCAT(trc_code, " ", trc_name)');
    
    public $displayField = 'trc_vf';
    //public $displayField = 'trc_name';

    var $belongsTo = array(
        'ConnectivityType',
        'InterventionType',
        'SiteState',
        'ServiceProvider',
        'PowerType',
        'RoadType',
    );

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

    public $hasMany = array(
        'Contacts' => array(
                'className' => 'Contact',
                'foreignKey' => 'trc_id',
                'dependent' => false,
                'conditions' => '',
                'fields' => '',
                'order' => '',
                'limit' => '',
                'offset' => '',
                'exclusive' => '',
                'finderQuery' => '',
                'counterQuery' => ''
        ),

        'Schools' => array(
                'className' => 'School',
                'foreignKey' => 'trc_id',
                'dependent' => false,
                'conditions' => '',
                'fields' => '',
                'order' => '',
                'limit' => '',
                'offset' => '',
                'exclusive' => '',
                'finderQuery' => '',
                'counterQuery' => ''
        )
    );

}

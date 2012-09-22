<?php
App::uses('AppModel', 'Model');

class NetworkRadio extends AppModel {

    public $displayField = 'name';

    var $belongsTo = array(
        'Site',
        'RadioType',
        'NetworkSwitch',
        'AntennaType',
        //'NetworkLink'
        //'NetworkLink' => array('foreignKey' => 'zipcode')

    );
    
    /*
    var $virtualFields = array(
        'target' => "NetworkLink.radio_dest_id"
    );    
    */
    
    /*
    var $hasAndBelongsToMany = array(
        'Tag' =>
            array(
                'className'              => 'NetworkRadio',
                'joinTable'              => 'radios_radios',
                'foreignKey'             => 'src_id',
                'associationForeignKey'  => 'dest_id',
                'unique'                 => true,
                'conditions'             => '',
                'fields'                 => '',
                'order'                  => '',
                'limit'                  => '',
                'offset'                 => '',
                'finderQuery'            => '',
                'deleteQuery'            => '',
                'insertQuery'            => ''
            )
    );
    */
    
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                'allowEmpty' => false,
                'required' => true,
                //'last' => false, // Stop validation after this rule
                'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
        ),
    );
}

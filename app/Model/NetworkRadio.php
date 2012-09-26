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
    
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                'allowEmpty' => false,
                'required' => true,
                //'last' => false, // Stop validation after this rule
                'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
            'isUnique' => array(
                'rule' => array('isUnique', array('name')),
                'message' => 'This field need must be unique!'
            ),
            'format' => array(
                'rule' => '/^[a-z0-9]{1,}\-[a-z0-9]{1,}$/i',
                'message' => 'Wrong format, should be: [Letters, Numbers]-[Letters, Numbers]'
            ),
        ),
    );
}

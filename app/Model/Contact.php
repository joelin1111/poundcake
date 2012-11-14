<?php
App::uses('AppModel', 'Model');

class Contact extends AppModel {

    public $displayField = 'first_name';

    public $belongsTo = array('Organization','ContactType','InstallTeam');
    
    public $virtualFields = array(
        'name_vf' => 'CONCAT(first_name, " ", last_name)'
        //'contact_vf' => 'CONCAT(first_name, " ", last_name, " (",")")'
    );
    
    /*
    // we are using afterFind to define a second virutal field since we need to
    // pull from a related model -- something that's not possible with the
    // standard public $virtualFields approach
    public function afterFind($results, $primary = false) {
        foreach ($results as $key => $val) {
            if (isset($val['Contact']['first_name']) && isset($val['Contact']['last_name'])) {
                $results[$key]['Contact']['contact_role'] = 'foo bar';
            }
        }
        return $results;
    }
    */
    
    public $validate = array(
        'first_name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'last_name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        /*
        'phone' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'email' => array(
            'rule'    => array('email', true),
            'message' => 'Please supply a valid email address.'
        )
        */
    );

}
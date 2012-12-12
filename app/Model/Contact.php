<?php
/**
 * Model for a contact.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         Contact precedes Poundcake v2.2.1
 * @license       XYZ License
 */

App::uses('AppModel', 'Model');

class Contact extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'first_name';

    /*
     * Relations
     */
    public $belongsTo = array('Organization','ContactType','InstallTeam');
    
    /*
     * Use Cake virtual fields to create first name + last name pair
     */
    public $virtualFields = array(
        'name_vf' => 'CONCAT(first_name, " ", last_name)'
        //'contact_vf' => 'CONCAT(first_name, " ", last_name, " (",")")'
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'first_name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        ),
        'last_name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
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
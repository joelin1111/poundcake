<?php
/**
 * Model for RouterType.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.x.
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
 * @since         Zone precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class RouterType extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Relations
     */
    public $hasAndBelongsToMany = array(
        'NetworkInterface'
    );
    
    /*
     * Default sort order
     */
    var $order = 'RouterType.name ASC';
    
    /*
     * Field-level validation rules
     */
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
        'manufacturer' => array(
            'notempty' => array(
                'rule' => 'alphaNumeric',
                'message' => 'Manufacturer name may not contain spaces.'
            )
        ),
        'watts' => array(
            'notempty' => array(
                'rule' => 'numeric',
                'message' => 'Watts are a required value.'
            )
        )
    );
}
?>
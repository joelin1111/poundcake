<?php
/**
 * Model for frequencies.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.x.
 *
 * Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         Frequency was introduced in Poundcake v2.7
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class Frequency extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * Default sort order
     */
    var $order = "Frequency.frequency asc";

    /*
     * Relations
     */
    var $belongsTo = array(
       'RadioBand'
    );
    
    // var $actsAs = array('Containable');
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'frequency' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
            'numeric' => array(
                'rule' => array('numeric'),
                'message' => 'This field must be an integer.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
        )
    );
}

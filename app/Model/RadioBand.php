<?php
/**
 * Model for radio bands.
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
 * @since         RadioBand was introduced in Poundcake v2.7
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class RadioBand extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * Default sort order
     */
    var $order = "RadioBand.name asc";

    /*
     * Relations
     */
    var $hasMany = array(
       'Frequency'
    );
    
    /*
     * Relations
     */
    var $hasOne = array(
       'RadioType'
    );
    
    // var $actsAs = array('Containable');
    
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
        )
    );
}

<?php
/**
 * Model for network address.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.x.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         NetworkAddress was introduced in Poundcake v3.0.0
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class IpAddress extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Default sort order
     */
    // var $order = 'PowerType.name ASC';
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'Project'
    );
    
    var $actsAs = array( 
        'IPv4' => array( 
            'fields' => array( 
                'ip_address'
            ) 
        ),        
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'ip_address' => array(
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
?>
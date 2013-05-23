<?php
/**
 * Model for a network interface.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.x.
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
 * @since         RadioType precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class NetworkInterface extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Default sort order
     */
    var $order = 'NetworkInterface.name ASC';
    
    /*
     * Relations
     */
    var $belongsTo = array(
       //'RadioBand'
    );
    
    /*
     * Relations
     */
    var $hasMany = array(
       //'NetworkRadios'
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
            )
        )
    );
}
?>
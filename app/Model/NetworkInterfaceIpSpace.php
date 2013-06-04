<?php
/**
 * Model to track the mapping of IP Spaces to network interfaces.
 *
 * Developed against CakePHP 2.3.5 and PHP 5.4.x.
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
 * @since         NetworkInterfaceIpSpace was introduced in Poundcake 3.1.0
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class NetworkInterfaceIpSpace extends AppModel {

    /*
     * Relations
     */
    public $belongsTo = array(
        'NetworkRadio'
    );
    
    /*
     * Field-level validation rules
     */
    /*
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
            )
        )
    );
    */
}
?>
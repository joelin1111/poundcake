<?php
/**
 * Model for site state icons.
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
 * @since         SiteStateIcon was introduced in Poundcake v3.0.0
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class SiteStateIcon extends AppModel {

    var $hasMany = 'SiteState';
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'img_data' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                //'allowEmpty' => false,
                'required' => true,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
            )
    );
}

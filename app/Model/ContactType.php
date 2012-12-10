<?php
/**
 * Model for contact type.
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
 * @since         ContactType precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class ContactType extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Relations
     */
    public $hasMany = array(
        'Contact'
    );
    
    /*
     *  Field-level valiation rules
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
    );
}

<?php
/**
 * Model for project.
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
 * @since         Project precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class Project extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * Relations
     */
    public $hasAndBelongsToMany = array('User');
    
    /*
     * Relations
     */
    public $belongsTo = array(
        'SnmpType',
        'MonitoringSystemType'
    );
    
    /*
     * @see http://bakery.cakephp.org/articles/utoxin/2009/08/01/cryptable-behavior
     */
    var $actsAs = array( 
        'Cryptable' => array( 
            'fields' => array( 
                'monitoring_system_password',
                'snmp_community_name'
            ) 
        ) 
    ); 
    
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
    );
    
}

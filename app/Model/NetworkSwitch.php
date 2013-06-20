<?php
/**
 * Model for network switch.
 *
 * Ideally this Model would be called just Switch, not NetworkSwitch, but
 * switch is a PHP keyword.  See also NetworkRadio, NetworkRouter.
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
 * @since         NetworkSwitch precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model','CakeSession');

class NetworkSwitch extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';    
    
    /*
     * Behaviors to use -- IPv4 auto encodes/decodes IPv4 addresses in
     * the fields defined below
     */
    var $actsAs = array( 
        'IPv4' => array( 
            'fields' => array( 
                'ip_address'
            ) 
        ) 
    );
    
    public $virtualFields = array(
        // see comments on NetworkRouter
        'watts' => 'SELECT watts FROM switch_types WHERE id=switch_type_id',
        'value' => 'SELECT value FROM switch_types WHERE id=switch_type_id',
    );
    
    /*
     * Used for the foreignSource name (in OpenNMS)
     */
    public function getForeignSource() {
        // I can't seem to sort out the right way, in a model function, to load
        // a property on a related model
        // this function is in the models for each of Radios/Switches/Routers
        $type = ClassRegistry::init("SwitchType")->findById($this->data['NetworkSwitch']['switch_type_id']);
        return $type['SwitchType']['manufacturer'];       
    }
    
    /*
     * Relations
     * Returns attached radios sorted by the switch port there's connected to.
     */
    public $hasMany = array(
        'NetworkRadio' => array('order' => 'NetworkRadio.switch_port')
    );
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'SwitchType',
        'SnmpType'
    );

    /*
     * Relations
     */
    var $hasOne = array(
        'Site'
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                'required' => false
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )/*,
            'alphanumeric' => array(
                'rule' => array('alphanumeric'),
                'message' => 'Only letters and numbers are allowed.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),*/
        ),
    );
}

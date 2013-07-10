<?php
/**
 * Model for NetworkRouter.
 *
 * Ideally this Model would be called just Router, not NetworkRouter, but
 * router is a CakePHP keyword.  See also NetworkRadio, NetworkSwitch.
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

class NetworkRouter extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    public $virtualFields = array(
        // maybe I'll regret doing this, but I sort of just want access to
        // these values on the NetworkRouter itself -- see PC-555
        'watts' => 'SELECT watts FROM router_types WHERE id=NetworkRouter.router_type_id',
        'value' => 'SELECT value FROM router_types WHERE id=NetworkRouter.router_type_id',
    );
    
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
    
    /*
     * Used for the foreignSource name (in OpenNMS)
     */
    public function getForeignSource() {
        // I can't seem to sort out the right way, in a model function, to load
        // a property on a related model
        // this function is in the models for each of Radios/Switches/Routers
        $type = ClassRegistry::init("RouterType")->findById($this->data['NetworkRouter']['router_type_id']);
        return $type['RouterType']['manufacturer'];       
    }
    
    /*
     * Relations
     * Returns attached radios sorted by the switch port there's connected to.
     */
    public $hasMany = array(
        'NetworkRadio' => array('order' => 'NetworkRadio.router_port')
    );
    
    var $belongsTo = array(
        'RouterType',
        'SnmpType'
    );
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
            ),
            'name' => array(
                'rule'    => 'alphaNumericDashUnderscore',
                'message' => 'Name can only be letters, numbers, dash and underscore'
            )
        ),
    );
}

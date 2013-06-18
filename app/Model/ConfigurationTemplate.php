<?php
/**
 * Model for configuration templates.
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
 * @since         ConfigurationTemplate was introduced in Poundcake v3.1.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class ConfigurationTemplate extends AppModel {
    
    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Relations
     */
//    public $hasMany = array(
//        'Contact',
//        'Site'
//    );
    
    /*
     * Default sort order
     */
    var $order = 'ConfigurationTemplate.name ASC';
    
    /*
     * Relations
     */
    public $hasAndBelongsToMany = array('Project');

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
            )/*,
            'alphanumeric' => array(
                'rule' => array('alphanumeric'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),*/
        ),
    );
    
    public function getConfigurationTemplatesByProjectId( $project_id = null ) {
        if (empty($project_id)) return false;
        
        $condiguration_templates = $this->find('list', array(
            'joins' => array(
                 array('table' => 'configuration_templates_projects',
                    'alias' => 'ConfigurationTemplatesProjects',
                    'type' => 'INNER',
                    'conditions' => array(
                        'ConfigurationTemplatesProjects.project_id' => $project_id,
//                        'ConfigurationTemplatesProjects.restaurant_id = Restaurant.id'
                    )
                )
            )
//            'group' => 'Restaurant.id'
        ));
        
        return $condiguration_templates;
    }
}

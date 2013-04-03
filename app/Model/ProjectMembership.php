<?php
/**
 * Model for mapping Projects to Roles -- is like a HABTM relation
 * 
 * @see hasMany through (The Join Model)
 * http://book.cakephp.org/1.3/en/The-Manual/Developing-with-CakePHP/Models.html
 *
 * Developed against CakePHP 2.2.5 and PHP 5.4.x.
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
 * @since         ProjectRole ws introduced in Poundcake v2.6.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class ProjectMembership extends AppModel {

    /*
     * hasMany through (The Join Model) is a lot like HABTM except that you can
     * have additional attributes in the join table -- something that HABTM does
     * not support
     * 
     * Unfortunatley it's a poorly documented relationship.  Here are some references:
     * 
     * @see
     * http://book.cakephp.org/1.3/en/The-Manual/Developing-with-CakePHP/Models.html
     * 
     * http://bitfluxx.com/2008/05/27/cakephp-best-practices-rethinking-the-hasandbelongstomany-association.html
     * 
     */
    
    //public $belongsTo = array( 'User', 'Project' );
    public $belongsTo = array(
        'User' => array(
            'className'    => 'User',
            'foreignKey'   => 'user_id'
        ),
       'Project' => array(
            'className'    => 'Project',
            'foreignKey'   => 'project_id'
        )
    );
    
}

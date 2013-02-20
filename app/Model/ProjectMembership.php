<?php
/**
 * Model for mapping Projects to Roles -- is like a HABTM relation
 * 
 * @see hasMany through (The Join Model)
 * http://book.cakephp.org/1.3/en/The-Manual/Developing-with-CakePHP/Models.html
 *
 * Developed against CakePHP 2.2.5 and PHP 5.4.4.
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
    * @see hasMany through (The Join Model)
    * http://book.cakephp.org/1.3/en/The-Manual/Developing-with-CakePHP/Models.html
    */
    
    public $belongsTo = array( 'User', 'Project' );
    
}

<?php
/**
 * Model for change logs.
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
 * @since         ChangeLog precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class ChangeLog extends AppModel {
    
    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * Default sort order: by date, version (newest at top)
     */
    var $order = "ChangeLog.release_date DESC, ChangeLog.version DESC";
}

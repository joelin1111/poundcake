<?php
/**
 * Model for user.
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
 * @since         User precedes Poundcake v2.2.1
 * @license       XYZ License
 */

// following this example:
// http://book.cakephp.org/2.0/en/tutorials-and-examples/blog-auth-example/auth.html

App::uses('AuthComponent', 'Controller/Component');

class User extends AppModel {
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'Role',
    );
    
    /*
     * Relations
     * @see HABTM example: http://mrphp.com.au/code/working-habtm-form-data-cakephp
     */
    public $hasAndBelongsToMany = array('Project');
    
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'username' => array(
            'rule'    => '/^[a-z0-9_]{3,}$/i',
            'required' => true,
            'message' => 'Username is required, must be 3 characters or longer, and must be only letters, digits or underscores.'
        ),
        'pwd_current' => array(
            'rule'     => array('checkCurrentPassword'),
            'required' => false,
            'message' => 'Current password does not match.'
        ),
        'password' => array(
            //'rule'     => 'alphaNumeric',
            'rule'    => array('minLength', 5),
            //'required' => true,
            'message' => 'Password must be at least 5 characters.'
        ),
    );
    
    /*
     * Callback function to handle password hashing
     */
    public function beforeSave($options = array()) {
        if (isset($this->data[$this->alias]['password'])) {
            // passworld hashing is done here
            $this->data[$this->alias]['password'] = AuthComponent::password($this->data[$this->alias]['password']);
        }
        return true;
    }
   
    /*
     * Returns true or false if current password matches
     */
    public function checkCurrentPassword($check) {
        //print_r($check);
        $pwd_current = $check['pwd_current'];
        
        // return true if the hash of the password the user thinks is their current
        // password (from the change password form) versus what's in the database
        $this->id = AuthComponent::user('id');;
        $this->read();
        $db_pass = $this->data['User']['password'];
        //echo "Current (pw) in db: " . $db_pass."<BR>";
        //echo "Current (pw) in form: " . AuthComponent::password($pwd_current)."<BR>";
        
        return (AuthComponent::password($pwd_current) == $db_pass);
    }
}
?>
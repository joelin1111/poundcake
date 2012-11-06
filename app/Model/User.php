<?php

// following this example:
// http://book.cakephp.org/2.0/en/tutorials-and-examples/blog-auth-example/auth.html

App::uses('AuthComponent', 'Controller/Component');

class User extends AppModel {
    
    var $belongsTo = array(
        'Role',
    );
    
    public $hasAndBelongsToMany = array('Project');
    // HABTM example: http://mrphp.com.au/code/working-habtm-form-data-cakephp
    
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
    
    // changed parameters on beforeSave for PHP 5.4.x compatability
    // worked as-per this suggestion:
    // http://community.webfaction.com/questions/8397/cakephp-2-auth-failing-on-production-only
    public function beforeSave($options = array()) {
        //$this->data[$this->alias]['password'] = $this->data[$this->alias]['new_password_1'];
        //echo "Password " . $this->data[$this->alias]['password'];
        if (isset($this->data[$this->alias]['password'])) {
            // passworld hashing is done here
            $this->data[$this->alias]['password'] = AuthComponent::password($this->data[$this->alias]['password']);
        }
        return true;
    }
   
    public function checkCurrentPassword($check) {
        //print_r($check);
        $pwd_current = $check['pwd_current'];
        
        // return true if the hash of the password the user thinks is their current
        // password (from the change password form) versus what's in the database
        
        $this->id = AuthComponent::user('id');;
        $this->read();
        //echo "<pre>".print_r($this->data)."</pre>";
        $db_pass = $this->data['User']['password'];
        //echo "Current (pw) in db: " . $db_pass."<BR>";
        //echo "Current (pw) in form: " . AuthComponent::password($pwd_current)."<BR>";
        
        return (AuthComponent::password($pwd_current) == $db_pass);
    }

    /*
    public function checkPasswordsMatch($check) {
        print_r($check);
        echo "<pre> checkPasswordsMatch ".print_r($check)."</pre>";
        //echo "New 1 " . $check['password'];
        echo "New 2 " . $check['verify'];
        echo $user[$this->alias]['password'];
        die;
        return false;
        //return false;
        //return $check['password'] === $check['password_verify'];
        //echo "New 1 " . $this->data[$this->alias]['password'];
        //echo "New 2 " . $this->data[$this->alias]['password_verify'];
        //return $this->data[$this->alias]['password'] === $this->data[$this->alias]['password_verify'];
        // return AuthComponent::password($current_password['current_password']) == $user[$this->alias]['password'];
        //return false;
    }
    */
}
?>
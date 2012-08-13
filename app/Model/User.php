<?php

// following this example:
// http://book.cakephp.org/2.0/en/tutorials-and-examples/blog-auth-example/auth.html

App::uses('AuthComponent', 'Controller/Component');

class User extends AppModel {
    
    var $belongsTo = array(
        'Role',
    );
    
    // used on saving new user
    public $validate = array(
        'username' => array(
            'required' => array(
                'rule' => array('notEmpty'),
                'message' => 'Username is required'
            )
        ),
        /*
        'password' => array(
            'required' => array(
                //'rule' => array('notEmpty'),
                'rule'    => array('between', 5, 15),
                'message' => 'Passwords must be between 5 and 15 characters long.'
            )
        ),
        */
        /*
        'role' => array(
            'valid' => array(
                // staff or supportstaff?
                'rule' => array('inList', array('admin', 'staff')),
                'message' => 'Please enter a valid role',
                'allowEmpty' => false
            )
        )
        */
        'current_password' => array(
            'required' => array(
                //'rule' => array('notEmpty'),
                'rule'    => 'checkCurrentPassword',
                'message' => 'Current password does not match.'
            )
        ),
        'password' => array(
            'required' => array(
                //'rule' => array('notEmpty'),
                'rule'    => array('between', 1, 15),
                'message' => 'Passwords must be between 5 and 15 characters long.'
            )
        ),
        'password_verify' => array(
            'required' => array(
                //'rule' => array('notEmpty'),
                'rule'    => 'checkPasswordsMatch',
                'message' => 'New passwords do not match.'
            )
        )
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
    
    function checkCurrentPassword($current_password) {
        $user = $this->find('first', array('id' => $this->id));
        return AuthComponent::password($current_password['current_password']) == $user[$this->alias]['password'];
    }
    
    function checkPasswordsMatch() {
        //echo "New 1 " . $this->data[$this->alias]['password'];
        //echo "New 2 " . $this->data[$this->alias]['password_verify'];
        return $this->data[$this->alias]['password'] === $this->data[$this->alias]['password_verify'];
        // return AuthComponent::password($current_password['current_password']) == $user[$this->alias]['password'];
        //return false;
    }
}
?>
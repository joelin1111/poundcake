<BR>
<?php
   
    // display any messages here
    // these can be customized
    // http://book.cakephp.org/1.3/view/1252/Displaying-Auth-Error-Messages
    echo $this->Session->flash('auth');
    echo $this->Form->create('User');

    echo __('Please enter your username and password');
    echo $this->Form->input('username');
    echo $this->Form->input('password');
    
    echo $this->Session->flash(); // show flash message
    
    echo $this->Form->end(__('Login'));
?>
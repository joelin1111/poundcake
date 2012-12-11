<BR>
<?php
    echo $this->Session->flash('auth');
    echo $this->Form->create('User');
    echo '<p>Please enter your username and password.</p>';
    echo '<p>'.$this->Form->input('username',array('class' => 'search-query')).'</p>';
    echo '<p>'.$this->Form->input('password',array('class' => 'search-query')).'</p>';    
    //echo $this->Form->end('Login',array('class'=>'btn'));
    echo $this->Form->submit('Login', array('div' => false,'class'=>'btn'));
    echo $this->Form->end(); 
?>
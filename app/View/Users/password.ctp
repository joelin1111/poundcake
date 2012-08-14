<div class="row">
<div class="span3">
    <ul>
        <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>Update Password</h2>
    <?php
        # http://stackoverflow.com/questions/2868665/is-there-a-better-way-to-change-user-password-in-cakephp-using-auth
        echo $this->Form->create('User');
        echo $this->Form->input('id');

        //echo $this->Form->input('pwd');
        //echo $this->Form->input('pwd_repeat');
        echo $this->Form->input('pwd_current', array('label' => 'Current password', 'type'=>'password', 'value'=>'', 'autocomplete'=>'off'));
        echo $this->Form->input('password', array('label' => 'New password','type'=>'password', 'value'=>'', 'autocomplete'=>'off'));
        
        echo $this->Session->flash(); // show flash message
    
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

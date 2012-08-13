<div class="row">
<div class="span3">
        <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</li>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>Password</h2>
    <?php
        echo $this->Form->create('User');
        echo $this->Session->flash();
        //echo $user['username'];
        // echo $this->Form->password or input
        echo $this->Form->input('current_password',array('label' => 'Current password','type' => 'password'));
        echo $this->Form->input('password',array('label' => 'New password','type' => 'password'));
        echo $this->Form->input('password_verify',array('label' => 'Confirm password','type' => 'password'));
    ?>
<?php echo $this->Form->end(__('Submit')); ?>

</div> <!-- /.span9 -->
</div> <!-- /.row -->
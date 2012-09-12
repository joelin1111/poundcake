<div class="row">
<div class="span3">
    &nbsp;
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

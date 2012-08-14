<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('User'); ?>
    <h2>Add User</h2>
    <?php
        echo $this->Form->input('username');
        echo $this->Form->input('password');
        echo $this->Form->input('User.role_id', array('type'=>'select','options' => $roles));
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->


<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('User.id')), null, __('Are you sure you want to delete user %s?', $this->Form->value('User.username'))); ?></li>
        <li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('User'); ?>
    <h2>Edit User</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('username');
        echo $this->Form->input('password');
        echo $this->Form->input('User.role_id', array('type'=>'select','options' => $roles));
        echo $this->Form->input('Project.Project',array('label'=>'Project (Feature in Development)'));
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
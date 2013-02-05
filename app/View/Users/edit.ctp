
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Users', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('User'); ?>
    <h2>Edit User: <?php echo $username ?></h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('password');
        /*
        echo $this->Form->input('User.role_id', array('type'=>'select','options' => $roles));
        echo $this->Form->input('Project.Project',array('label'=>'Project (Note: Experimental Feature)'));
        echo $this->Form->input('Project.Project',array(
            'label' => __('Projects (Note: Experimental Feature)',true),
            'type' => 'select',
            'multiple' => 'checkbox',
            'options' => $projects,
            'selected' => $this->Html->value('Project.Project'),
        ));
        */
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
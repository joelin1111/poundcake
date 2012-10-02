
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Users'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('User'); ?>
    <h2>Permissions</h2>
    <?php
        //echo $this->Session->flash();
        echo $this->Form->input('id');
        echo "Username:  ".$this->Form->value('username'); //,array('disabled' => true));
        echo $this->Form->input('User.role_id', array('type'=>'select','options' => $roles));
        //echo $this->Form->input('Project.Project',array('label'=>'Project (Note: Experimental Feature)'));
        echo $this->Form->input('Project.Project',array(
            'label' => __('Projects (Note: Experimental Feature)',true),
            'type' => 'select',
            'multiple' => 'checkbox',
            'options' => $projects,
            'selected' => $this->Html->value('Project.Project'),
        ));

        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

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
    <h2>Permissions</h2>
    <?php
        echo $this->Form->input('id');
        echo "Username:  ".$this->Form->value('username'); //,array('disabled' => true));
//        echo $this->Form->input('User.role_id', array('type'=>'select','options' => $roles));
//        echo $this->Form->input('Project',array(
//            'label' => 'Projects',
//            'type' => 'select',
//            'multiple' => 'checkbox',
//            'options' => $projects,
//            'selected' => $this->Html->value('Project.Project'),
//        ));

        echo $this->Form->input( 'Project.project_id', array( 'multiple'=>'checkbox', 'label' => 'Projects' ));
        echo $this->Form->input('Project.user_id',array( 'type' => 'hidden', 'value' => $user['id']));
        //echo $this->Form->input( 'Role', array( 'multiple'=>'checkbox' ));
        echo $this->Form->submit( 'Save', array( 'div' => false,'class'=>'btn btn-primary' ));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
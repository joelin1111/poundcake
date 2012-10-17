<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Contact');
    //echo $this->element('sql_dump'); ?>
    <h2>Add Contact</h2>
    <?php
        echo $this->Form->input('first_name');
        echo $this->Form->input('last_name');
        echo $this->Form->input('mobile');
        echo $this->Form->input('skype');
        echo $this->Form->input('email');
        echo $this->Form->input('priority');
        echo $this->Form->input('tower_owner_id', array('type'=>'select','options' => $towerowners,'empty' => true));
        echo $this->Form->input('install_team_id', array('type'=>'select','options' => $installteams,'empty' => true));
        echo $this->Form->input('contact_type_id', array('type'=>'select','options' => $contacttypes));
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
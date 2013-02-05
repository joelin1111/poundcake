<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Contacts', array('action' => 'index')); ?>
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
        echo $this->Form->input('title');
        echo $this->Form->input('phone');
        echo $this->Form->input('skype');
        echo $this->Form->input('email');
        echo $this->Form->input('priority');
        echo $this->Form->input('organization_id', array('type'=>'select','options' => $organizations,'empty' => true));
        echo $this->Form->input('install_team_id', array('type'=>'select','options' => $installteams,'empty' => true));
        echo $this->Form->input('contact_type_id', array('type'=>'select','options' => $contacttypes));
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
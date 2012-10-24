<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Contact.id')), null, __('Are you sure you want to delete contact %s?', $this->Form->value('Contact.first_name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Contact'); ?>
    <h2>Edit Contact</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('first_name');
        echo $this->Form->input('last_name');
        echo $this->Form->input('title');
        echo $this->Form->input('phone');
        echo $this->Form->input('skype');
        echo $this->Form->input('email');
        echo $this->Form->input('priority');
        echo $this->Form->input('organization_id', array('type'=>'select','options' => $organizations,'empty' => true));
        echo $this->Form->input('install_team_id', array('type'=>'select','options' => $installteams,'empty' => true));
        echo $this->Form->input('contact_type_id', array('type'=>'select','label' => 'Contact Type','options' => $contacttypes));
        
        
        
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

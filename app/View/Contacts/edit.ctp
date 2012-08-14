<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Contact.id')), null, __('Are you sure you want to delete Contact %s?', $this->Form->value('Contact.first_name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Contact'); ?>
    <h2>Edit Contact</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('first_name');
        echo $this->Form->input('last_name');
        echo $this->Form->input('mobile');
        echo $this->Form->input('skype');
        echo $this->Form->input('email');
        echo $this->Form->input('district_id', array('empty' => '(No District)'));
        echo $this->Form->input('school_id', array('empty' => '(No School)'));
        echo $this->Form->input('trc_id', array('empty' => '(No TC/TRC)'));
 
        //echo $this->Form->input('school_code_site_name');
        echo $this->Form->input('school_code');
        /*echo $this->Form->input('school_code_site_name', array(
            'options' => $schools,
            'empty' => '(choose one)'
        ));*/
        //print_r($schools);
        
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

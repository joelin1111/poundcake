<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
    # jquery UI - for the date picker
    echo $this->Html->script('jquery-ui-1.8.21.custom.min');
    # other date picker stuff is in poundcake and datepicker js files
    echo $this->Html->script('poundcake');
    echo $this->Html->script('datepicker');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Changes'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('ChangeLog');
    //echo $this->element('sql_dump'); ?>
    <h2>Add Contact</h2>
    <?php
        echo $this->Form->input('version');
        echo $this->Form->input('release_date', 
            array(
               'class'=>'datepicker', 
               'type'=>'text'
            )
        );
        echo $this->Form->input('description');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
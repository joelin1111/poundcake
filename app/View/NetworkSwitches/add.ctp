<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('snmp_override');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Switches', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkSwitch'); ?>
    <h2>Add Switch</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('serial');
        echo $this->Form->input('switch_type_id', array('type'=>'select','options' => $switchtypes));
        echo $this->Form->input('site_id', array('type'=>'select','options' => $sites));
        echo $this->element('Common/snmp_override');  // include fiels for SNMP override        
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



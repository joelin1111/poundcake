<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Switches'), array('action' => 'index')); ?>
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
        //echo $this->Form->input('num_ports', array('type'=>'select','label'=>'Ports','options' => $num_ports));
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



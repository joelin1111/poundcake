<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('NetworkSwitch.id')), null, __('Are you sure you want to delete switch %s?', $this->Form->value('NetworkSwitch.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List  Switches'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkSwitch'); ?>
    <h2>Edit Switch</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('serial');
        echo $this->Form->input('switch_type_id', array('type'=>'select','options' => $switchtypes));
    ?>
    </fieldset>
    <?php echo $this->Form->end('Save'); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

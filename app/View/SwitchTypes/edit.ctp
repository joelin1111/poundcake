<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('SwitchType.id')), null, __('Are you sure you want to delete switch type %s?', $this->Form->value('SwitchType.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Switch Types'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('SwitchType'); ?>
    <h2>Edit Switch Type</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('ports');
        echo $this->Form->input('manufacturer');
        echo $this->Form->input('model');
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

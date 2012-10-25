<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('BuildItem.id')), null, __('Are you sure you want to delete item %s?', $this->Form->value('BuildItem.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Build Items'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('BuildItem'); ?>
    <h2>Edit Build Item</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('quantity');
        echo $this->Form->input('build_item_type_id', array('type'=>'select','options' => $builditemtypes)); //,'empty' => true));
        echo $this->Form->end('Save');
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

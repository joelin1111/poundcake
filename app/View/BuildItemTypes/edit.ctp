<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('BuildItemType.id')), null, __('Are you sure you want to delete build item type %s?', $this->Form->value('BuildItemType.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Build Item Types'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('BuildItemType'); ?>
    <h2>Edit Build Item Type</h2>
    <?php
        echo $this->Form->input('name');
        
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

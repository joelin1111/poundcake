<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Zone.id')), null, __('Are you sure you want to delete zone %s?', $this->Form->value('Zone.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Zones'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Zone'); ?>
    <h2>Edit Zone</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
    ?>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Catchment.id')), null, __('Are you sure you want to delete Catchment %s?', $this->Form->value('Catchment.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Catchments'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Catchment'); ?>
    <h2>Edit Catchment</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

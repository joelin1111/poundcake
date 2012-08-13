<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Area.id')), null, __('Are you sure you want to delete Area %s?', $this->Form->value('Area.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Areas'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Area');
    //echo $this->element('sql_dump'); ?>
    <h2>Edit Area</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
            echo $this->Form->input('catchment_id');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

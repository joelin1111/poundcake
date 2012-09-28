<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Project.id')), null, __('Are you sure you want to delete project %s?', $this->Form->value('Project.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Projects'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Project'); ?>
    <h2>Edit Project</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
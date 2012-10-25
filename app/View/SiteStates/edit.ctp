<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('SiteState.id')), null, __('Are you sure you want to delete site state %s?', $this->Form->value('SiteState.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Site States'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('SiteState', array('type' => 'file')); ?>
    <h2>Edit Installation State</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('sequence');
        echo $this->Form->file('File');
        echo $this->Form->end('Save');
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
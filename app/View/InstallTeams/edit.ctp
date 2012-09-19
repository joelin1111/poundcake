<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('InstallTeam.id')), null, __('Are you sure you want to delete install team %s?', $this->Form->value('InstallTeam.first_name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Install Teams'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('InstallTeam'); ?>
    <h2>Edit InstallTeam</h2>
    <?php
        echo $this->Form->input('name');;
        
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

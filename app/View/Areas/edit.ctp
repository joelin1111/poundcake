<div class="areas form">
<?php echo $this->Form->create('Area'); ?>
	<fieldset>
		<legend><?php echo __('Edit Area'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('name');
		echo $this->Form->input('catchment_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Area.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Area.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Areas'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Catchments'), array('controller' => 'catchments', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Catchment'), array('controller' => 'catchments', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Districts'), array('controller' => 'districts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Districts'), array('controller' => 'districts', 'action' => 'add')); ?> </li>
	</ul>
</div>

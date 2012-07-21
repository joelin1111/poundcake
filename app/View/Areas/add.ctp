<div class="areas form">
<?php echo $this->Form->create('Area');
//echo $this->element('sql_dump'); ?>
	<fieldset>
		<legend><?php echo __('Add Area'); ?></legend>
	<?php
		echo $this->Form->input('name');
		echo $this->Form->input('catchment_id');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Areas'), array('action' => 'index')); ?></li>
		<li><?php echo $this->Html->link(__('List Catchments'), array('controller' => 'catchments', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Catchment'), array('controller' => 'catchments', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Districts'), array('controller' => 'districts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Districts'), array('controller' => 'districts', 'action' => 'add')); ?> </li>
	</ul>
</div>

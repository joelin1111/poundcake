<div class="catchments form">
<?php echo $this->Form->create('Catchment'); ?>
	<fieldset>
		<legend><?php echo __('Add Catchment'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Catchments'), array('action' => 'index')); ?></li>
	</ul>
</div>

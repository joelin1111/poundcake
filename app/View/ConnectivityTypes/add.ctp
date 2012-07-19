<div class="connectivityTypes form">
<?php echo $this->Form->create('ConnectivityType'); ?>
	<fieldset>
		<legend><?php echo __('Add Connectivity Type'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Connectivity Types'), array('action' => 'index')); ?></li>
	</ul>
</div>

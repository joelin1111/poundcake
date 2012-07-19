<div class="installationStates form">
<?php echo $this->Form->create('InstallationState'); ?>
	<fieldset>
		<legend><?php echo __('Add Installation State'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Installation States'), array('action' => 'index')); ?></li>
	</ul>
</div>

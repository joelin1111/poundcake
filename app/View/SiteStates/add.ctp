<div class="siteStates form">
<?php echo $this->Form->create('SiteState'); ?>
	<fieldset>
		<legend><?php echo __('Add Site State'); ?></legend>
	<?php
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Site States'), array('action' => 'index')); ?></li>
	</ul>
</div>

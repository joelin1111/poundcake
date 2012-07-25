<div class="trcs form">
<?php echo $this->Form->create('Trc'); ?>
	<fieldset>
		<legend><?php echo __('Edit Trc'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('name');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Trc.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Trc.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Trcs'), array('action' => 'index')); ?></li>
	</ul>
</div>

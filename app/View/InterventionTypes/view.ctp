<div class="interventionTypes view">
<h2><?php  echo __('Intervention Type'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($interventionType['InterventionType']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($interventionType['InterventionType']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Intervention Type'), array('action' => 'edit', $interventionType['InterventionType']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Intervention Type'), array('action' => 'delete', $interventionType['InterventionType']['id']), null, __('Are you sure you want to delete # %s?', $interventionType['InterventionType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Intervention Types'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Intervention Type'), array('action' => 'add')); ?> </li>
	</ul>
</div>

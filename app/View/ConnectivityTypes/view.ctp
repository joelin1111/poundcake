<div class="connectivityTypes view">
<h2><?php  echo __('Connectivity Type'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($connectivityType['ConnectivityType']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($connectivityType['ConnectivityType']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Connectivity Type'), array('action' => 'edit', $connectivityType['ConnectivityType']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Connectivity Type'), array('action' => 'delete', $connectivityType['ConnectivityType']['id']), null, __('Are you sure you want to delete # %s?', $connectivityType['ConnectivityType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Connectivity Types'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Connectivity Type'), array('action' => 'add')); ?> </li>
	</ul>
</div>

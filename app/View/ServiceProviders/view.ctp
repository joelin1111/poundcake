<div class="serviceProviders view">
<h2><?php  echo __('Service Provider'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($serviceProvider['ServiceProvider']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($serviceProvider['ServiceProvider']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Service Provider'), array('action' => 'edit', $serviceProvider['ServiceProvider']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Service Provider'), array('action' => 'delete', $serviceProvider['ServiceProvider']['id']), null, __('Are you sure you want to delete # %s?', $serviceProvider['ServiceProvider']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Service Providers'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Service Provider'), array('action' => 'add')); ?> </li>
	</ul>
</div>

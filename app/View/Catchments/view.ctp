<div class="catchments view">
<h2><?php  echo __('Catchment'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($catchment['Catchment']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($catchment['Catchment']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Catchment'), array('action' => 'edit', $catchment['Catchment']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Catchment'), array('action' => 'delete', $catchment['Catchment']['id']), null, __('Are you sure you want to delete # %s?', $catchment['Catchment']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Catchments'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Catchment'), array('action' => 'add')); ?> </li>
	</ul>
</div>

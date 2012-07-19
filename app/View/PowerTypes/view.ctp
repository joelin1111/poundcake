<div class="powerTypes view">
<h2><?php  echo __('Power Type'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($powerType['PowerType']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($powerType['PowerType']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Power Type'), array('action' => 'edit', $powerType['PowerType']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Power Type'), array('action' => 'delete', $powerType['PowerType']['id']), null, __('Are you sure you want to delete # %s?', $powerType['PowerType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Power Types'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Power Type'), array('action' => 'add')); ?> </li>
	</ul>
</div>

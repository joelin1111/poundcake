<div class="roadTypes view">
<h2><?php  echo __('Road Type'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($roadType['RoadType']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($roadType['RoadType']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Road Type'), array('action' => 'edit', $roadType['RoadType']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Road Type'), array('action' => 'delete', $roadType['RoadType']['id']), null, __('Are you sure you want to delete # %s?', $roadType['RoadType']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Road Types'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Road Type'), array('action' => 'add')); ?> </li>
	</ul>
</div>

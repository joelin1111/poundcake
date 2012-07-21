<div class="areas view">
<h2><?php  echo __('Area'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($area['Area']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($area['Area']['name']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Catchment'); ?></dt>
		<dd>
			<?php echo $this->Html->link($area['Catchment']['name'], array('controller' => 'catchments', 'action' => 'view', $area['Catchment']['id'])); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Area'), array('action' => 'edit', $area['Area']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Area'), array('action' => 'delete', $area['Area']['id']), null, __('Are you sure you want to delete # %s?', $area['Area']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Areas'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Area'), array('action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Catchments'), array('controller' => 'catchments', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Catchment'), array('controller' => 'catchments', 'action' => 'add')); ?> </li>
		<li><?php echo $this->Html->link(__('List Districts'), array('controller' => 'districts', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Districts'), array('controller' => 'districts', 'action' => 'add')); ?> </li>
	</ul>
</div>
<div class="related">
	<h3><?php echo __('Related Districts'); ?></h3>
	<?php if (!empty($area['Districts'])): ?>
	<table cellpadding = "0" cellspacing = "0">
	<tr>
		<th><?php echo __('Id'); ?></th>
		<th><?php echo __('Name'); ?></th>
		<th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php
		$i = 0;
		foreach ($area['Districts'] as $districts): ?>
		<tr>
			<td><?php echo $districts['id']; ?></td>
			<td><?php echo $districts['name']; ?></td>
			<td class="actions">
				<?php echo $this->Html->link(__('View'), array('controller' => 'districts', 'action' => 'view', $districts['id'])); ?>
				<?php echo $this->Html->link(__('Edit'), array('controller' => 'districts', 'action' => 'edit', $districts['id'])); ?>
				<?php echo $this->Form->postLink(__('Delete'), array('controller' => 'districts', 'action' => 'delete', $districts['id']), null, __('Are you sure you want to delete # %s?', $districts['id'])); ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

	<div class="actions">
		<ul>
			<li><?php echo $this->Html->link(__('New Districts'), array('controller' => 'districts', 'action' => 'add')); ?> </li>
		</ul>
	</div>
</div>

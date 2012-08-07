    <div class="maskAlt">
    <div class="headerAlt">
    <h1>TC/TRC</h1>
    </div>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id'); ?></th>
			<th><?php echo $this->Paginator->sort('name'); ?></th>
			<th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php
	foreach ($trcs as $trc): ?>
	<tr>
		<td><?php echo h($trc['Trc']['id']); ?>&nbsp;</td>
		<td><?php echo h($trc['Trc']['name']); ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View'), array('action' => 'view', $trc['Trc']['id'])); ?>
			<?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $trc['Trc']['id'])); ?>
			<?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $trc['Trc']['id']), null, __('Are you sure you want to delete # %s?', $trc['Trc']['id'])); ?>
		</td>
	</tr>
    <?php endforeach; ?>
        
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
	));
	?>	</p>

	<div class="paging">
	<?php
		echo $this->Paginator->prev('< ' . __('previous '), array(), null, array('class' => 'prev disabled'));
		echo $this->Paginator->numbers(array('separator' => ' '));
		echo $this->Paginator->next(__(' next') . ' >', array(), null, array('class' => 'next disabled'));
	?>
	</div>


	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Trc'), array('action' => 'add')); ?></li>
	</ul>
</div>
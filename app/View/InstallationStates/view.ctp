<div class="installationStates view">
<h2><?php  echo __('Installation State'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($installationState['InstallationState']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($installationState['InstallationState']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Installation State'), array('action' => 'edit', $installationState['InstallationState']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Installation State'), array('action' => 'delete', $installationState['InstallationState']['id']), null, __('Are you sure you want to delete # %s?', $installationState['InstallationState']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Installation States'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Installation State'), array('action' => 'add')); ?> </li>
	</ul>
</div>

<div class="siteStates view">
<h2><?php  echo __('Site State'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($siteState['SiteState']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($siteState['SiteState']['name']); ?>
			&nbsp;
		</dd>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Site State'), array('action' => 'edit', $siteState['SiteState']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Site State'), array('action' => 'delete', $siteState['SiteState']['id']), null, __('Are you sure you want to delete # %s?', $siteState['SiteState']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Site States'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Site State'), array('action' => 'add')); ?> </li>
	</ul>
</div>

<div class="maskAlt">
    <div class="headerAlt">
        <h1>Contacts</h1>
    </div>
<div class="bodyAlt">
<BR><BR>
<fieldset>
    <legend><?php echo __('Search'); ?></legend>  
    <?php
        echo $this->Form->create(
                'Contact',
                //array('url' => array_merge(array('action' => 'index'), $this->params['pass']))
                // calls the search function on the SchoolsController
                array('action'=>'search')
        );
        echo $this->Form->input('first_name');
        echo $this->Form->input('last_name');
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo $this->Form->end();    
    ?>
</fieldset>
<BR>
	<table>
	<tr>
            <th><?php echo $this->Paginator->sort('first_name'); ?></th>
            <th><?php echo $this->Paginator->sort('last_name'); ?></th>
            <th><?php echo $this->Paginator->sort('mobile'); ?></th>
            <th><?php echo $this->Paginator->sort('skype'); ?></th>
            <th><?php echo $this->Paginator->sort('email'); ?></th>
            <th class="actions"><?php echo __('Actions'); ?></th>
	</tr>
	<?php
	foreach ($contacts as $contact): ?>
	<tr>
            <td><?php echo h($contact['Contact']['first_name']); ?>&nbsp;</td>
            <td><?php echo h($contact['Contact']['last_name']); ?>&nbsp;</td>
            <td><?php echo h($contact['Contact']['mobile']); ?>&nbsp;</td>
            <td><?php echo h($contact['Contact']['skype']); ?>&nbsp;</td>
            <td><?php echo h($contact['Contact']['email']); ?>&nbsp;</td>
            <td class="actions">
                    <?php echo $this->Html->link(__('View'), array('action' => 'view', $contact['Contact']['id'])); ?>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $contact['Contact']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $contact['Contact']['id']), null, __('Are you sure you want to delete # %s?', $contact['Contact']['id'])); ?>
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
        </div>
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Contact'), array('action' => 'add')); ?></li>
	</ul>
</div>

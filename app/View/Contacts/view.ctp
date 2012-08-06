<div class="contacts view">
<h2><?php  echo __('Contact'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('First Name'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['first_name']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Last Name'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['last_name']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Mobile'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['mobile']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Skype'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['skype']); ?>
			&nbsp;
		</dd>
                <dt><?php echo __('TC/TRC'); ?></dt>
                <?php
                echo "<dd>";
                if (empty($contact['Trc']['name'])) {
                    echo "None";
                } else {
                    echo $this->Html->link(__($contact['Trc']['name']), array(
                        'controller' => 'trcs',
                        'action' => 'view',
                        $contact['Trc']['id']));
                    
                }
                echo "</dd>";
                ?>
                <dt><?php echo __('School'); ?></dt>
                <?php
                echo "<dd>";
                if (empty($contact['School']['primary_school'])) {
                    echo "None";
                } else {
                    echo $this->Html->link(__($contact['School']['primary_school']), array(
                        'controller' => 'schools',
                        'action' => 'view',
                        $contact['School']['id']));
                    
                }
                echo "</dd>";
                ?>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Contact'), array('action' => 'edit', $contact['Contact']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Contact'), array('action' => 'delete', $contact['Contact']['id']), null, __('Are you sure you want to delete # %s?', $contact['Contact']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Contacts'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Contact'), array('action' => 'add')); ?> </li>
	</ul>
</div>

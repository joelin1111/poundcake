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
                
                <dt><?php echo __('Email'); ?></dt>
		<dd>
			<?php echo h($contact['Contact']['email']); ?>
			&nbsp;
		</dd>
                
                <dt><?php echo __('District (Optional)'); ?></dt>
                <?php
                echo "<dd>";
                if (empty($contact['District']['name'])) {
                    echo "None";
                } else {
                    echo $contact['District']['name'];
                    /* we don't have a view for Districts
                    echo $this->Html->link(__($contact['District']['name']), array(
                        'controller' => 'trcs',
                        'action' => 'view',
                        $contact['District']['id']));
                    */
                }
                echo "</dd>";
                ?>
                
                <dt><?php echo __('School (Optional)'); ?></dt>
                <?php
                echo "<dd>";
                if (empty($contact['School']['site_name'])) {
                    echo "None";
                } else {
                    echo $this->Html->link(__($contact['School']['site_name']), array(
                        'controller' => 'schools',
                        'action' => 'view',
                        $contact['School']['id']));
                    
                }
                echo "</dd>";
                ?>
                
                <dt><?php echo __('TC/TRC (Optional)'); ?></dt>
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

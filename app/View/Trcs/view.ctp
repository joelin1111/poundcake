<div class="trcs view">
<h2><?php  echo __('Trc'); ?></h2>
	<dl>
		<dt><?php echo __('Id'); ?></dt>
		<dd>
			<?php echo h($trc['Trc']['id']); ?>
			&nbsp;
		</dd>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($trc['Trc']['name']); ?>
			&nbsp;
		</dd>
                <dt><?php echo __('Contact(s)'); ?></dt>
                <?php
                
                //echo "<pre>".print_r($trc['Contacts'])."</pre>";
                foreach ($trc['Contacts'] as $contact) { 
                    echo "<dd>".$contact['first_name']." ".$contact['last_name']."</dd>";
                }
                ?>
                
                <dt><?php echo __('School(s)'); ?></dt>
                <?php
                
                //echo "<pre>".print_r($trc['Contacts'])."</pre>";
                foreach ($trc['Schools'] as $school) {
                    echo "<dd>";
                    echo $this->Html->link(__($school['primary_school']), array(
                        'controller' => 'schools',
                        'action' => 'view',
                        $school['id']));
                    echo "</dd>";
                }
                ?>
	</dl>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit Trc'), array('action' => 'edit', $trc['Trc']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete Trc'), array('action' => 'delete', $trc['Trc']['id']), null, __('Are you sure you want to delete # %s?', $trc['Trc']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List Trcs'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Trc'), array('action' => 'add')); ?> </li>
	</ul>
</div>

<div class="trcs view">
<h2><?php  echo __('Trc'); ?></h2>
	<dl>
		<dt><?php echo __('Name'); ?></dt>
		<dd>
			<?php echo h($trc['Trc']['name']); ?>
			&nbsp;
		</dd>
                <dt><?php echo __('Contact(s)'); ?></dt>
                <?php
                //echo "<pre>".print_r($trc['Contacts'])."</pre>";
                //echo "<pre> Count: ".count($trc['Contacts'])."</pre>";
                echo "<dd>";
                $c = count($trc['Contacts']);
                if ($c == 0) {
                    echo "None";
                } else {
                    foreach ($trc['Contacts'] as $contact) { 
                        echo $contact['first_name']." ".$contact['last_name'];
                    }
                }
                echo "</dd>";
                ?>
                
                <dt><?php echo __('School(s)'); ?></dt>
                <?php
                echo "<dd>";
                $c = count($trc['Schools']);
                if ($c == 0) {
                    echo "None";
                } else {
                    foreach ($trc['Schools'] as $school) {
                        echo $this->Html->link(__($school['primary_school']), array(
                            'controller' => 'schools',
                            'action' => 'view',
                            $school['id']));
                    }
                }
                echo "</dd>";
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

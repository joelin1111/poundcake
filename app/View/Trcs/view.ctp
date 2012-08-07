
    <div class="maskAlt">
    <div class="headerAlt">
    <h1>TC/TRC</h1>
    </div>
        <P><B>Name</B></P>
            <UL>
                <LI>
                    <?php echo h($trc['Trc']['name']); ?>
                </LI>
            </UL>
        
        <P><B>Contacts</B></P>
        <UL>
            <?php
                //echo "<pre>".print_r($trc['Contacts'])."</pre>";
                //echo "<pre> Count: ".count($trc['Contacts'])."</pre>";
                echo "<LI>";
                $c = count($trc['Contacts']);
                if ($c == 0) {
                    echo "None";
                } else {
                    foreach ($trc['Contacts'] as $contact) { 
                        echo $contact['first_name']." ".$contact['last_name'];
                    }
                }
                echo "</LI>";
                ?>
        </UL>
        
        <P><B>Schools</B></P>
        <UL>
            <?php
                //echo "<pre>".print_r($trc['Contacts'])."</pre>";
                //echo "<pre> Count: ".count($trc['Contacts'])."</pre>";
                echo "<LI>";
                $c = count($trc['Schools']);
                if ($c == 0) {
                    echo "None";
                } else {
                    foreach ($trc['Schools'] as $school) {
                        echo $this->Html->link(__($school['site_name']), array(
                            'controller' => 'schools',
                            'action' => 'view',
                            $school['id']));
                    }
                }
                echo "</LI>";
                ?>
        </UL>
  
	<h3><?php echo __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('Edit TC/TRC'), array('action' => 'edit', $trc['Trc']['id'])); ?> </li>
		<li><?php echo $this->Form->postLink(__('Delete TC/TRC'), array('action' => 'delete', $trc['Trc']['id']), null, __('Are you sure you want to delete # %s?', $trc['Trc']['id'])); ?> </li>
		<li><?php echo $this->Html->link(__('List TCs/TRCs'), array('action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New TC/TRC'), array('action' => 'add')); ?> </li>
	</ul>
</div>

<li class="dropdown" id="menu1">
<a class="dropdown-toggle" data-toggle="dropdown" href="#menu1">Maps<b class="caret"></b></a>
    <ul class="dropdown-menu">
        <li><?php echo $this->Html->link('Overview', array('controller' => 'sites', 'action' => 'overview')); ?> </li>
        <li><?php echo $this->Html->link('Topology', array('controller' => 'sites', 'action' => 'topology')); ?> </li>
        <!--
        <li class="divider"></li>
        <li><?php //echo $this->Html->link('Old Overview', array('controller' => 'sites', 'action' => 'overview_old')); ?> </li>
        <li><?php //echo $this->Html->link('Old Topology', array('controller' => 'sites', 'action' => 'topology_old')); ?> </li>
        -->
    </ul>
</li>
<li> <?php echo $this->Html->link('Sites', array('controller' => 'sites', 'action' => 'index')); ?> </li>
<li> <?php echo $this->Html->link('Contacts', array('controller' => 'contacts', 'action' => 'index')); ?> </li>
<li> <?php echo $this->Html->link('Radios', array('controller' => 'networkRadios', 'action' => 'index')); ?> </li>
<li> <?php echo $this->Html->link('Routers', array('controller' => 'networkRouters', 'action' => 'index')); ?> </li>
<li> <?php echo $this->Html->link('Switches', array('controller' => 'networkSwitches', 'action' => 'index')); ?> </li>                    
<?php
    // this doesn't really belong here, should probably serve up a different
    // view for admins
    if ( $this->Session->read('role') === 'admin') {
        echo "<LI>".$this->Html->link('Admin', array('controller' => 'admin', 'action' => 'setup'))."</LI>";
    }
?>
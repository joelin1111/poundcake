<?php

?>
<div class="row">
<div class="span3">
<!--    <H3>Actions</H3>-->
<!--    <ul>
        <li></li>
    </ul>-->
&nbsp;
</div><!-- /.span3 .sb-fixed -->
<div class="span9">
<H2>Site Administration</H2>
    <div class="span4">
        <H3>Projects, Groups, Users</H3>
        <UL>
            <li><?php echo $this->Html->link('Projects', '/projects/index'); ?></li>
            <li><?php echo $this->Html->link('Roles', '/roles/index'); ?></li>
            <li><?php echo $this->Html->link('Users', '/users/index'); ?></li>
            
        </UL>

        <H3>Sites/Towers</H3>
        <UL>
            <li><?php echo $this->Html->link('Power Types', '/powerTypes/index'); ?></li>
            <li><?php echo $this->Html->link('Tower Equipment', '/towerEquipment/index'); ?></li>
            <li><?php echo $this->Html->link('Tower Members', '/towerMembers/index'); ?></li>    
            <li><?php echo $this->Html->link('Tower Mounts', '/towerMounts/index'); ?></li>
            <li><?php echo $this->Html->link('Tower Owners', '/towerOwners/index'); ?></li>    
            <li><?php echo $this->Html->link('Tower Types', '/towerTypes/index'); ?></li>
        </UL>
    </div> <!-- /.span4 -->

    <div class="span4">
    <H3>Radios</H3>
        <UL>
            <li><?php echo $this->Html->link('Antenna Types', '/antennaTypes/index'); ?></li>
            <li><?php echo $this->Html->link('Radio Modes', '/radioModes/index'); ?> </li>
            <li><?php echo $this->Html->link('Radio Types', '/radioTypes/index'); ?> </li>
        </UL>

    <H3>Other</H3>
    <UL>    
        <li><?php echo $this->Html->link('Build Items', '/buildItems/index'); ?></li>
        <li><?php echo $this->Html->link('Contact Types', '/contactTypes/index'); ?></li>
        <li><?php echo $this->Html->link('Install Teams', '/installTeams/index'); ?></li> 
        <li><?php echo $this->Html->link('Switch Types', '/switchTypes/index'); ?> </li>      
        <li><?php echo $this->Html->link('Site States', '/siteStates/index'); ?></li>
        <li><?php echo $this->Html->link('Zones', '/zones/index'); ?></li>
    </UL>
    </div> <!-- /.span4 -->
</div> <!-- /.span9 -->
</div> <!-- /.row -->
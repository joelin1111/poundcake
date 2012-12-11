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
    <H2>Setup</H2>
    <div class="span4">
        <H3>Projects, Groups, Users</H3>
        <UL>
            <li><?php echo $this->Html->link('Projects', '/admin/projects/index'); ?></li>
            <li><?php echo $this->Html->link('Roles', '/admin/roles/index'); ?></li>
            <li><?php echo $this->Html->link('Users', '/admin/users/index'); ?></li>
            
        </UL>

        <H3>Sites, Towers</H3>
        <UL>
            <li><?php echo $this->Html->link('Equipment Spaces', '/admin/equipmentSpaces/index'); ?></li>
            <li><?php echo $this->Html->link('Organizations', '/admin/organizations/index'); ?></li>    
            <li><?php echo $this->Html->link('Power Types', '/admin/powerTypes/index'); ?></li>
            <li><?php echo $this->Html->link('Tower Members', '/admin/towerMembers/index'); ?></li>    
            <li><?php echo $this->Html->link('Tower Mounts', '/admin/towerMounts/index'); ?></li>            
            <li><?php echo $this->Html->link('Tower Type', '/admin/towerTypes/index'); ?></li>            
        </UL>
    </div> <!-- /.span4 -->

    <div class="span4">
    <H3>Radios</H3>
        <UL>
            <li><?php echo $this->Html->link('Antenna Types', '/admin/antennaTypes/index'); ?></li>
            <li><?php echo $this->Html->link('Radio Modes', '/admin/radioModes/index'); ?> </li>
            <li><?php echo $this->Html->link('Radio Types', '/admin/radioTypes/index'); ?> </li>
        </UL>

    <H3>Other</H3>
    <UL>    
        <li><?php echo $this->Html->link('Build Items', '/admin/buildItems/index'); ?></li>
        <li><?php echo $this->Html->link('Contact Types', '/admin/contactTypes/index'); ?></li>
        <li><?php echo $this->Html->link('Install Teams', '/admin/installTeams/index'); ?></li> 
        <li><?php echo $this->Html->link('Router Types', '/admin/routerTypes/index'); ?> </li>
        <li><?php echo $this->Html->link('Switch Types', '/admin/switchTypes/index'); ?> </li>      
        <li><?php echo $this->Html->link('Site States', '/admin/siteStates/index'); ?></li>
        <li><?php echo $this->Html->link('Zones', '/admin/zones/index'); ?></li>
    </UL>
    </div> <!-- /.span4 -->
</div> <!-- /.span9 -->
</div> <!-- /.row -->
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
<h2>Setup</h2>
<UL>
    <li>
        <?php echo $this->Html->link('Users', '/users/index'); ?>
    </li>
    <li>
        <?php echo $this->Html->link('Roles', '/roles/index'); ?>
    </li>
    <HR>
    <li>
        <?php echo $this->Html->link('Zones', '/zones/index'); ?>
    </li>
    <HR>
    <li>
        <?php echo $this->Html->link('Antenna Types', '/antennaTypes/index'); ?>       
    </li>
    <li>
        <?php echo $this->Html->link('Contact Types', '/contactTypes/index'); ?>       
    </li>
    <li>
        <?php echo $this->Html->link('Power Types', '/powerTypes/index'); ?>
    </li>
    <li>
        <?php echo $this->Html->link('Radio Types', '/radioTypes/index'); ?>       
    </li>
    <li>
        <?php echo $this->Html->link('Site States', '/siteStates/index'); ?>
    </li>
    <li>
        <?php echo $this->Html->link('Tower Owners', '/towerOwners/index'); ?>
    </li>
    
</UL>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
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
        <?php echo $this->Html->link('Contact Types', '/contacttypes/index'); ?>       
    </li>
    <li>
        <?php echo $this->Html->link('Power Types', '/powertypes/index'); ?>
    </li>
    <li>
        <?php echo $this->Html->link('Site States', '/sitestates/index'); ?>
    </li>
    <li>
        <?php echo $this->Html->link('Tower Owners', '/towerowners/index'); ?>
    </li>
    
</UL>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
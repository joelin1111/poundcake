<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Projects', array('action' => 'index')); ?>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Project</h2>
    <P><B>Name:</B>&nbsp;<?php echo $project['Project']['name']; ?></P>
    <P><B>Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f", $project['Project']['default_lat']) .', '. sprintf("%01.5f", $project['Project']['default_lon']) ?></P>
    <P><B>Workorder Title:</B>&nbsp;<?php echo $project['Project']['workorder_title']; ?></P>
    <P><B>Datetime Format:</B>&nbsp;<?php echo $project['Project']['datetime_format']; ?></P>
    <P><B>SNMP Version:</B>&nbsp;<?php echo $project['SnmpType']['name']; ?></P>
    <P><B>SNMP Community Name:</B>&nbsp;<?php echo $project['Project']['snmp_community_name']; ?></P>
    <P><B>Monitoring System Type:</B>&nbsp;<?php echo $project['MonitoringSystemType']['name']; ?></P>
    <P><B>Monitoring System Username:</B>&nbsp;<?php echo $project['Project']['monitoring_system_username']; ?></P>
    <P><B>Monitoring System Password:</B>&nbsp;<?php echo $project['Project']['monitoring_system_password']; ?></P>
    <P><B>Monitoring System ReST URL:</B>&nbsp;<?php echo $project['Project']['monitoring_system_url']; ?></P>
    <P><B>Users with access to this project:</B>
    <UL>
    <?php
        foreach ($project['User'] as $user ) {
            echo '<LI>'.$user['username'].'</LI>';
        }
    ?>
    </UL>
    
    
</div> <!-- /.span9 -->
</div> <!-- /.row -->

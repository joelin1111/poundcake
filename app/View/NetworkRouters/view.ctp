<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Routers', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Router</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkrouter['NetworkRouter']['name']; ?></P>
    <P><B>Site:</B>&nbsp;<?php echo $networkrouter['Site']['site_name']; ?></P>
    <P><B>Manufacturer:</B>&nbsp;<?php echo $networkrouter['RouterType']['manufacturer']; ?></P>
    <P><B>Model:</B>&nbsp;<?php echo $networkrouter['RouterType']['model']; ?></P>
    <P><B>Serial No:</B>&nbsp;<?php echo $networkrouter['NetworkRouter']['serial']; ?></P>
    <P><B>SNMP Override:</B>&nbsp;<?php echo ($networkrouter['NetworkRouter']['snmp_override'] > 0 ? "Yes" : "No");?>
    <?php
        if ( $snmp_override ) {
            echo '<ul>';
            echo '<li>SNMP Version:  '.$networkrouter['SnmpType']['name'].'</li>';
            echo '<li>SNMP Community Name: ';
            if ( $snmp_community ) {
              echo $networkrouter['NetworkRouter']['snmp_community_name'];
            } else {
                echo '********************';
            }
            echo '</li></ul>';            
        }
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



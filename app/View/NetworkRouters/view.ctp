<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->PoundcakeHTML->linkIfAllowed('View Alarms', array('action'=>'alarms', $networkrouter['NetworkRouter']['id']),1);?></li>
        <li><?php echo $this->PoundcakeHTML->linkIfAllowed('Edit Router', array('action'=>'edit', $networkrouter['NetworkRouter']['id']),1);?></li>
        <li><?php
            echo $this->PoundcakeHTML->postLinkIfAdmin('Provision Router',
                array('controller'=>'networkRouters','action'=>'provision', $networkrouter['NetworkRouter']['id'] ),
                array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Provision router '.$networkrouter['NetworkRouter']['name'].' into monitoring system'),
                null,
                null );
            ?>
        </li> 
        <?php if (isset($node_detail_url)) {
            echo '<li><a href="'.$node_detail_url .'" target="_blank">More Details</a></li>';
        } ?>    
        <li><?php echo $this->Html->link('List Routers', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Router</h2>
    <div class="status-icon">
    <P><B>Name:</B>&nbsp;&nbsp;
        <?php
            echo $networkrouter['NetworkRouter']['name'];
            echo $this->element('Common/site_status_icon', array('status' => $networkrouter['NetworkRouter']['is_down']));
        ?>
    </P>
    </div>
    
    <P><B>Site:</B>&nbsp;<?php echo $networkrouter['Site']['name']; ?></P>
    
    <?php echo $this->element('Common/provisioning_info',
            array(
                'provisioned_on' => $networkrouter['NetworkRouter']['provisioned_on'],
                'provisioned_by_name' => $provisioned_by_name,
                'foreign_id' => $networkrouter['NetworkRouter']['foreign_id'],
            ));
    ?>
    
    <P><B>Manufacturer:</B>&nbsp;<?php echo $networkrouter['RouterType']['manufacturer']; ?></P>
    <P><B>Model:</B>&nbsp;<?php echo $networkrouter['RouterType']['model']; ?></P>
    <P><B>Serial No:</B>&nbsp;<?php echo $networkrouter['NetworkRouter']['serial']; ?></P>
    <P><B>SNMP Override:</B>&nbsp;<?php echo ($networkrouter['NetworkRouter']['snmp_override'] > 0 ? "Yes" : "No");?>
    <P><B>Primary IP Address:</B>&nbsp;<?php echo $networkrouter['NetworkRouter']['ip_address']; ?>
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



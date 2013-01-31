<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Switch', array('action'=>'edit', $networkswitch['NetworkSwitch']['id']),1);?></li>
        <li><?php
            echo $this->MyHTML->postLinkIfAdmin('Provision Switch',
                array('controller'=>'networkSwitches','action'=>'provision', $networkswitch['NetworkSwitch']['id'] ),
                array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Provision switch '.$networkswitch['NetworkSwitch']['name'].' into monitoring system'),
                null,
                null );
            ?>
        </li>
        <?php if (isset($node_detail_url)) {
            echo '<li><a href="'.$node_detail_url .'" target="_blank">More Details</a></li>';
        } ?>  
        <li><?php echo $this->Html->link('List Switches', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Switch</h2>
    <div class="status-icon">
    <P><B>Name:</B>&nbsp;&nbsp;
        <?php
            echo $networkswitch['NetworkSwitch']['name'];
            echo $this->element('Common/site_status_icon', array('status' => $networkswitch['NetworkSwitch']['is_down']));
        ?>
    </P>
    </div>
    <P><B>Site:</B>&nbsp;<?php echo $networkswitch['Site']['name']; ?></P>
    
    <?php echo $this->element('Common/provisioning_info',
            array(
                'provisioned_on' => $networkswitch['NetworkSwitch']['provisioned_on'],
                'provisioned_by_name' => $provisioned_by_name,
                'foreign_id' => $networkswitch['NetworkSwitch']['foreign_id'],
            ));
    ?>
    
    <P><B>Serial No:</B>&nbsp;<?php echo $networkswitch['NetworkSwitch']['serial']; ?></P>
    <P><B>Switch Type:</B>&nbsp;<?php echo $networkswitch['SwitchType']['name']; ?></P>
    <P><B>Ports:</B>&nbsp;<?php echo $networkswitch['SwitchType']['ports']; ?></P>
    <P><B>Manufacturer:</B>&nbsp;<?php echo $networkswitch['SwitchType']['manufacturer']; ?></P>
    <P><B>Model:</B>&nbsp;<?php echo $networkswitch['SwitchType']['model']; ?></P>
    <P><B>SNMP Override:</B>&nbsp;<?php echo ($networkswitch['NetworkSwitch']['snmp_override'] > 0 ? "Yes" : "No");?>
    <?php
        if ( $snmp_override ) {
            echo '<ul>';
            echo '<li>SNMP Version:  '.$networkswitch['SnmpType']['name'].'</li>';
            echo '<li>SNMP Community Name: ';
            if ( $snmp_community ) {
              echo $networkswitch['NetworkSwitch']['snmp_community_name'];
            } else {
                echo '********************';
            }
            echo '</li></ul>';            
        }
    ?>
    <P><B>Primary IP Address:</B>&nbsp;<?php echo $networkswitch['NetworkSwitch']['ip_address']; ?>
    <P><B>Attached Radios:</B>&nbsp;
    <?php
        if (!isset($networkswitch['NetworkRadio'])) {
            echo "None";
        } else {
        
            // the array of attached radios doesn't come out sorted by port, by default
            // it would come out in the order they were attached to the switch
            // so re-order the array to make it look more logical

//            echo '<pre>';
//            print_r($networkswitch['NetworkRadio'] );
//            
//            foreach ( $networkswitch['NetworkRadio'] as $key => $value ) {
//                print_r($value);
//            }
//            
//            echo '</pre>';
//            die;
            
            echo "<UL>";
            foreach ($networkswitch['NetworkRadio'] as $radio) {
                //print_r($radio);
                //echo $this->Html->link($contact['first_name']." ".$contact['last_name']), array(
                echo "<LI>";
                echo 'Port '.$radio['switch_port'].' - ';
                echo $this->Html->link(($radio['name']), array(
                    'controller' => 'networkRadios',
                    'action' => 'view',
                    $radio['id']));
                echo " ".$radio['name'];
                
                echo "</LI>";
            }
            echo "</UL>";
        }
    ?>
    </P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Switch', array('action'=>'edit', $networkswitch['NetworkSwitch']['id']),1);?></li>
        <li><?php echo $this->Html->link('List Switches', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Switch</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkswitch['NetworkSwitch']['name']; ?></P>
    <P><B>Site:</B>&nbsp;<?php echo $networkswitch['Site']['name']; ?></P>
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



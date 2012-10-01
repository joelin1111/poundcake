<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Switches'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Switch</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkswitch['NetworkSwitch']['name']; ?></P>
    <P><B>Switch Type:</B>&nbsp;<?php echo $networkswitch['SwitchType']['name']; ?></P>
    <P><B>Ports:</B>&nbsp;<?php echo $networkswitch['SwitchType']['ports']; ?></P>
    <P><B>Ports:</B>&nbsp;<?php echo $networkswitch['SwitchType']['manufacturer']; ?></P>
    <P><B>Ports:</B>&nbsp;<?php echo $networkswitch['SwitchType']['model']; ?></P>
    
    <P><B>Attached Radios:</B>&nbsp;
    <?php
//        echo '<pre>';
//        print_r($networkswitch);
//        echo '</pre>';
//        
        if (!isset($networkswitch['NetworkRadio'])) {
            echo "None";
        } else {
            echo "<UL>";
            foreach ($networkswitch['NetworkRadio'] as $radio) {
                //print_r($radio);
                //echo $this->Html->link(__($contact['first_name']." ".$contact['last_name']), array(
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



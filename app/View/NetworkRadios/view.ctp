<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Radio', array('action'=>'edit', $networkradio['NetworkRadio']['id']),1);?></li>
        <li><?php
            echo $this->MyHTML->postLinkIfAllowed('Provision Radio',
                array('controller'=>'networkRadios','action'=>'provision', $networkradio['NetworkRadio']['id'] ),
                array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Provision radio '.$networkradio['NetworkRadio']['name'].' into monitoring system'),
                null,
                null );
            ?>
        </li>                    
        <li><?php echo $this->Html->link('List Radios', array('action' => 'index')); ?></li>        
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->
<div class="span9">
    <h2>View Radio</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['name']; ?></P>
    <P><B>Site:</B>&nbsp;<?php echo $networkradio['Site']['name']; ?></P>
    <P><B>Serial No:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['serial']; ?></P>
    <P><B>Sector:</B>&nbsp;<?php echo ($networkradio['NetworkRadio']['sector'] > 0 ? "Yes" : "No"); ?>
    <P><B>Radio Type:</B>&nbsp;<?php echo $networkradio['RadioType']['name']; ?></P>
    <P><B>Antenna:</B>&nbsp;<?php echo $networkradio['AntennaType']['name']; ?></P>
    <P><B>Radio Mode:</B>&nbsp;
        <?php echo $networkradio['RadioMode']['name'];
        if ($networkradio['NetworkRadio']['sector'] = 0)
            echo '<BR><I>Radio Mode for '.$links[0]['network_radios']['name'].': '.$links[0]['radio_modes']['radio_mode_name'] . '</I>';        
    ?></P>    
    <?php
        // if this is a sector radio, show the true/mag azimuth values from the database
        if ( $sector ) {
            echo '<P><B>True Azimuth:</B>&nbsp;';
            echo sprintf("%01.2f",$networkradio['NetworkRadio']['true_azimuth']).'°';
            echo '</P>';
            echo '<P><B>Magnetic Azimuth:</B>&nbsp;';
            echo sprintf("%01.2f",$networkradio['NetworkRadio']['mag_azimuth']).'°';
            echo '</P>';
        }
    ?>
    
    <P><B>Elevation:</B>&nbsp;<?php
        if (isset($networkradio['NetworkRadio']['elevation']))
            echo $networkradio['NetworkRadio']['elevation'].'°';
    ?>
    </P>
    <P><B>Min. Height (meters):</B>&nbsp;<?php echo $networkradio['NetworkRadio']['min_height']; ?></P>
    <P><B>Frequency:</B>&nbsp;
        <?php echo $networkradio['NetworkRadio']['frequency'];
        if ( $sector && isset($links[0]) ) 
            echo '<BR><I>Frequency for '.$links[0]['network_radios']['name'].': '.$links[0]['network_radios']['frequency'] . '</I>';
        ?></P>
    <P><B>SSID:</B>&nbsp;
        <?php echo $networkradio['NetworkRadio']['ssid'];
        if ( $sector && isset($links[0]) ) 
            echo '<BR><I>SSID for '.$links[0]['network_radios']['name'].': '.$links[0]['network_radios']['ssid'] . '</I>';
        ?></P>
    <P><B>Switch:</B>&nbsp;<?php echo $networkradio['NetworkSwitch']['name']; ?></P>
    <P><B>Switch Port:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['switch_port']; ?></P>
    
    <P><B>SNMP Override:</B>&nbsp;<?php echo ($networkradio['NetworkRadio']['snmp_override'] > 0 ? "Yes" : "No");?>
    <?php
        if ( $snmp_override ) {
            echo '<ul>';
            echo '<li>SNMP Version:  '.$networkradio['SnmpType']['name'].'</li>';
            echo '<li>SNMP Community Name: ';
            if ( $snmp_community ) {
              echo $networkradio['NetworkRadio']['snmp_community_name'];
            } else {
                echo '********************';
            }
            echo '</li></ul>';            
        }
    ?>
    <P><B>Primary IP Address:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['ip_address']; ?>
        
    <P><B>Link Information:</B>&nbsp;
        <?php foreach ($links as $link) { ?>
        <table class="table table-condensed table-striped">
            <thead>
            <tr>
                <th>Radio Name</th>
                <th>Distance</th>
                <th>True Azimuth</td>
                <th>Magnetic Azimuth</td>
                <th>Actions</td>
            </tr>
            <tr>
                <td>
                    <?php
                        echo $this->MyHtml->linkIfAllowed(
                            $link['network_radios']['name'],
                            array('action' => 'view',
                                $link['radios_radios']['dest_radio_id']
                                )
                            );
                    ?>
                </td>
                <td>
                    <?php
                    if ($sector)
                        echo "N/A";
                    else
                        echo sprintf("%01.2f",$link['network_radios']['link_distance']) .' Km';
                    ?>
                </td>
                <td>
                    <?php
                    if ($sector)
                        echo "N/A";
                    else
                        echo sprintf("%01.2f",$link['network_radios']['true_azimuth']) . '° to ' . $link['network_radios']['name'];
                    ?>
                </td>
                <td>
                   <?php
                   if ($sector)
                        echo "N/A";
                    else
                        echo sprintf("%01.2f",$link['network_radios']['mag_azimuth']) . '° to ' . $link['network_radios']['name'];
                    ?>
                </td>
                <td>
                    <?php
                        /*
                        echo $this->MyHTML->postLinkIfAllowed(
                            'Pull Config',
                            array(
                                'action' => 'pullConfig',
                                'controller' => 'networkRadios',
                                $networkradio['NetworkRadio']['id'],
                                $link['radios_radios']['dest_radio_id']
                            ),
                            null,
                            'Pull SSID, frequency and mode from '.$link['network_radios']['name'].'?');
                        */
                        echo $this->MyHTML->postLinkIfAllowed('Pull Config',
                            array('controller'=>'networkRadios','action'=>'pullConfig', $networkradio['NetworkRadio']['id'],$link['radios_radios']['dest_radio_id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Pull config from '.$networkradio['NetworkRadio']['name']),
                            null,
                            'Pull SSID, frequency and mode from '.$link['network_radios']['name'].'?'
                        );
                    ?>
                </td>
            </tr>
        </table>
    <?php } ?>
    <?php echo $this->element('Common/addrpool_data'); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



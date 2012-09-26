<?php
//    echo "<pre>";
//    print_r($networkradio);
//    echo "</pre>";
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed(__('Edit Radio'), array('action' => 'edit', $networkradio['NetworkRadio']['id']))?></li>
        <li><?php echo $this->Html->link(__('List Radios'), array('action' => 'index')); ?></li>
        <li><?php echo $this->MyHTML->linkIfAllowed(__('Delete'), array('action' => 'delete', $networkradio['NetworkRadio']['id']), null, __('Are you sure you want to delete radio %s?', $networkradio['NetworkRadio']['name'])); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->
<div class="span9">
    <h2>View Radio</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['name']; ?></P>
    <P><B>Radio Type:</B>&nbsp;<?php echo $networkradio['RadioType']['name']; ?></P>
    <P><B>Antenna:</B>&nbsp;<?php echo $networkradio['AntennaType']['name']; ?></P>    
    <P><B>Link Distance:</B>&nbsp;<?php echo sprintf("%01.2f",$link_distance). ' Km'; ?></P>
    <P><B>True Azimuth:</B>&nbsp;
        <?php //echo $networkradio['NetworkRadio']['true_azimuth'];
            echo sprintf("%01.5f",$true_azimuth);
        ?>
    </P>
    <P><B>Magnetic Azimuth:</B>&nbsp;
        <?php //echo $networkradio['NetworkRadio']['mag_azimuth'];
            echo sprintf("%01.5f",$mag_azimuth);
        ?>
    </P>
    <P><B>Elevation:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['elevation']; ?></P>
    <P><B>Frequency:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['frequency']; ?></P>
    <P><B>SSID:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['ssid']; ?></P>
    <P><B>Switch:</B>&nbsp;<?php echo $networkradio['NetworkSwitch']['name']; ?></P>
    <P><B>Switch Port:</B>&nbsp;<?php echo $networkradio['NetworkRadio']['switch_port']; ?></P>
    <P><B>Linked To:</B>&nbsp;<?php echo $this->Html->link($link_name, array('action' => 'view', $networkradio['NetworkRadio']['link_id'])) ?>
    <?php echo $this->element('Common/addrpool_data'); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



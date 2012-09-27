<?php
    echo $this->Html->script('jquery-1.7.2');    
    // if we're under SSL we have to give the Google stuff under SSL, too, or
    // else the browser is likely to complain or just not render SSL/non-SSL
    // content together
    if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) {
        echo $this->Html->script('https://maps.google.com/maps/api/js?sensor=true',false);
    } else {
        echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    }
    echo $this->Html->script('gears_init');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Site', array('action'=>'edit', $site['Site']['id']),1);?></li>
        <li><?php echo $this->Html->link('List Sites', array('action'=>'index')); ?></li>
        <li><?php echo $this->Html->link('Equipment List', array('action'=>'view', 'ext'=>'pdf', $site['Site']['id']));?></li>
        <li><?php echo $this->Html->link('Work Order', array('action'=>'workorder',$site['Site']['id']));?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2><?php echo $site['Site']['site_code']." ".$site['Site']['site_name'].' ('.$site['SiteState']['name'].')'?> </h2>
    <h3><?php //echo $site['SiteState']['name']; ?></h3>
    
    <P><B>Site contacts:</B>&nbsp;
        <?php
            if (!isset($contacts[0])) {
                echo "None";
            } else {
                $c = count($contacts[0]['Contact']);
                echo "<UL>";
                foreach ($contacts[0]['Contact'] as $contact) {
                    //echo $this->Html->link(__($contact['first_name']." ".$contact['last_name']), array(
                    echo "<LI>";
                    echo $this->Html->link(($contact['name_vf']), array(
                        'controller' => 'contacts',
                        'action' => 'view',
                        $contact['id']));
                    echo " ".$contact['mobile'];
                    echo " - ".$contact['ContactType']['name'];
                    echo "</LI>";
                }
                echo "</UL>";
            }
        ?>
    </P>
    <P><B>GPS Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['lat']) . ' ' . sprintf("%01.5f",$site['Site']['lon']) . '<br>'; ?> </P>
    <P><B>Magnetic declination:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['declination']); ?></P>
    
    <P><B>Zone:</B>&nbsp;<?php echo $site['Zone']['name']; ?></P>
    
    <?php
        $windowText = $site['Site']['site_vf'];
        // draw the main map
        $icon = 'data:'.$site['SiteState']['img_type'].';base64,'.base64_encode( $site['SiteState']['img_data'] );
        echo $this->element('Common/map',
                array(
                    'windowText' => $windowText,
                    'lat' => $site['Site']['lat'],
                    'lon' => $site['Site']['lon'],
                    'icon' => $icon
                    )
                );
        /*
        // placemarkers for nearby sites
        print_r($nearby);
        $icon = '';
        $c = count($nearby);
        $i = 2;
        //echo "c is".$c;
        if ($c > 0) {
            foreach ($nearby as $s) {
                //echo "<pre>".print_r($s)."</pre>";
                //echo $s['distance'];
                $distance = sprintf ("%01.2f", $s[0]['distance']);
                $lat = $s[0]['lat'];
                $lon = $s[0]['lon'];
                // this result set comes from a stored procedure, and makes the same
                // site_vf virtual field that's defined in the Site
                // model -- but technically this is not the same field, so FYI
                $siteUrl = $this->Html->link(
                    $s[0]['site_vf'],
                    array('controller' => 'sites', 'action' => 'view', $s['sites']['id'])
                );
                //$windowText = $siteUrl."<BR>".$s['schools']['site_name']. "<BR>Distance: ".$distance." Km";
                $windowText = $siteUrl."<BR>Distance: ".$distance." Km";


                $markerOptions= array(
                    'id' => $i, // Id of the marker, on this page we only have 1 so we can hardcode that
                    'latitude' => $lat,
                    'longitude' => $lon,
                    'markerIcon' => $icon, //Custom icon
                    //'address'=> "", # mysteriously started complaining about this field not being present
                    //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                    'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                    'windowText' => $windowText // Text inside the information window
                );
                echo $this->AltGoogleMapV3->addMarker('map_canvas', $i, $markerOptions);
                $i++;
            }
        }
         */
    ?>
    </p>

    <P><B>Tower Guard</B>:&nbsp;<?php echo $site['Site']['tower_guard'];?></P>
    <P><B>Structure Type</B>:&nbsp;<?php echo $site['Site']['structure_type'];?></P>
    <P><B>Description</B>:&nbsp;<?php echo $site['Site']['description'];?></P>
    <P><B>Mounting</B>:&nbsp;<?php echo $site['Site']['mounting'];?></P>
    <P><B>Access</B>:&nbsp;<?php echo $site['Site']['access'];?></P>
    <P><B>Storage</B>:&nbsp;<?php echo $site['Site']['storage'];?></P>
    <P><B>Accommodations</B>:&nbsp;<?php echo $site['Site']['accommodations'];?></P>
    <P><B>Notes</B>:&nbsp;<?php echo $site['Site']['notes'];?></P>
    <P><B>Install Team:</B>&nbsp;<?php echo $site['InstallTeam']['name']; ?></P>
    <P><B>Install Date:</B>&nbsp;<?php echo $site['Site']['install_date']; ?></P>
    <P><B>Tower Owner:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['TowerOwner']['name'],
                array(
                    'controller' => 'towerOwners',
                    'action' => 'view',
                    $site['TowerOwner']['id']));
    ?></P>
    <P><B>Power Type:</B>&nbsp;<?php echo $site['PowerType']['name']; ?></P>
    <P><B>Switch:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['NetworkSwitch']['name'],
                array(
                    'controller' => 'networkSwitches',
                    'action' => 'view',
                    $site['NetworkSwitch']['id']));
    ?></P>
    <P><B>Router:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['NetworkRouter']['name'],
                array(
                    'controller' => 'networkRouters',
                    'action' => 'view',
                    $site['NetworkRouter']['id']));
    ?></P>
    
    <P><B>Radios:</B>&nbsp;
        <?php
        //print_r($site);
        $c = count($site['NetworkRadios']);
        //echo "c is".$c;
        if ($c == 0) {
            echo "None";
        } else {
            echo "<table class=\"table table-condensed table-striped\">";
            echo "<th>Radio</th>";
            echo "<th>Frequency</th>";
            echo "<th>SSID</th>";
            foreach ($site['NetworkRadios'] as $radio) {
                echo "<tr><td>";
                echo $this->Html->link(__($radio['name']), array(
                    'controller' => 'networkRadios',
                    'action' => 'view',
                    $radio['id']));
                echo "</td>";
                
                echo "<td>";
                if (!empty($radio['frequency'])) {
                     echo $radio['frequency'];
                } else {
                    echo "-";
                }
                echo "</td>";
                
                echo "<td>";
                if (!empty($radio['ssid'])) {
                     echo $radio['ssid'];
                } else {
                    echo "-";
                }
                echo "</td>";
                
                echo "</tr>";
            }
            echo "</table>";
        }
        ?>
    </P>
    
    <?php echo $this->element('Common/addrpool_data'); ?>
    
    <P><B>Files:</B>&nbsp;
        <?php
            // get any attached files
            $results = $this->Upload->listing('Site', $site['Site']['id']);
            // echo print_r($results['files']);
            // maybe test if the file exists here?
            if ($results['files'] != null) {
                // list any uploaded files
                echo $this->Upload->view('Site', $site['Site']['id']);
            } else {
                echo "None";
            }

            /* in case we want to do something more interesting with the list of files?
            $results = $this->Upload->listing('Site', $site['Site']['id']);
            $directory = $results['directory'];
            $baseUrl = $results['baseUrl'];
            $files = $results['files'];
            echo "<pre>".print_r($results)."</pre>";
            */
        ?>
    </P>
            
    </div> <!-- /.span9 -->
</div> <!-- /.row -->

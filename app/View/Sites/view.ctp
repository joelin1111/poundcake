<?php
    echo $this->Html->script('jquery-1.7.2');
    echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    echo $this->Html->script('gears_init');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link('Edit School', array('action'=>'edit', $school['School']['id']));?></li>
    </ul>
    <?php echo $this->element('Common/legend'); ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2><?php echo $school['School']['school_code']." ".$school['School']['school_name']; ?></h2>
    <P><B>Zone:</B>&nbsp;<?php echo $school['Zone']['name']; ?></P>
    
    <P><B>School contacts:</B>&nbsp;
        <?php
            //print_r($school);
            $c = count($school['Contacts']);
            //echo "c is".$c;
            if ($c == 0) {
                echo "None";
            } else {
                foreach ($school['Contacts'] as $contact) {
                    echo $this->Html->link(__($contact['first_name']." ".$contact['last_name']), array(
                        'controller' => 'contacts',
                        'action' => 'view',
                        $contact['id']));
                }
            }
        ?>
    </P>
    <P><B>GPS Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f",$lat) . ' ' . sprintf("%01.5f",$lon) . '<br>'; ?> </P>
    <P><B>Install Date:</B>&nbsp;<?php echo $school['School']['install_date']; ?></P>
    <P><B>Connectivity Type:</B>&nbsp;<?php echo $school['ConnectivityType']['name']; ?></P>
    <P><B>Intervention Type:</B>&nbsp;<?php echo $school['InterventionType']['name']; ?></P>
    <P><B>Site State:</B>&nbsp;<?php echo $school['SiteState']['name']; ?></P>
    <P><B>Service Provider:</B>&nbsp;<?php echo $school['ServiceProvider']['name']; ?></P>
    <P><B>Power Type:</B>&nbsp;<?php echo $school['PowerType']['name']; ?></P>
    <P><B>Road Condition:</B>&nbsp;<?php echo $school['RoadType']['name']; ?></P>

    <P><B>Map:</B></P>
    <?php
        $windowText = $school['School']['school_vf'];
        // draw the main map
        // lat lon already set (hopefull1y)
        //echo $this->element('Common/map');
        echo $this->element('Common/map',
                array(
                    'windowText' => $windowText,
                    'lat' => $lat,
                    'lon' => $lon,
                    'icon' => '/img/school.png'
                    )
                );
        
    // placemarkers for nearby schools
    // print_r($nearby);
    $icon = '/img/school_nearby.png';
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
            // school_vf virtual field that's defined in the School
            // model -- but technically this is not the same field, so FYI
            $schoolUrl = $this->Html->link(
                $s[0]['school_vf'],
                array('controller' => 'schools', 'action' => 'view', $s['schools']['id'])
            );
            //$windowText = $schoolUrl."<BR>".$s['schools']['school_name']. "<BR>Distance: ".$distance." Km";
            $windowText = $schoolUrl."<BR>Distance: ".$distance." Km";
            
            
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
    
    //echo "x";
    // finally, put a placemarker for the TRC
    if ($trc_lat != null && $trc_lon != null) {
        $icon = '/img/trc.png';
        $markerOptions= array(
            'id' => $i, // Id of the marker, on this page we only have 1 so we can hardcode that
            'latitude' => $trc_lat,
            'longitude' => $trc_lon,
            'markerIcon' => $icon, //Custom icon
            //'address'=> "", # mysteriously started complaining about this field not being present
            //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
            'infoWindow' => true, // Boolean to show an information window when you click the marker or not
            'windowText' => $windowText // Text inside the information window
        );
        echo $this->AltGoogleMapV3->addMarker('map_canvas', $i, $markerOptions);
    }
    ?>
    </p>

    <P><B>Access Instructions:</B>&nbsp;
        <?php
            if ($school['School']['access_instruction'] != "") {
                echo $school['School']['access_instruction'];
            } else {
                echo "None";
            }
        ?>
    </P>

    <P><B>Files:</B>&nbsp;
        <?php
            // get any attached files
            $results = $this->Upload->listing('School', $school['School']['id']);
            // echo print_r($results['files']);
            // maybe test if the file exists here?
            if ($results['files'] != null) {
                // list any uploaded files
                echo $this->Upload->view('School', $school['School']['id']);
            } else {
                echo "None";
            }

            /* in case we want to do something more interesting with the list of files?
            $results = $this->Upload->listing('School', $school['School']['id']);
            $directory = $results['directory'];
            $baseUrl = $results['baseUrl'];
            $files = $results['files'];
            echo "<pre>".print_r($results)."</pre>";
            */
        ?>
    </P>
            
    </div> <!-- /.span9 -->
</div> <!-- /.row -->
<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
    // Marc Fernandez map helper 
    echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    //$this->Html->script('http://code.google.com/apis/gears/gears_init.js',false);
    echo $this->Html->script('gears_init');
?>
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link('Edit School', array('action'=>'edit', $school['School']['id']));?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2><?php echo $school['School']['school_code']." ".$school['School']['school_name']; ?></h2>
    <P><B>Catchment:</B>&nbsp;<?php echo $school['Catchment']['name']; ?></P>
    <P><B>Area:</B>&nbsp;<?php echo $school['Area']['name']; ?></P>
    <P><B>District:</B>&nbsp;<?php echo $school['District']['name']; ?></P>
    <P><B>District contacts:</B>&nbsp;
        <?php
            //print_r($school['Contacts']);
            $c = count($school['Contacts']);
            //echo "c is".$c;
            if ($c == 0) {
                echo "None";
            } else {
                foreach ($school['Contacts'] as $contact) {
                    echo $this->Html->link(__($contact['first_name']." ".$contact['last_name']), array(
                    //echo $this->Html->link(__($contact['full_name']), array(    
                        'controller' => 'contacts',
                        'action' => 'view',
                        $contact['id']));
                }
            }
        ?>
    </P>

    <P><B>TC/TRC:</B>&nbsp;
        <?php
            // link to the TRC view
            // echo $school['Trc']['name'];
            echo $this->Html->link(__($school['Trc']['trc_name']),
                    array(
                        'controller' => 'trcs',
                        'action' => 'view',
                        $school['Trc']['id']));
        ?>

    </P>
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
    <P><B>GPS Coordinates:</B>&nbsp;<?php echo $lat . ' ' . $lon . '<br>'; ?> </P>
    <P><B>Install Date:</B>&nbsp;<?php echo $school['School']['install_date']; ?></P>
    <P><B>Connectivity Type:</B>&nbsp;<?php echo $school['ConnectivityType']['name']; ?></P>
    <P><B>Intervention Type:</B>&nbsp;<?php echo $school['InterventionType']['name']; ?></P>
    <P><B>Site State:</B>&nbsp;<?php echo $school['SiteState']['name']; ?></P>
    <P><B>Service Provider:</B>&nbsp;<?php echo $school['ServiceProvider']['name']; ?></P>
    <P><B>Power Type:</B>&nbsp;<?php echo $school['PowerType']['name']; ?></P>
    <P><B>Road Condition:</B>&nbsp;<?php echo $school['RoadType']['name']; ?></P>

    <P><B>Map:</B>&nbsp;
    <?php

    $defaultLat = -5.6;
    $defaultLng = 36;

//                    echo "<pre>";
//                    echo "defaultLat".$defaultLat."<br>";
//                    echo "lat".$lat."<br>";
//                    echo "defaultLng".$defaultLng."<br>";
//                    echo "lon".$lon."<br>";
//                    echo "</pre>";

    // map should center around the coordinates that are passed to the view
    // otherwise it should default to "about Tanzania"
    if ( $lat != null && $lon != null ) {
        $defaultLat = $lat;
        $defaultLng = $lon;
    }

    // text for the popup over the placemarker
    $windowText = $school['School']['school_code']."<BR>".$school['School']['school_name'];
    //$windowText = json_encode($windowText);
    //$schoolImage = $this->Html->image('school-r.png');
    $schoolImage = '/img/school.png';


    // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper
    // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    // http://plugins.cakephp.org/package/marcferna/CakePHP-Google-Maps-V3-Helper
    $mapOptions = array(
        'id'=>'map_canvas', // Map canvas ID
        'width'=>'800px', // Width of the map
        'height'=>'800px', // Height of the map
        'style' => 'width: 100%; height:300px;', // CSS style for the map canvas
        'zoom'=>10, // zoom
        'type'=>'ROADMAP', // Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
        //'custom'=>null, // Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
        'latitude' => $defaultLat,	// default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'longitude' => $defaultLng,	// default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'address'=>"",//1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'localize'=> false, // boolean to localize your position or not
        'marker' => true, // boolean to put a marker in the position or not
        //'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
        'markerIcon' => $schoolImage,
        //'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
        //'windowText' => 'foo'//$windowText // text inside the information window
        'windowText' => $windowText
    );
    //echo "<pre>".print_r($mapOptions)."</pre>";
    echo $this->AltGoogleMapV3->map($mapOptions); //To add a map that localizes you

    // placemarkers for nearby schools
    // print_r($nearby);
    $schoolImage = '/img/school-nearby.png';
    $c = count($nearby);
    $i = 2;
    //echo "c is".$c;
    if ($c > 0) {
        foreach ($nearby as $s) {
            //echo print_r($s);
            //echo $s['distance'];
            $distance = sprintf ("%01.2f", $s[0]['distance']);
            $lat = $s[0]['lat'];
            $lon = $s[0]['lon'];

            $schoolUrl = $this->Html->link(
                $s['schools']['school_code'],
                array('controller' => 'schools', 'action' => 'view', $s['schools']['id'])
            );
            $windowText = $schoolUrl."<BR>".$s['schools']['school_name']. "<BR>Distance: ".$distance." Km";

            $markerOptions= array(
                'id' => $i, // Id of the marker, on this page we only have 1 so we can hardcode that
                'latitude' => $lat,
                'longitude' => $lon,
                'markerIcon' => $schoolImage, //Custom icon
                //'address'=> "", # mysteriously started complaining about this field not being present
                //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                'windowText' => $windowText // Text inside the information window
            );
            echo $this->AltGoogleMapV3->addMarker("map_canvas", $i, $markerOptions);
            $i++;
        }
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
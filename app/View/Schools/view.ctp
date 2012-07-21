<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2'); # or wherever it is in your js folder
    # include the map js code
    echo $this->Html->script($this->GoogleMapV3->apiUrl());
?>

<h1><?php echo $school['School']['primary_school']?></h1>


<BR>
<P><B>Primary school:</B>&nbsp;<?php echo $school['School']['primary_school']; ?></P>
<BR>
<P><B>Province:</B>&nbsp;<?php echo $school['Catchment']['name']; ?></P>
<BR>
<P><B>District:</B>&nbsp;<?php echo $school['Area']['name']; ?></P>
<BR>
<P><B>District:</B>&nbsp;<?php echo $school['District']['name']; ?></P>
<BR>
<P><B>TRC:</B>&nbsp;<?php echo $school['School']['trc']; ?></P>
<BR>
<P><B>School code:</B>&nbsp;<?php echo $school['School']['school_code']; ?></P>
<BR>
<P><B>Type:</B>&nbsp;<?php echo $school['School']['type']; ?></P>
<BR>
<P><B>SN:</B>&nbsp;<?php echo $school['School']['sn']; ?></P>
<BR>
<P><B>Connectivity Type:</B>&nbsp;<?php echo $school['ConnectivityType']['name']; ?></P>
<BR>
<P><B>Intervention Type:</B>&nbsp;<?php echo $school['InterventionType']['name']; ?></P>
<BR>
<P><B>Service Provider:</B>&nbsp;<?php echo $school['ServiceProvider']['name']; ?></P>
<BR>
<P><B>Site State:</B>&nbsp;<?php echo $school['SiteState']['name']; ?></P>
<BR>
<P><B>Power Type:</B>&nbsp;<?php echo $school['PowerType']['name']; ?></P>
<BR>
<P><B>Road Condition:</B>&nbsp;<?php echo $school['RoadType']['name']; ?></P>
<BR>
<P><B>GPS Coordinates:</B>&nbsp;<?php echo $lat . ' ' . $lon . '<br>'; ?> </P>
<P><B>Map:</B></P>
    <?php
        // map should center around the coordinates that are passed to the view
        // otherwise it should default to "about Tanzania"
        if ( $lat != null && $lon != null ) {
            $defaultLat = $lat;
            $defaultLng = $lon;
        } else {
            $defaultLat = -5.6;
            $defaultLng = 36;
        }
        
        //echo '<pre> LAT ' . $lat . '</pre>';
        //echo '<pre> LON ' .  $lon . '</pre>';
        //echo '<pre> defaultLat ' . $defaultLat . '</pre>';
        //echo '<pre> defaultLon ' .  $defaultLng . '</pre>';
        
        # init map (prints container)
        echo $this->GoogleMapV3->map(array(
            'map'=>array(
                'defaultLat' => $defaultLat, # only last fallback, use Configure::write('Google.lat', ...); to define own one
                'defaultLng' => $defaultLng, # only last fallback, use Configure::write('Google.lng', ...); to define own one
                'defaultZoom' => 6,
            ),
            'div'=>array('height'=>'400', 'width'=>'100%'))
        );
    
        // map marker
        $options = array(
            'lat'=> $lat,
            'lng'=> $lon,
            // 'icon'=> 'url_to_icon', # optional
            'title' => '', # optional
            'content' => '<b>'.$school['School']['primary_school'].'</b><BR>Other school data here' # optional
         );
        echo $this->GoogleMapV3->addMarker($options);
        
        /*
        // not sure what an infowindow is - does not seem to work?
        $options = array(
            'latitude'=>-73.95144,
            'longitude'=>40.698,
            'content'=>'Thanks for using this'
        );
        echo $this->GoogleMapV3->addInfoWindow($options);
        */
        
        # print js
        echo $this->GoogleMapV3->script();
        
    ?>
</p>

<P><B></B><BR>
    <?php
    // list any uploaded files
    echo $this->Upload->view('School', $school['School']['id']);
    /* in case we want to do something more interesting with the list of files?
    $results = $this->Upload->listing('School', $school['School']['id']);
    $directory = $results['directory'];
    $baseUrl = $results['baseUrl'];
    $files = $results['files'];
    echo "<pre>".print_r($results)."</pre>";
    */
?>

<!--
number of pupils
headmaster
GPS coordinates
etc.
-->

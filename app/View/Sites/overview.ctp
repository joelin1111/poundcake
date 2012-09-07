<?php
    echo $this->Html->script('jquery-1.7.2');
    echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    echo $this->Html->script('gears_init');
?>

<div class="row">
<div class="span3">
<!--    <H3>Lorem Ipsum</H3>
    <ul>
        <li><?php //echo $this->Html->link(__('Edit TCs/TRCs'), array('action' => 'edit',$trc['Trc']['id'] )); ?></li>
    </ul>-->
    <?php echo $this->element('Common/legend'); ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">

<?php
    // maybe we could have used the Element for creating the map here, but this map
    // is bigger with different options, and so it might take just as much code
    // to do that as it is to just do it again manually

    $defaultLat = -5.6;
    $defaultLng = 36;

    // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper
    // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    // http://plugins.cakephp.org/package/marcferna/CakePHP-Google-Maps-V3-Helper
    $mapOptions = array(
        'id' => 'overview_map_canvas', // Map canvas ID
//        'width' => '300px',
//        'height' => '700px',
//        'style' => 'width: 98%; height:700px;', // CSS style for the map canvas
        'width' => '300px', // Width of the map
        'height'=>'300px', // Height of the map
        'style' => 'width: 100%; height:700px;', // CSS style for the map canvas
        
        'zoom' => 6, // lower = further out
        'type' => 'TERRAIN', // Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
        //'custom'=>null, // Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
        'latitude' => $defaultLat,	// default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'longitude' => $defaultLng,	// default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'address' => '', // 1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'localize' => false, // boolean to localize your position or not
        'marker' => false, // boolean to put a marker in the position or not
        //'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
        //'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
        //'windowText'=>'My Position'		//Default text inside the information window
    );
    echo $this->AltGoogleMapV3->map($mapOptions); //To add a map that localizes you

    // too many markers?
    // https://developers.google.com/maps/articles/toomanymarkers
    
    $icon = '/img/school.png';
    //$c = count($nearby);
    $i = 1; // the map helper doesn't like this to start at 0
    //echo "c is".$c;
    if ($sites != null) {
        foreach ($sites as $site) {
            ///echo "<pre>".print_r($site['Site']['location'])."</pre>";
            $lat = $site['Site']['location']['lat'];
            $lon = $site['Site']['location']['lon'];
            
            // this result set comes from a stored procedure, and makes the same
            // site_vf virtual field that's defined in the Site
            // model -- but technically this is not the same field, so FYI
            $windowText = $this->Html->link(
                $site['Site']['site_vf'],
                array('controller' => 'sites', 'action' => 'view', $site['Site']['id'])
            );
            
            $markerOptions= array(
                'id' => $i, // Id of the marker
                'latitude' => $lat,
                'longitude' => $lon,
                'markerIcon' => $icon,
                'address' => null, // mysteriously started complaining about this field not being present
                //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                'windowText' => $windowText // Text inside the information window
            );
            //echo "<pre>".print_r($markerOptions)."</pre>";
            echo $this->AltGoogleMapV3->addMarker('overview_map_canvas', $i, $markerOptions);
            $i++;
            unset($markerOptions); // lame attempt to free memory for the map
        }
    }
    unset($sites); // lame attempt to free memory for the map
    
?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
<?php
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
    <?php
        echo $this->element('Common/search');
        echo $this->element('Common/legend');
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2><?php echo $this->Session->read('project_name'); ?> Overview</h2>
    <div class="map-frame">
<?php
    // maybe we could have used an Element for creating the map here, but this map
    // is bigger with different options, and so it might take just as much code
    // to do that as it is to just do it again manually

    if (!isset($default_zoom))
        $default_zoom = 8;
    
    // https://github.com/marcferna/CakePHP-GoogleMapHelper
    // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    // http://plugins.cakephp.org/package/marcferna/CakePHP-Google-Maps-V3-Helper
    $mapOptions = array(
        'id' => 'map_canvas', // Map canvas ID
        'width' => '700px', // Width of the map
        'height'=>'700px', // Height of the map
        //'style' => '', // CSS style for the map canvas
        'style' => '98%; height:700px;', // CSS style for the map canvas
        'zoom' => $default_zoom, // lower = further out
        'type' => 'TERRAIN', // Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
        //'custom'=>null, // Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
        'latitude' => $default_lat,	// default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'longitude' => $default_lon,	// default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'address' => '', // 1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'localize' => false, // boolean to localize your position or not
        'marker' => false, // boolean to put a marker in the position or not
        //'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
        //'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
        //'windowText'=>'My Position'		//Default text inside the information window
    );
    echo $this->GoogleMap->map($mapOptions); //To add a map that localizes you

    // too many markers?
    // https://developers.google.com/maps/articles/toomanymarkers
    
    $i = 1; // the map helper doesn't like this to start at 0
    if ($sites != null) {
        foreach ($sites as $site) {
            ///echo "<pre>".print_r($site['Site']['location'])."</pre>";
            $lat = $site['Site']['lat'];
            $lon = $site['Site']['lon'];
            
            $icon = 'data:'.$site['SiteState']['img_type'].';base64,'.base64_encode( $site['SiteState']['img_data'] );
            
            $windowText = $this->Html->link(
                $site['Site']['site_vf'],
                array('controller' => 'sites', 'action' => 'view', $site['Site']['id'])
            );
            
            $windowText .= '<BR>'.$site['Zone']['name'];
            $windowText .= '<BR>'.$site['Organization']['name'];

            $position = array(
                'latitude' => $default_lat,
                'longitude' => $default_lon
            );
            
            $markerOptions = array(
                'id' => $i, // Id of the marker
                'latitude' => $lat,
                'longitude' => $lon,
                'markerIcon' => $icon,
                'position' => null,
                'address' => null, // mysteriously started complaining about this field not being present
                //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                'windowText' => $windowText // Text inside the information window
            );
           
            //echo "<pre>".print_r($markerOptions)."</pre>";
            echo $this->GoogleMap->addMarker('map_canvas', $i, $position, $markerOptions);
            $i++;
            //unset($markerOptions); // lame attempt to free memory for the map
        }
    }
    unset($sites); // lame attempt to free memory for the map
?>
</div> <!-- /.map-frame -->
</div> <!-- /.span9 -->
</div> <!-- /.row -->
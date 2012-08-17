<?php
    // if there is no lat/long, we still need one so pick something that is
    // about the center of Tanzania
    // set the zoom way out (lower value)
    // don't set a placemarker
    //if ( isset($lat == null && $lon == null ) {
    // if ( !isset($lat) && !isset($lon) ) {

    if ( !is_numeric($lat) && !is_numeric($lon) ) {
        $lat = -5.6;
        $lon = 36;
        $zoom = 5;
        $marker = false;
    } else {
        // zoom in and set a placemarker
        $zoom = 10;
        $marker = true;
    }
    
//    echo "Lat is ". $lat . "<br>";
//    echo "Lon is ". $lon . "<br>";
//    echo "Zoom is ". $zoom . "<br>";
//    echo "Marker is ". $marker . "<br>";
    
    // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper
    // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    // http://plugins.cakephp.org/package/marcferna/CakePHP-Google-Maps-V3-Helper
    $mapOptions = array(
        'id' => 'map_canvas', // Map canvas ID
        'width' => '300px', // Width of the map
        'height'=>'300px', // Height of the map
        'style' => 'width: 98%; height:300px;', // CSS style for the map canvas
        'zoom' => $zoom,
        'type' => 'TERRAIN', // Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
        //'custom'=>null, // Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
        'latitude' => $lat,	// default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'longitude' => $lon,	// default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'address' => null, //1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
        'localize' => false, // boolean to localize your position or not
        'marker' => $marker, // boolean to put a marker in the position or not
        //'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
        'markerIcon' => $icon,
        //'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
        //'windowText' => 'foo'//$windowText // text inside the information window
        'windowText' => $windowText
    );
    //echo "<pre>".print_r($mapOptions)."</pre>";
    echo $this->AltGoogleMapV3->map($mapOptions); //To add a map that localizes you
?>
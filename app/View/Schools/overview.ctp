<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2'); # or wherever it is in your js folder
    # include the map js code
    echo $this->Html->script($this->GoogleMapV3->apiUrl());
    
    // Marc Fernandez helper 
    //$this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    //$this->Html->script('http://code.google.com/apis/gears/gears_init.js',false);

/*
    if (Configure::read('debug') == 0):
	throw new NotFoundException();
    endif;
    App::uses('Debugger', 'Utility');
    */
?>

<P>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</P>

<P>
    Note:  This version of overview map uses the Rajib Ahmed map helper, version 0.10.12
</P>

<?php

    $defaultLat = -5.6;
    $defaultLng = 36;
    /*
    echo $this->GoogleMapV3->map(array('map'=>array(
        'defaultLat' => $defaultLat, # only last fallback, use Configure::write('Google.lat', ...); to define own one
        'defaultLng' => $defaultLng, # only last fallback, use Configure::write('Google.lng', ...); to define own one
        'defaultZoom' => 6,
    ),'div'=>array('id'=>'school_map', 'height'=>'400', 'width'=>'100%')));
    */

    # init map (prints container)/*
    echo $this->GoogleMapV3->map(array(
        'id' => 'map_container',
        'map'=>array(
            'defaultLat' => $defaultLat, # only last fallback, use Configure::write('Google.lat', ...); to define own one
            'defaultLng' => $defaultLng, # only last fallback, use Configure::write('Google.lng', ...); to define own one
            'defaultZoom' => 6,
        ),
        'div'=>array('height'=>'500', 'width'=>'100%'))
    );

    
   /*  This is for the Marc Fernandez helper (that I cannot seem to get to work)
   // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    $mapOptions = array(
            'id'=>'map_canvas',				//Map canvas ID
            'width'=>'800px',				//Width of the map
            'height'=>'800px',				//Height of the map
            'style' => 'body',			//CSS style for the map canvas
            'zoom'=>7,						//Zoom
            'type'=>'HYBRID', 				//Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
            'custom'=>null,					//Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
            'latitude'=>40.69847032728747,	//Default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            'longitude'=>-1.9514422416687,	//Default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            'address'=>"1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            'localize'=>true,				//Boolean to localize your position or not
            'marker'=>true,					//Boolean to put a marker in the position or not
            'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
            'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
            'windowText'=>'My Position'		//Default text inside the information window
    );
    echo $this->GoogleMapV3->map($mapOptions); //To add a map that localizes you
    //echo $this->GoogleMapV3->map();  
    */
    
    if ($schools != null) {
        //echo '<LI>'.$schools[$i]['School']['primary_school'].'</LI>';
        //echo '<pre> LAT ' . $lat . '</pre>';
        //echo '<pre> LON ' .  $lon . '</pre>';
        //echo '<pre> defaultLat ' . $defaultLat . '</pre>';
        //echo '<pre> defaultLon ' .  $defaultLng . '</pre>';
     
       $i=0; 
       foreach ($schools as $school) {
           /*
           echo '<LI>';
           echo $schools[$i]['School']['primary_school'] . ' - ';
           echo $schools[$i]['School']['id'] . ' - ';
           echo $schools[$i]['School']['location']['lat'] . ' ';
           echo $schools[$i]['School']['location']['lon'];
           ////echo print_r($schools[$i]);
           echo '</LI>';
           */
           //echo "<pre>".print_r($school['School'])."</pre>";
           //$lat = $schools[$i]['School']['location']['lat'];
           //$lon = $schools[$i]['School']['location']['lon'];
           $lat = $school['School']['location']['lat'];
           $lon = $school['School']['location']['lon'];
           $primary_school = $school['School']['primary_school'];
           // this is sort of a guess
           $link = "http://" . $_SERVER['HTTP_HOST'] ."/schools/view/" . $school['School']['id'];
           //echo $link;
           // See all options:
           // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper/blob/master/google_map_v3.php
           
           /*
            Marc Fernandez helper 
            $markerOptions= array(
			'id'=>$i,							//Id of the marker
			'latitude'=>40.69847032728747,		//Latitude of the marker
			'longitude'=>-1.9514422416687,		//Longitude of the marker
			//'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png', //Custom icon
			//'shadowIcon'=>'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
			'infoWindow'=>true,					//Boolean to show an information window when you click the marker or not
			'windowText'=>'Marker'				//Default text inside the information window
		);
           //echo $this->GoogleMapV3->addMarker(array(id=>'map_canvas','latitude'=>40.69847,'longitude'=>-73.9514));
            echo $this->GoogleMapV3->addMarker($i,'map_canvas',$markerOptions);
  		$i++;	
                */
           $options = array(
                'lat' => $lat,
                'lng' => $lon,
                'marker'=>true,
                'title' => $primary_school,
                'content' => '<b>'.$primary_school.'</b><BR>Other school data here<BR><a href="'.$link.'">View more</a>', # optional
                'infoWindow'=> true // show an information window when you click the marker
            );
           
            //echo "";
            echo $this->GoogleMapV3->addMarker($options);
            //echo "y";
        }
    }
    
    echo $this->GoogleMapV3->script();

    // to-do: check this out
    // http://911-need-code-help.blogspot.com/2011/03/zoom-to-fit-all-markers-on-google-map.html
    ?>
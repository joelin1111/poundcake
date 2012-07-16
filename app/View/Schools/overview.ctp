<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2'); # or wherever it is in your js folder
    # include the map js code
    echo $this->Html->script($this->GoogleMapV3->apiUrl());
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
    
    # init map (prints container)
    echo $this->GoogleMapV3->map(array(
        'map'=>array(
            'defaultLat' => $defaultLat, # only last fallback, use Configure::write('Google.lat', ...); to define own one
            'defaultLng' => $defaultLng, # only last fallback, use Configure::write('Google.lng', ...); to define own one
            'defaultZoom' => 6,
        ),
        'div'=>array('height'=>'400', 'width'=>'100%'))
    );

    if ($schools != null) {
        //echo '<LI>'.$schools[$i]['School']['primary_school'].'</LI>';
        //echo '<pre> LAT ' . $lat . '</pre>';
        //echo '<pre> LON ' .  $lon . '</pre>';
        //echo '<pre> defaultLat ' . $defaultLat . '</pre>';
        //echo '<pre> defaultLon ' .  $defaultLng . '</pre>';
       
       for($i = 0; $i < sizeof($schools); ++$i) {
           /*
           echo '<LI>';
           echo $schools[$i]['School']['primary_school'] . ' - ';
           echo $schools[$i]['School']['id'] . ' - ';
           echo $schools[$i]['School']['location']['lat'] . ' ';
           echo $schools[$i]['School']['location']['lon'];
           ////echo print_r($schools[$i]);
           echo '</LI>';
           */
           
           $lat = $schools[$i]['School']['location']['lat'];
           $lon = $schools[$i]['School']['location']['lon'];
           
           // See all options:
           // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper/blob/master/google_map_v3.php
           $options = array(
                'lat' => $lat,
                'lng' => $lon,
               'marker'=>true,
                // not sure why this doesn't work:
                //'lat' => $schools[$i]['School']['location']['lon'],
                //'lng' => $schools[$i]['School']['location']['lat'],
                'title' => $schools[$i]['School']['primary_school'], # optional
                'content' => '<b>'.$schools[$i]['School']['primary_school'].'</b><BR>Other school data here', # optional
                'infoWindow'=>true, // show an information window when you click the marker
                
               ////'link' => 'http://www.bing.com'
            );
            echo $this->GoogleMapV3->addMarker($options);
        }
    }
    
    echo $this->GoogleMapV3->script();

    // to-do: check this out
    // http://911-need-code-help.blogspot.com/2011/03/zoom-to-fit-all-markers-on-google-map.html
    ?>
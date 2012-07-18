<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2'); # or wherever it is in your js folder
    # include the map js code
    echo $this->Html->script($this->GoogleMapV3->apiUrl());
?>

<P>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</P>

<P>
    <I>Note:  This version of overview map uses the Rajib Ahmed map helper, version 0.10.12.</I>
</P>

<?php

    $defaultLat = -5.6;
    $defaultLng = 36;

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

           $options = array(
                'lat' => $lat,
                'lng' => $lon,
                'marker'=>true,
                'title' => $primary_school,
                'content' => '<b>'.$primary_school.'</b><BR>Lorem ipsum dolor sit amet<BR><a href="'.$link.'">More Detail</a>', # optional
                'infoWindow'=> true // show an information window when you click the marker
            );
            echo $this->GoogleMapV3->addMarker($options);
        }
    }
    
    echo $this->GoogleMapV3->script();

    // to-do: check this out
    // http://911-need-code-help.blogspot.com/2011/03/zoom-to-fit-all-markers-on-google-map.html
    ?>
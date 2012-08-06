<?php
    // include Jquery
    //echo $this->Html->script('jquery-1.7.2'); # or wherever it is in your js folder
    // include the map js code
    //echo $this->Html->script($this->GoogleMapV3->apiUrl());
    
    // Marc Fernandez helper 
    echo $this->Html->script('http://maps.google.com/maps/api/js?sensor=true',false);
    //$this->Html->script('http://code.google.com/apis/gears/gears_init.js',false);
    echo $this->Html->script('gears_init');
    
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
    <I>Note: This version of overview map uses the Marc Fernandez map helper, version 2.0.</I>
</P>

<P>
    
</P>
<?php
    echo $this->Form->create('School', array(
        'url' => array_merge(array('action' => 'index'), $this->params['pass'])
    ));
    if ($schools != null) {
        //echo '<LI>'.$schools[$i]['School']['site_name'].'</LI>';
        //echo '<pre> LAT ' . $lat . '</pre>';
        //echo '<pre> LON ' .  $lon . '</pre>';
        //echo '<pre> defaultLat ' . $defaultLat . '</pre>';
        //echo '<pre> defaultLon ' .  $defaultLng . '</pre>';
     
       $i = 0; 
       foreach ($provinces as $province) {
           $i++;
           //$this->Form->checkbox("School.province.1", array("value"=>"1"));
           //echo "<BR>";
           
           //echo $this->Form->checkbox("foo", array("value"=>$i));
           //echo "<label for=".$i.">".$province['name']."</label>";
           /*
           echo $this->Form->input('Provice.name', array(
                'type' => 'select', 
                'multiple' => 'checkbox',
                'options' => array(
                'Value 1' => 'Label 1',
                'Value 2' => 'Label 2'
            )
            ));
           */
           }
    }
            echo $this->Form->input('Province.name', array(
                'type' => 'select', 
                'multiple' => 'checkbox',
                'options' => array(
                        'Value 1' => 'Zanzibar',
                        'Value 2' => 'Mwtara'
                )
            ));
    ////echo $this->Form->input('site_name', array('div' => false));
    //echo $this->Form->input('district', array('div' => false));
    //echo $this->Form->input('district', array('div' => false, 'options' => $schools));
    echo $this->Form->submit(__('Search', true), array('div' => false));
    echo $this->Form->end();
    
    //serialize the form element to submit
 
    $data = $this->Js->get('#UserMyaddForm')->serializeForm(
                                                array(
                                                'isForm' => true,
                                                'inline' => true)
                                            );
 
    // Submit the serialize data on submit click
 
    $this->Js->get('#UserMyaddForm')->event(
          'submit',
          $this->Js->request(
            array('action' => 'myadd'),
            array(
                    'update' => '#HiOutput', // element to update
                                             // after form submission
                    'data' => $data,
                    'async' => true,
                    'dataExpression'=>true,
                    'method' => 'POST'
                )
            )
        );
 
    // User Form 
 
    echo $this->Form->create('User', array(
                                        'action' => 'myadd',
                                        'default' => false)  // stop Form's
                                                            // general submit
                                    );
    echo __('Add User');
    echo $this->Form->input('username');
    echo $this->Form->input('password');
    echo $this->Form->end(__('Submit'));
    echo $this->Js->writeBuffer();  // cache the js code generated
?>
?>
<P>
<?php

    $defaultLat = -5.6;
    $defaultLng = 36;

    // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper
    // http://marcferna.tumblr.com/post/3580268729/google-maps-api-v3-cakephp-helper
    // http://plugins.cakephp.org/package/marcferna/CakePHP-Google-Maps-V3-Helper
    $mapOptions = array(
            'id'=>'map_canvas', // Map canvas ID
            'width'=>'800px', // Width of the map
            'height'=>'800px', //Height of the map
            'style' => 'width: 100%; height:400px;', //CSS style for the map canvas
            //'zoom'=>7, //Zoom
            'type'=>'ROADMAP', // Type of map (ROADMAP, SATELLITE, HYBRID or TERRAIN)
            //'custom'=>null, // Any other map option not mentioned before and available for the map. For example 'mapTypeControl: true' (http://code.google.com/apis/maps/documentation/javascript/controls.html)
            'latitude'=> $defaultLat,	// default latitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            'longitude'=> $defaultLng,	// default longitude if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            //'address'=>"1 Infinite Loop, Cupertino", //Default address if the browser doesn't support localization or you don't want localization (Latitude & Langitude have priority versus Address)
            'localize'=> false, // boolean to localize your position or not
            'marker' => false, // boolean to put a marker in the position or not
            //'markerIcon'=>'http://google-maps-icons.googlecode.com/files/home.png',	//Default icon of the marker
            //'infoWindow'=>true,				//Boolean to show an information window when you click the marker or not
            //'windowText'=>'My Position'		//Default text inside the information window
    );
    echo $this->AltGoogleMapV3->map($mapOptions); //To add a map that localizes you
    //echo $this->AltGoogleMapV3->map();  

    if ($schools != null) {
        //echo '<LI>'.$schools[$i]['School']['site_name'].'</LI>';
        //echo '<pre> LAT ' . $lat . '</pre>';
        //echo '<pre> LON ' .  $lon . '</pre>';
        //echo '<pre> defaultLat ' . $defaultLat . '</pre>';
        //echo '<pre> defaultLon ' .  $defaultLng . '</pre>';
     
       $i = 0; 
       foreach ($schools as $school) {
           /*
           echo '<LI>';
           echo $schools[$i]['School']['site_name'] . ' - ';
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
           $site_name = $school['School']['site_name'];
           // this is sort of a guesshah
           $link = "http://" . $_SERVER['HTTP_HOST'] ."/schools/view/" . $school['School']['id'];
           
            $windowText = $site_name."<br>Lorem ipsum dolor sit amet<BR><A HREF=\"".$link."\">More Detail</A>";
            //echo $link;
           // See all options:
           // https://github.com/marcferna/CakePHP-Google-Maps-V3-Helper/blob/master/google_map_v3.php
           
           $markerOptions= array(
                'id' => $i, //Id of the marker
                'latitude' => $lat,
                'longitude' => $lon,
                'markerIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom icon
                'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                'windowText' => $windowText // Text inside the information window
            );
            echo $this->AltGoogleMapV3->addMarker("map_canvas", ++$i, $markerOptions);
        }
    }
?>
</P>
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
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.services');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.extensions');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.microformat');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.overlays');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.services');
?>

<div class="row">
<div class="span9">
    <h2><?php echo $this->Session->read('project_name'); ?> Topology</h2>
    
    <p>
    <i class="icon-warning-sign"></i>&nbsp;This page is in development and should not be relied upon.
    </p>
    
    <div class="map-frame-large">
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
        'width' => '960px', // Width of the map
        'height'=>'700px', // Height of the map
        //'style' => '', // CSS style for the map canvas
        'style' => '98%; height:700px;', // CSS style for the map canvas
        'zoom' => $default_zoom, // lower = further out
        'tags' => 'foo',
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
        $last_site = "";
        foreach ($sites as $site) {
//            echo "<pre>".print_r( $site )."</pre>";
            
            // if we just added a placemarker for this site, we don't need to add
            // another
            if ( $site['name'] != $last_site ) {
                $lat = $site[ 'src_lat' ];
                $lon = $site[ 'src_lon' ];

                $status = $site['is_down'];
                if (isset($status)) {
                    if ( $status == 0 ) {
                         $icon = '/img/sites/green.png';
                    } elseif ( ( $status > 0 ) && ( $status < 1 )) {
                        $icon = '/img/sites/yellow.png';
                    } elseif ( $status == 1 ) {
                         $icon = '/img/sites/red.png';
                    }
                }
                else {
                     $icon = '/img/sites/grey.png';
                }

                $windowText = $this->Html->link(
                    $site['site_vf'],
                    array('controller' => 'sites', 'action' => 'view', $site['id'])
                );
                // is_down of 0 means all sites are up, 1 means all sites are down,
                // so we'll inverse it here for display only
                // var_dump($site['is_down']);
                if ( is_null( $site['is_down'] )) {
                    $status = 'Unknown';
                } elseif ( $site['is_down'] > 0 ) {
                    $status = ( 1 - $site['is_down'] ) * 100;
                    $status = sprintf("%.0f%%",$status). ' Up';
                } else {
                    $status = '100% Up';
                }
                
                $windowText .= "<BR>$status";
                
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
                    //'markerTitle' => 'foobar',
                    'address' => null, // mysteriously started complaining about this field not being present
                    //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                    'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                    'windowText' => $windowText // Text inside the information window
                );


                //echo "<pre>".print_r($markerOptions)."</pre>";
                echo $this->GoogleMap->addMarker('map_canvas', $i, $position, $markerOptions);
            }
        
            if ( isset($site['src_lat']) && isset($site['src_lon']) && isset($site['dest_lat']) && isset($site['dest_lon']) ) {
                echo $this->GoogleMap->addPolyline(
                    "map_canvas",
                    "polyline1",
                    array (
                        "start" => array("latitude" =>$site['src_lat'] ,"longitude"=> $site['src_lon']),
                        "end" => array("latitude" =>$site['dest_lat'] ,"longitude"=> $site['dest_lon'])
                    ),
                    array (
                        'strokeColor' => '4747B2',
                        'strokeOpacity' => '0.5',
                        'strokeWeight' => '3'
                    )
                );
            }
            // keep track of the last site's name so we don't duplicate placemarkers
            // I am assuming that this array is sorted here... but I think it is
            // a safe assumption since it comes from the Sites->find method
            // in the controller
            $last_site = $site['name'];
            $i++;
            //unset($markerOptions); // lame attempt to free memory for the map
        }
    }
    unset($sites); // lame attempt to free memory for the map
?>
</div> <!-- /.map-frame -->
</div> <!-- /.span9 -->
</div> <!-- /.row -->
<BR>

<div class="row" align="center">
    <div class="span3" align="center"> <?php echo $this->Html->image('/img/sites/green.png'); ?> All nodes up</div>
    <div class="span3" align="center"> <?php echo $this->Html->image('/img/sites/yellow.png'); ?> Some nodes down</div>
    <div class="span3" align="center"> <?php echo $this->Html->image('/img/sites/red.png'); ?> All nodes down</div>
    <div class="span3" align="center"> <?php echo $this->Html->image('/img/sites/grey.png'); ?> Node status unknown</div>
</div>
<BR><BR>
<?php
    // this refresh is just blatantly copied from
    // http://cyberschool.fateback.com/how/countdown-refresh.html
    // can probably be improved upon...
?>
<center>
Next page refresh: <span id=counter> </span>
<br>
<a href="javascript:self.location.reload()">Click</a> to refresh now
<BR>

</center>

<SCRIPT LANGUAGE="JavaScript">
<!--
var counterobj = document.all ? counter : document.getElementById("counter");

var countdownfrom = 140;	//countdown period in seconds
var currentsecond = counterobj.innerHTML = countdownfrom+1; 

function countdown() {
    if (currentsecond != 1) {
        currentsecond -= 1;
        
        hours = parseInt( currentsecond / 3600 ) % 24;
        minutes = parseInt( currentsecond / 60 ) % 60;
        seconds = currentsecond % 60;
        if ( seconds < 10)
            seconds = "0" + seconds;
        counterobj.innerHTML = minutes + ":" + seconds;
        //counterobj.innerHTML = currentsecond;
        
    } else {
        self.location.reload();
        return;
    }
    setTimeout("countdown()",1000)
}

countdown()
//-->
</script>

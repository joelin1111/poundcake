<?php
    echo $this->Html->script('jquery-1.7.2');
    
    // http://www.appelsiini.net/projects/jeditable
    // echo $this->Html->script('jquery.jeditable.mini');
    
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
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Site', array('action'=>'edit', $site['Site']['id']),1);?></li>
        <li><?php echo $this->Html->link('List Sites', array('action'=>'index')); ?></li>
        <li><?php echo $this->MyHTML->postLinkIfAllowed(__('Delete'), array('action' => 'delete', $this->Form->value('Site.id')), null, __('Are you sure you want to delete site %s?', $this->Form->value('Site.site_id'))); ?></li>
        <li><?php echo $this->Html->link('Equipment List', array('action'=>'view', 'ext'=>'pdf', $site['Site']['id']));?></li>
        <li><?php
            //echo $this->Html->link('Work Order', array('action'=>'workorder', $site['Site']['id']));
            echo $this->Html->link('Work Order', array('action'=>'workorder','ext'=>'xml', $site['Site']['id']));?>
        </li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <div class="row">
        <h2><?php echo $site['Site']['site_code']." ".$site['Site']['site_name'].' ('.$site['SiteState']['name'].')'?> </h2>            
        <div class="span4">
            <P><B>Site contacts:</B>&nbsp;
                <?php
                    if (!isset($contacts)) {
                        echo "None";
                    } else {
                        //$c = count($contacts);
                        //echo "<UL>";
                        echo "<P>";
                        foreach ($contacts as $contact) {
                            //echo "<LI>";
                            echo "<I>Priority ".$contact['Contact']['priority']."</I><BR>";
                            echo $this->Html->link(($contact['Contact']['name_vf']), array(
                                'controller' => 'contacts',
                                'action' => 'view',
                                $contact['Contact']['id']));
                            echo "<BR>".$contact['Contact']['phone']."</P>";
                            //echo "</LI>";
                        }
                        //echo "</UL>";
                    }
                ?>
            </P>
            <P><B>GPS Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['lat']) . ' ' . sprintf("%01.5f",$site['Site']['lon']) . '<br>'; ?> </P>
            <P><B>Magnetic declination:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['declination']); ?></P>
        </div>
        <div class="well well-small span4">
        <P><B>Quick Stats:</B>&nbsp;
        <?php
            echo $this->Form->create('Site', array('action' => 'view'));
            echo $this->Form->input('sites', array('type'=>'select','options' => $sites,'label' => ''));
            echo $this->Form->end;
        ?>
        <div id="RemoteSite">
            (Select Remote Site)
        </div>
    </div> <!-- ./well -->
    </div> <!-- ./row -->
    
    <P><B>Zone:</B>&nbsp;<?php echo $site['Zone']['name']; ?></P>
    
    <?php
        // some of the sites may have apostrophes in their name
        // addslashes seems to take care of that (since the map
        // will throw an exception)
        $windowText = addslashes($site['Site']['site_vf']);
        
        // draw the main map
        $icon = 'data:'.$site['SiteState']['img_type'].';base64,'.base64_encode( $site['SiteState']['img_data'] );
        echo $this->element('Common/map',
                array(
                    'windowText' => 'oo',//$windowText,
                    'lat' => $site['Site']['lat'],
                    'lon' => $site['Site']['lon'],
                    'icon' => $icon
                    )
                );
        /*/* placemarkers for nearby sites
        //print_r($nearby);
        $icon = '';
        $c = count($nearby);
        $i = 2;
        //echo "c is".$c;
        if ($c > 0) {
            foreach ($nearby as $s) {
                //echo "<pre>".print_r($s)."</pre>";
                //echo $s['distance'];
                $distance = sprintf ("%01.2f", $s[0]['distance']);
                $lat = $s[0]['lat'];
                $lon = $s[0]['lon'];
                // this result set comes from a stored procedure, and makes the same
                // site_vf virtual field that's defined in the Site
                // model -- but technically this is not the same field, so FYI
                $siteUrl = $this->Html->link(
                    $s[0]['site_vf'],
                    array('controller' => 'sites', 'action' => 'view', $s['sites']['id'])
                );
                //$windowText = $siteUrl."<BR>".$s['schools']['site_name']. "<BR>Distance: ".$distance." Km";
                $windowText = $siteUrl."<BR>Distance: ".$distance." Km";


                $markerOptions= array(
                    'id' => $i, // Id of the marker, on this page we only have 1 so we can hardcode that
                    'latitude' => $lat,
                    'longitude' => $lon,
                    'markerIcon' => $icon, //Custom icon
                    //'address'=> "", # mysteriously started complaining about this field not being present
                    //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                    'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                    'windowText' => $windowText // Text inside the information window
                );
                echo $this->AltGoogleMapV3->addMarker('map_canvas', $i, $markerOptions);
                $i++;
            }
        }
        */
    ?>
    </p>

    <P><B>Tower Guard</B>:&nbsp;<?php echo $site['Site']['tower_guard'];?></P>
    <P><B>Structure Type</B>:&nbsp;<?php echo $site['Site']['structure_type'];?></P>
    <P><B>Description</B>:&nbsp;<?php echo $site['Site']['description'];?></P>
    <P><B>Mounting</B>:&nbsp;<?php echo $site['Site']['mounting'];?></P>
    <P><B>Access</B>:&nbsp;<?php echo $site['Site']['access'];?></P>
    <P><B>Storage</B>:&nbsp;<?php echo $site['Site']['storage'];?></P>
    <P><B>Accommodations</B>:&nbsp;<?php echo $site['Site']['accommodations'];?></P>
    <P><B>Notes</B>:&nbsp;<?php echo $site['Site']['notes'];?></P>
    <P><B>Install Team:</B>&nbsp;<?php echo $site['InstallTeam']['name']; ?></P>
    <P><B>Install Date:</B>&nbsp;<?php
        // format the date as per the project's defined format
        $date = $site['Site']['install_date'];
        $format = $site['Project']['datetime_format'];
        echo date($format,strtotime($date));    
    ?></P>
    <P><B>Organization:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['Organization']['name'],
                array(
                    'controller' => 'organizations',
                    'action' => 'view',
                    $site['Organization']['id']));
    ?></P>
    
    <P><B>Tower Type:</B>&nbsp;<?php echo $site['TowerType']['name']; ?></P>
    <P><B>Tower Member:</B>&nbsp;<?php echo $site['TowerMember']['name']; ?></P>
    <P><B>Tower Mount:</B>&nbsp;<?php echo $site['TowerMount']['name']; ?></P>
    <P><B>Equipment Space:</B>&nbsp;<?php echo $site['EquipmentSpace']['name']; ?></P>
    
    <P><B>Power Type:</B>&nbsp;<?php echo $site['PowerType']['name']; ?></P>
    <P><B>Switch:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['NetworkSwitch']['name'],
                array(
                    'controller' => 'networkSwitches',
                    'action' => 'view',
                    $site['NetworkSwitch']['id']));
    ?></P>
    <P><B>Router:</B>&nbsp;<?php
        echo $this->Html->link(
                $site['NetworkRouter']['name'],
                array(
                    'controller' => 'networkRouters',
                    'action' => 'view',
                    $site['NetworkRouter']['id']));
    ?></P>
    
    <P><B>Radios:</B>&nbsp;
        <?php
        //print_r($site);
        $c = count($site['NetworkRadios']);
        //echo "c is".$c;
        if ($c == 0) {
            echo "None";
        } else {
            echo "<table class=\"table table-condensed table-striped\">";
            echo "<th>Radio</th>";
            echo "<th>Switch Port</th>";
            echo "<th>Frequency</th>";
            echo "<th>SSID</th>";
            foreach ($site['NetworkRadios'] as $radio) {
                echo "<tr><td>";
                echo $this->Html->link(__($radio['name']), array(
                    'controller' => 'networkRadios',
                    'action' => 'view',
                    $radio['id']));
                echo "</td>";
                
                echo '<td>';
                if (!empty($radio['switch_port'])) {
                     echo $radio['switch_port'];
                } else {
                    echo "-";
                }
                echo "</td>";
                
                echo "<td>";
                if (!empty($radio['frequency'])) {
                     echo $radio['frequency'];
                } else {
                    echo "-";
                }
                echo "</td>";
                
                echo "<td>";
                if (!empty($radio['ssid'])) {
                     echo $radio['ssid'];
                } else {
                    echo "-";
                }
                echo "</td>";
                
                echo "</tr>";
            }
            echo "</table>";
        }
        ?>
    </P>
    
    <?php echo $this->element('Common/addrpool_data'); ?>
    
    <P><B>Files:</B><BR>
        <?php
            // get any attached files
            $results = $this->Upload->listing('Site', $site['Site']['id']);
            // echo print_r($results['files']);
            // maybe test if the file exists here?
            if ($results['files'] != null) {
                // list any uploaded files
                //echo $this->Upload->view('Site', $site['Site']['id']);

                $directory = $results['directory'];
                $baseUrl = $results['baseUrl'];
                $files = $results['files'];
                foreach ($files as $file) {
                    
                    /*
                    // this is sort of experimental, a follow-up to PC-244
                    // use exiftool to set/view EXIF orientation flags for testing
                    // e.g.
                    // $ exiftool -n -Orientation=3 case3.jpg
                    // $ exiftool *.jpg | grep Orientation
                    //
                    // Also see:  http://stackoverflow.com/questions/3657023/how-to-detect-shot-angle-of-photo-and-auto-rotate-for-website-display-like-desk
                    //
                    // if the image is a JPEG, check the EXIF for orientation flag
                    // this is really a one-time operation
                    if( exif_imagetype($file) == IMAGETYPE_JPEG ){
                        $exif = exif_read_data($file);
//                        echo '<pre>';
//                        print_r($exif);
//                        echo '</pre>';
                            
                        if (isset($exif['Orientation'])) {
                            $orientation = $exif['Orientation'];
                            $deg = 0;
                            switch ($orientation) {
                                // not 100% sure about these case-degree mappings
                                case 3:
                                  $deg = 180;
                                  break;
                                // 4 is 180 & mirror
                                // 5 is 90 & mirror
                                case 6:
                                  $deg = -90;
                                  break;
                                // 7 is -90 & mirror
                                case 8:
                                  $deg = 90;
                                  break;
                            }
                            $source = imagecreatefromjpeg($file);
                            $rotate = imagerotate($source, $deg, $orientation);
                            // this actually re-saves the file,
                            // and in so doing destroys the EXIF data
                            // so this routine won't get called again
                            //imagejpeg($rotate,$file);
                        }
                    }
                    */
                    
                    $f = basename($file);                    
                    $url = $baseUrl . "/$f";
                    echo "<P>";
                    echo $this->PhpThumb->thumbnail($url, array('w' => 100, 'h' => 100, 'zc' => 1));
                    echo "<BR>";
                    echo '<a href="'.$url.'">'.$f.'</a>';
                    echo "</P>";
                }
                
            } else {
                echo "None";
            }
            
            

            /* in case we want to do something more interesting with the list of files?
            $results = $this->Upload->listing('Site', $site['Site']['id']);
            $directory = $results['directory'];
            $baseUrl = $results['baseUrl'];
            $files = $results['files'];
            echo "<pre>".print_r($results)."</pre>";
            */
        ?>
    </P>
    
    <?php
        // maybe time format should also be set in the Site properties
        // we already got the date format (above) so just tack on the time
        $format .= " - g:m A"
    ?>
    <P><B>Last Modified:</B>&nbsp; <?php echo date($format, strtotime( $site['Site']['modified'] )); ?>    
    </P>
            
    </div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php

// draw links to remote sites
// and put placemarkers there, too
// 
// 
//    echo '<pre>';
//    print_r($radios);
//    echo '</pre>';
    $i = 1; // markers must start at 1
    if (count($radios) > 0) {
        //echo '<pre>';
        foreach ($radios as $radio) {
//            echo '<pre>';
//            //print_r($radio);
//            echo "Link Lat: ". $radio['NetworkRadios']['link_lat'];
//            echo '</pre>';
//            
            // it seems it's possible for a radio to get here without a lat/lon set on its link?
            if (isset($radio['NetworkRadios']['link_lat'])) {
                $link_lat = $radio['NetworkRadios']['link_lat'];
                $link_lon = $radio['NetworkRadios']['link_lon'];
                $windowText = $radio['NetworkRadios']['window_text'];
                if (($link_lat != null) && ($link_lon != null)) {
                    echo $this->GoogleMap->addPolyline(
                            "map_canvas",
                            "polyline1",
                            array (
                                "start" => array("latitude" =>$site['Site']['lat'] ,"longitude"=> $site['Site']['lon']),
                                "end" => array("latitude" =>$link_lat ,"longitude"=> $link_lon)
                            ),
                            array (
                                'strokeColor' => '4747B2',
                                'strokeOpacity' => '0.5',
                                'strokeWeight' => '3'
                            )
                            );

                    $markerOptions = array (
                       'id' => $i, // Id of the marker
                       'latitude' => $link_lat,
                       'longitude' => $link_lon,
                       'markerIcon' => $radio['NetworkRadios']['link_icon'],
                       'position' => null,
                       'address' => null, // mysteriously started complaining about this field not being present
                       //'shadowIcon' => 'http://google-maps-icons.googlecode.com/files/home.png', //Custom shadow
                       'infoWindow' => true, // Boolean to show an information window when you click the marker or not
                       'windowText' => $windowText // Text inside the information window
                   );

                    //echo '</pre>';
                    // position is required by addMarker
                    $position = array(
                        'latitude' => $site['Site']['lat'],
                        'longitude' => $site['Site']['lon']
                    );
                    //echo "<pre>".print_r($markerOptions)."</pre>";
                    echo $this->GoogleMap->addMarker('map_canvas', $i, $position, $markerOptions);
                    $i++;
                }
            }
        }
        
    }
    
?>

<?php
    //$this->Js->get('#SiteSites')->event('change', $this->Js->alert('Compute Distance To Selected Site'));    
    //$this->Js->get('#SiteSites')->event('change', $this->Js->text('bar'));
    /*
    $this->Js->get('#SiteSites');
    $this->Js->get('#SiteSites')->event('change',
        $this->Js->each('$(this).css({color: "red"});')
    );
    */
    /*
    $this->Js->get('#SiteSites')->event('change',
        $this->Js->request(
                array(
                    'controller' => 'Sites',
                    'action' => 'getRemoteSite'),
                array(
                    'async' => true,
                    'update' => '#RemoteSite',
                    'dataExpression' => false,
                    'data'=> $this->Js->serializeForm(
                            array(
                                'isForm' => true,
                                'inline'=> true
                                )
                            ),
                    )
                )
            );
    */
    $this->Js->get('#SiteSites')->event('change',
        $this->Js->request(array(
        'controller' => 'Sites',
            'action'=>'getRemoteSite',$id), // pass the id of the current site in as a parameter
                array('async' => true,
                    'update' => '#RemoteSite',
                    'dataExpression' => true,
                    'data'=> $this->Js->serializeForm(
                            array(
                                'isForm' => true,
                                'inline'=> true
                                )
                            ),
                    'method' => 'post'
                    )
                )
    );
    echo $this->Js->writeBuffer(); // Write cached scripts
?>
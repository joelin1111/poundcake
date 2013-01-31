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
    echo $this->Html->script('jquery-ui-map/jquery.ui.map');
    echo $this->Html->script('poundcake/poundcake-map');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('Edit Site', array('action'=>'edit', $site['Site']['id']),1);?></li>
        <li><?php echo $this->Html->link('List Sites', array('action'=>'index')); ?></li>
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
        <h2><?php echo $site['Site']['code']." ".$site['Site']['name'].' ('.$site['SiteState']['name'].')'?> </h2>    
        
        <?php echo $this->element('Common/disclaimer'); ?>
        
        <div class="span6">
            <P><B>Site contacts:</B>&nbsp;
                <?php
                    if (!isset($contacts)) {
                        echo "None";
                    } else {
                        echo "<P>";
                        foreach ($contacts as $contact) {
                            //echo "<LI>";
                            echo "<I>Priority ".$contact['Contact']['priority']."</I><BR>";
                            echo $this->Html->link(($contact['Contact']['name_vf']), array(
                                'controller' => 'contacts',
                                'action' => 'view',
                                $contact['Contact']['id']));
                            echo "<BR>".$contact['Contact']['phone']."</P>";
                        }
                    }
                ?>
            </P>
            <P><B>GPS Coordinates:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['lat']) . ' ' . sprintf("%01.5f",$site['Site']['lon']) . '<br>'; ?> </P>
            <P><B>Magnetic declination:</B>&nbsp;<?php echo sprintf("%01.5f",$site['Site']['declination']); ?></P>
        </div>
        <div class="span3">
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
    
    <div class="map-frame">
    <div id="map_canvas" style="width:700px;height:400px"></div>
    <div id="radios" class="item gradient rounded shadow" style="margin:5px;padding:5px 5px 5px 10px;"></div>
    
    <?php
    echo $this->Form->create( 'google_map' );
    echo $this->Form->input( 'default_lat', array('type'=>'hidden','value' => $site['Site']['lat']));
    echo $this->Form->input( 'default_lon', array('type'=>'hidden','value' => $site['Site']['lon']));
    echo $this->Form->input( 'default_zoom', array( 'type' => 'hidden', 'value' => 15));
    echo $this->Form->input( 'fit_bounds', array( 'type' => 'hidden', 'value' => 0 ));

    $sitestates = array( 'name' => $site['Site']['code'] );
    $n = 0;
    foreach ( $sitestates as $key => $val ) {
        echo $this->Form->input( 'sitestate_'.$n, array('type'=>'hidden','value'=>$val ));
        $n++;
    }
    echo $this->Form->end();
    
    $u = 0;
    echo "<div style='visibility:hidden; position:absolute;'>";
    echo '<ul>';
    $icon = 'data:'.$site['SiteState']['img_type'].';base64,'.base64_encode( $site['SiteState']['img_data'] ); 
    $item = array( 
        'id' => 'm_'.$u,
        'icon' => $icon,
        // see this as to why this needs to be an array
        // http://stackoverflow.com/questions/9881949/filterable-jquery-ui-map-google-map
        'tags' => array( $site['Site']['code'] ),
        'latlng' => array(
            'lat' => $site['Site']['lat'],
            'lng' => $site['Site']['lon'],
        )
    );
    echo "<li data-gmapping='".json_encode($item)."'>";
    echo '<p class="info-box"><a href="/sites/view/'.$site['Site']['id'].'">'.$site['Site']['site_vf'].'</a></p><br>';
    echo "</li></ul></div>";
    ?>
    </div> <!-- /.map-frame -->
    <BR>
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
                echo $this->element('Common/site_status_icon', array('status' => $radio['is_down']));
                echo '&nbsp;';
                
                echo $this->Html->link($radio['name'], array(
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
                $images = array();
                
                // we want to display images with thumbnails, so first we have to
                // look through the files array and move any files that are of
                // type image into an images array, then display them each
                // separately
                $f = count($files);
                for ($i = 0; $i < $f; $i++) {
                    // look for any images in the files array
                    //debug(exif_imagetype($files[$i]));
                    
                    // an enumerated list of OK image types
                    // see: http://php.net/manual/en/function.exif-imagetype.php
                    $allowed_image_types = array( IMAGETYPE_GIF , IMAGETYPE_JPEG ,IMAGETYPE_PNG , IMAGETYPE_BMP );
                    // the type of our current file
                    $image_type = exif_imagetype($files[$i]);
                    
                    if ( in_array( $image_type, $allowed_image_types )) {
                        //echo $i." " . basename($files[$i]) ." is OK<br>";
                        array_push($images,$files[$i]); // put it into the images array
                        unset($files[$i]); // remove it from the files array
                    }
                }
                
                // show the non-image files
                echo '<P><UL>';
                foreach ( $files as $file ) {
                    $f = basename($file);                    
                    $url = $baseUrl . "/$f";
                    echo '<li><a href="'.$url.'">';
                    echo $f;
                    echo '</a></li>';
                }
                echo '</UL></P>';
                
                // now show the images
                echo '<P><UL class="thumbnails">';
                foreach ( $images as $image ) {
                    $f = basename($image);                    
                    $url = $baseUrl . "/$f";
//                    echo '<li><a href="'.$url.'" class="thumbnail">';
//                    echo $this->PhpThumb->thumbnail($url, array('w' => 100, 'h' => 100, 'zc' => 1));
//                    echo '</a></li>';                    
                    echo '<li class="span3"><a href="'.$url.'" class="fancybox3 fancybox.image" rel="gallery1">';
                    echo $this->Html->image( $url );
                    $this->Fancybox->setProperties( array( 
                        'class' => 'fancybox3',
                        'className' => 'fancybox.image',
                        'title' => $f,
                        'rel' => 'gallery2'
                         )
                    );
                    $this->Fancybox->setPreviewContent( $f );
                    $this->Fancybox->setMainContent($url); 
                    echo $this->Fancybox->output(null);
                    echo '</li>';
                    
                }
                echo '</UL></P>';
                
                
            } else {
                echo "<P><UL><LI>None</LI></UL></P>";
            }
            ?>
    </P>

    <?php
        // maybe time format should also be set in the Site properties
        // we already got the date format (above) so just tack on the time
        $format .= " - g:m A"
    ?>
    <P><B>Site last modified:</B>&nbsp; <?php echo date($format, strtotime( $site['Site']['modified'] )); ?>    
    </P>            
    </div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    //$this->Js->get('#SiteSites')->event('change', $this->Js->alert('Compute Distance To Selected Site'));    
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

<?php
/*

Misc code that I'm saving for now -- this was sort of experimental, a follow-up to PC-244

                    // use exiftool to set/view EXIF orientation flags for testing
                    // e.g.
                    // $ exiftool -n -Orientation=3 case3.jpg
                    // $ exiftool *.jpg | grep Orientation
                    //
                    // Also see:  http://stackoverflow.com/questions/3657023/how-to-detect-shot-angle-of-photo-and-auto-rotate-for-website-display-like-desk
                    //
                    // if the image is a JPEG, check the EXIF for orientation flag
                    // this is really a one-time operation
//                        $exif = exif_read_data($file);
//                        echo '<pre>';
//                        print_r($exif);
//                        echo '</pre>';
                        /* 
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

//            in case we want to do something more interesting with the list of files?
//            $results = $this->Upload->listing('Site', $site['Site']['id']);
//            $directory = $results['directory'];
//            $baseUrl = $results['baseUrl'];
//            $files = $results['files'];
//            echo "<pre>".print_r($results)."</pre>";

*/
?>
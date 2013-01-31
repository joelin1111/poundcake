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
    
    //$this->RequestHandler->respondAs('text/javascript');
?>

<div class="row">
<div class="span9">
    <h2><?php echo $this->Session->read('project_name'); ?> Overview (Experimental)</h2>
    
    <p>
    <i class="icon-warning-sign"></i>&nbsp;This page is experimental and should not be relied upon.
    </p>
    
    <div class="map-frame-large">
    <div id="map_canvas" style="width:960px;height:600px"></div>
    <div id="radios" class="item gradient rounded shadow" style="margin:5px;padding:5px 5px 5px 10px;"></div>
    
        <?php
        echo $this->Form->create('google_map');
        echo $this->Form->input( 'default_lat', array('type'=>'hidden','value'=>$default_lat));
        echo $this->Form->input( 'default_lon', array('type'=>'hidden','value'=>$default_lon));
        $n = 0;
        foreach ( $sitestates as $key => $val ) {
            echo $this->Form->input( 'sitestate_'.$n, array('type'=>'hidden','value'=>$val ));
            $n++;
        }
        echo $this->Form->end();
        
        
        $u = 0;
        echo "<div style='visibility:hidden; position:absolute;'>";
        echo '<ul>';
        foreach ( $sites as $site ) {
            $icon = 'data:'.$site['SiteState']['img_type'].';base64,'.base64_encode( $site['SiteState']['img_data'] ); 
            $item = array( 
                'id' => 'm_'.$u,
                //'icon' => utf8_encode($icon),
                'icon' => $icon,
                //'icon' => '',
                // see this as to why this needs to be an array
                // http://stackoverflow.com/questions/9881949/filterable-jquery-ui-map-google-map
                'tags' => array( $site['SiteState']['name'] ),
                'latlng' => array(
                    'lat' => $site['Site']['lat'],
                    'lng' => $site['Site']['lon'],
                )
            );
            echo "<li data-gmapping='".json_encode($item)."'>";
            echo '<p class="info-box"><a href="/sites/view/'.$site['Site']['id'].'">'.$site['Site']['site_vf'].'</a></p><br>';
            echo "</li>";            
            $u++;
        }
        echo '</ul></div>';
        ?>
    </div>  
</div> <!-- /.span9 -->
</div> <!-- /.row -->

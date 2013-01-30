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
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.services');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.extensions');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.microformat');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.overlays');
//    echo $this->Html->script('jquery-ui-map/jquery.ui.map.services');
?>

<div class="row">
<div class="span9">
    <h2><?php echo $this->Session->read('project_name'); ?> Topology</h2>
    
    <div id="map-frame-large">
    <div id="map_canvas" style="width:960px;height:700px"></div>
        <?php
        echo $this->Form->create('google_map');
        echo $this->Form->input( 'default_lat', array('type'=>'hidden','value'=>$default_lat));
        echo $this->Form->input( 'default_lon', array('type'=>'hidden','value'=>$default_lon));
        
        echo '<div class="row" align="center">';
        foreach ( $sitestates as $key => $val ) {
            echo '<input type="checkbox" name="'.$key.'" value="'.$key.'" checked>'.$val.' &nbsp;';
            //echo '<input type="checkbox" name="'.$val.'" value="'.$val.'" checked>'.$val.' &nbsp;';
        }
        echo '</div>';
        
        echo $this->Form->end();
        
        $u = 0;
        echo "<div style='visibility:hidden; position:absolute;'>";
        echo '<ul>';
        foreach ( $sites as $site ) {
            //var_dump($site);die;
            $item = array( 
                'id' => 'm_'.$u,
                // see this as to why this needs to be an array
                // http://stackoverflow.com/questions/9881949/filterable-jquery-ui-map-google-map
                'tags' => array( $site['SiteState']['id']),
                'latlng' => array(
                    'lat' => $site['Site']['lat'],
                    'lng' => $site['Site']['lon'],
                )
            );
            $item = json_encode($item);
            
            echo "<li data-gmapping='".$item."'>";
            echo '<p class="info-box">'.$site['Site']['site_vf'].'</p><br>';
            echo "</li>";
            
            //echo $this->Form->input( 'lat'.$u, array('class'=>'info-box','type'=>'hidden','value'=>$site['Site']['site_vf']));
            //echo $this->Form->input( $u, array('type'=>'hidden','value' => $item ));
            //die;
            //echo $this->Form->input( 'lat'.$u, array('type'=>'hidden','value'=>$site['Site']['lat']));
            //echo $this->Form->input('lon'.$u, array('type'=>'hidden','value'=>$site['Site']['lon']));
            $u++;
        }
        echo '</ul></div>';
        
        echo $this->Form->end();
        
        
        ?>
    </div>
    
    <p>
    <i class="icon-warning-sign"></i>&nbsp;This page is in development and should not be relied upon.
    </p>
    
  
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

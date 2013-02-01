<?php
    // this is currently specific to OpenNMS
    foreach ( $alarms as $alarm ) {
             
        if ( $alarm[ 0 ] === "CRITICAL" ) {
            $class = 'alert-error';
        } if ( $alarm[ 0 ] === "MAJOR" ) {
            $class = 'alert-error';
        } if ( $alarm[ 0 ] === "WARNING" ) {
            $class = 'alert-info';
        } if ( $alarm[ 0 ] === "NORMAL" ) {
            $class = 'alert-success';
        } if ( $alarm[ 0 ] === "MINOR" ) {
            $class = 'alert-info';
        }
        
        echo '<div class="alert '.$class.'"><h4>'.$alarm[ 0 ].'</h4></div>';
        echo $alarm[ 1 ];
    }
?>
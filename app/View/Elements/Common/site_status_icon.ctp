
<?php
    // icons from here: http://www.wpclipart.com/blanks/shapes/color_labels/circle/color_label_circle_yellow.png.html                   
    switch ( true ) {
        case ( $status == null ):
            $icon = 'grey.png';
            $alt = 'Unknown Status';
            break;
        case ( $status == 0 ):
            $icon = 'green.png';
            $alt = 'All Nodes Up';
            break;
        case (( $status > 0 ) && ( $status < 1 )):
            $icon = 'yellow.png';
            $alt = 'Some Nodes Down';
            break;
        case ( $status == 1 ):
            $icon = 'red.png';
            $alt = 'All Nodes Down';
            break;
        default:
            $icon = 'gray.png';
            $alt = 'Unknown Status';
            break;
    }

    echo $this->Html->image( $icon, array( 'alt' => $alt )); 
?>
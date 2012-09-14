
<H3>Legend</H3>
<div class="well well-large">
    <?php
    //print_r($allSiteStates);
    for($i = 0; $i < sizeof($allSiteStates); ++$i) {
        echo '<img src="data:'.$allSiteStates[$i]['SiteState']['img_type'].';base64,'.base64_encode( $allSiteStates[$i]['SiteState']['img_data'] ) . '" />';
        echo '&nbsp;'.$allSiteStates[$i]['SiteState']['name'];
        echo '<BR>';
    }
        ?>

</div>
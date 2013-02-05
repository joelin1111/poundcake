
<H3>Legend</H3>

<div class="well well-large legend">
    <?php
//    for($i = 0; $i < sizeof($allSiteStates); ++$i) {
//        echo '<img src="data:'.$allSiteStates[$i]['SiteState']['img_type'].';base64,'.base64_encode( $allSiteStates[$i]['SiteState']['img_data'] ) . '" />';
//        
//        //echo '&nbsp;'.$allSiteStates[$i]['SiteState']['name'];
//        echo '&nbsp;';
//        echo $this->PoundcakeHTML->linkIfAllowed(
//                $allSiteStates[$i]['SiteState']['name'],
//                array(
//                    'controller' => 'sites',
//                    'action'=>'index',
//                    'Site.site_state_id'=>$allSiteStates[$i]['SiteState']['id'],
//                )
//                );
//        echo '<BR>';
//    }
    ?>
<table>
    <?php
    for($i = 0; $i < sizeof($allSiteStates); ++$i) {
        
        echo '<tr><td>';
        echo '<img src="data:'.$allSiteStates[$i]['SiteState']['img_type'].';base64,'.base64_encode( $allSiteStates[$i]['SiteState']['img_data'] ) . '" />';
        //echo '&nbsp;'.$allSiteStates[$i]['SiteState']['name'];
        echo '</td><td>';
        echo $this->PoundcakeHTML->linkIfAllowed(
                $allSiteStates[$i]['SiteState']['name'],
                array(
                    'controller' => 'sites',
                    'action'=>'index',
                    'Site.site_state_id'=>$allSiteStates[$i]['SiteState']['id'],
                )
                );
        echo '</td></tr>';
    } 
    ?>
</table>
</div>
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well"> <!-- was: well-large -->
    <ul>
        <li><?php
            if ( $internal_space_count == 0 ) {
                echo $this->PoundcakeHTML->linkIfAdmin('New Root IP Space', array('action' => 'root')); 
            } /* else {
                echo $this->PoundcakeHTML->linkIfAdmin('New IP Space', array('action' => 'add'));
            } */ 
            ?>
        </li>
        <li><?php echo $this->PoundcakeHTML->linkIfAdmin('New Public /32', array('action' => 'ip')); ?></li>
    </ul>
    </div>
</div> <!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>IP Spaces</h2>
        <?php
            if ( sizeof($ip_spaces) == 0 ) {
                echo '<div class="alert">';
                echo "<strong>Notice!</strong>  There is no Root IP Space or Public /32 is defined for ".$this->Session->read('project_name').".";
                echo '</div>';
            } else {
                // Because we're using a recursive/static function below
                // (recursiveIpSpaces) to draw our Tree structure, we
                // don't have access to $this -- which means we cannot use the
                // HTML helper to create our delete confirmation dialog box as we
                // are doing everywhere else in the application -- so here is our
                // workaround -- get the HTML that the HTML helper would otherwise
                // create for us, then do a string replace substituting
                // DELETE_ID with the id to delete
                $delete_confirm_html = $this->PoundcakeHTML->postLinkIfAllowed('Delete',
                    array('controller'=>'ipSpaces', 'action'=>'delete', 'DELETE_ID'),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of IP Space'),
                    null,
                    false // don't show the text "Delete" -- icon only
                );
                // Using CakePHP Tree Behavior
                // For this view, see http://bakery.cakephp.org/articles/blackbit/2012/12/20/display_tree_index_with_ol_and_li
                recursiveIpSpaces( $ip_spaces, $this->Session->read('role'), $delete_confirm_html );
            }
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php 
function recursiveIpSpaces( $array ,$role, $delete_confirm_html ) { 

    if (count($array)) { 
        echo "\n<ul>\n";
        
        foreach ($array as $vals) { 
            //var_dump($vals);
            echo "<li id=\"".$vals['IpSpace']['id']."\">";
            echo $vals['IpSpace']['name'];
            echo ' '.$vals['IpSpace']['ip_address'];
            echo ' /'.$vals['IpSpace']['cidr']; 
            
            // must be an admin to see add/delete buttons
            if ( $role === 'admin' ) {
                echo '&nbsp;&nbsp;&nbsp;';
                // don't show the plus sign if it's a /32
                if ( $vals['IpSpace']['cidr'] < 32 ) {
                    echo '<a href="/ipSpaces/add/'.$vals['IpSpace']['id'].'"><i class="icon-plus-sign"></i></a>';
                }
                
                // don't allow them to delete the root space
                // unless it's a /32
                //if (( $vals['IpSpace']['parent_id'] != null ) || ( $vals['IpSpace']['cidr'] == 32 )) {
                    $delete_confirm_html = preg_replace( '/(DELETE_ID)/', $vals['IpSpace']['id'], $delete_confirm_html);
                    // echo '&nbsp;';
                    // echo '<a href="/ipspaces/delete/'.$vals['IpSpace']['id'].'"><i class="icon-minus-sign"></i></a>';
                    echo $delete_confirm_html; // Spit out the HTML we (manually) created above
                //}
            }
            if (count($vals['children'])) { 
                recursiveIpSpaces( $vals['children'], $role, $delete_confirm_html ); 
            } 
            echo "</li>\n";
        } 
        echo "</ul>\n"; 
    } 
} ?>
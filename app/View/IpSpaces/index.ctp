<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php
            if ( sizeof($ip_spaces) == 0 ) {
                echo $this->PoundcakeHTML->linkIfAdmin('New Root IP Space', array('action' => 'root')); 
            } else {
                echo $this->PoundcakeHTML->linkIfAdmin('New IP Space', array('action' => 'add'));
            }    
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
            echo "<p>Please create a root IP space for ".$this->Session->read('project_name').".</p>";
        } else {
            // Using CakePHP Tree Behavior
            // For this view, see http://bakery.cakephp.org/articles/blackbit/2012/12/20/display_tree_index_with_ol_and_li
            recursiveIpSpaces( $ip_spaces, $this->Session->read('role') );
        }
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php 
function recursiveIpSpaces( $array ,$role ) { 

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
                    echo '<a href="/ipspaces/add/'.$vals['IpSpace']['id'].'"><i class="icon-plus-sign"></i></a>';
                }
                
                // don't allow them to delete the root space
                // unless it's a /32
                if (( $vals['IpSpace']['parent_id'] != null ) || ( $vals['IpSpace']['cidr'] == 32 )) {
                    echo '&nbsp;';
                    echo '<a href="/ipspaces/delete/'.$vals['IpSpace']['id'].'"><i class="icon-remove"></i></a>';
                }
            }
            if (count($vals['children'])) { 
                recursiveIpSpaces( $vals['children'], $role ); 
            } 
            echo "</li>\n";
        } 
        echo "</ul>\n"; 
    } 
} ?>
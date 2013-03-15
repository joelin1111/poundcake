<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List IP Spaces',array('controller'=>'ipspaces','action' => 'index')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>IP Spaces</h2>
        <?php
            // @see http://bakery.cakephp.org/articles/blackbit/2012/12/20/display_tree_index_with_ol_and_li
            RecursiveIpSpaces( $ip_spaces );
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php 
function RecursiveIpSpaces($array) { 

    if (count($array)) { 
        echo "\n<ul>\n"; 
        foreach ($array as $vals) { 

            echo "<li id=\"".$vals['IpSpace']['id']."\">";
            echo $vals['IpSpace']['name'];
            echo ' '.$vals['IpSpace']['ip_address'];
            echo ' /'.$vals['IpSpace']['cidr']; 
            
            echo '&nbsp; - &nbsp;';
            // There is no direct specification for passing multiple parameters
            // from view to controller, plus I'm not using the helpr here anyhow
            // This link is sort of relevant:
            // http://glidingphenomena.blogspot.com/2010/05/cakephp-passing-multiple-parameters.html
            echo '<a href="/ipspaces/add/'.$vals['IpSpace']['id'].'&'.$vals['IpSpace']['project_id'].'"><i class="icon-plus-sign"></i></a>';
            
            echo '&nbsp;';
            echo '<a href="delete/'.$vals['IpSpace']['id'].'"><i class="icon-remove"></i></a>';
            
            if (count($vals['children'])) { 
                RecursiveIpSpaces($vals['children']); 
            } 
            echo "</li>\n";
        } 
        echo "</ul>\n"; 
    } 
} ?>
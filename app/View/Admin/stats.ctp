<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well"> <!-- was: well-large -->
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Stats</h2>
        <dl class="dl-horizontal">
            <P>
                A smattering of Tower DB statistics for your viewing pleasure.
            </P>
            
            <h4>Total number of...</h4>
            
            <dt>Projects</dt>
            <dd><?php echo $project_count; ?></dt>
                
            <dt>Sites</dt>
            <dd><?php echo $site_count; ?></dt>
                
            <dt>Radios</dt>
            <dd><?php echo $radio_count; ?></dt>
                
            <dt>Routers</dt>
            <dd><?php echo $router_count; ?></dt>
                
            <dt>Switches</dt>
            <dd><?php echo $switch_count; ?></dt>
            
            <dt>Users</dt>
            <dd><?php echo $user_count; ?></dt>
        </dl>
        
        <dl class="dl-horizontal">
            <h4>Errata</h4>
            
            <dt>Avg. Radios per Site</dt>
            <dd><?php echo sprintf("%.2f",$avg_radio_count); ?></dt>
                
            <dt>Most Radios at a Site</dt>
            <dd><?php echo $max_radio_count; ?></dt>
            
            <dt>No. Multipoint Radios</dt>
            <dd><?php echo $mp_radio_count; ?></dt>
                
            <dt>Most Recent Login</dt>
            <dd><?php echo $last_logged_in_user; ?></dt>
                
            <dt>Last Code Update</dt>
            <dd><?php echo date_format(new DateTime($last_update), 'l, F jS, Y'); ?></dt>      
        </dl>
        
        <dl>
            <h4>Even More Errata</h4>
            <dt>Site Name Distribution (by Letter)</dt>
        </dl>
        <dl class="dl-horizontal">
            <?php foreach ($distribution as $key => $val):
                    $percent = ( $val / $site_count ) * 100;
                    //echo $percent."<BR>";
                ?>
                <dt><?php echo strtoupper($key);?></dt>
                <dd>
                    <div class="progress progress-info">
                        <div class="bar" style="width: <?php echo $percent; ?>%"></div>
                    </div>
                </dd>
            <?php endforeach; ?>
        </dl>
        
</div> <!-- /.span9 -->
</div> <!-- /.row -->
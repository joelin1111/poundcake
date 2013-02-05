<div class="row">
    <?php //echo $this->element('sql_dump'); ?>
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
        <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Site', array('action' => 'add')); ?></li>
        <li><?php echo $this->MyHTML->linkIfAdmin('KML Import', array('action' => 'import')); ?></li>
        <li><?php
            // make the KML link that appears in the URL bar a little prettier by removing: whitespace, (, )
            // this is basiclly duplicated in SitesController::export
            //$project_name = preg_replace('/\s+/', '', $this->Session->read('project_name'));
            //$project_name = preg_replace('/(\(|\))/', '', $project_name);
            echo $this->MyHTML->linkIfAllowed('KML Export', array('action'=>'export', 'ext'=>'kml' ));
            ?>
        </li>        
    </ul>
    </div>
    
    <?php echo $this->element('Common/search'); ?>
    
    <H3>Install Teams</H3>
    <div class="well well-large">
    <ul>
        <?php
        if ( count($installteams) > 0 ) {
            foreach ($installteams as $key => $value) {
                echo '<LI>';
                echo $this->Html->link(($value), array('action' => 'schedule',$key));
                echo '</LI>';
            }
        } else {
                echo '<LI>None</LI>';
            }
        ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
<h2>Sites</h2>
<table class="table table-condensed table-striped table-hover">
<thead>
   <tr>
       <th style="width: 50px;text-align: center;"><?php echo $this->Paginator->sort('is_down','Status'); ?></th>
       <th><?php echo $this->Paginator->sort('code'); ?></th>
       <th><?php echo $this->Paginator->sort('name'); ?></th>
       <th><?php echo $this->Paginator->sort('Organization'); ?></th>
       <th><?php echo $this->Paginator->sort('site_state_id'); ?></th>
       <th><?php echo $this->Paginator->sort('Zone.name','Zone');?></th> <!-- zone_id -->
       <th>Actions</th>
   </tr>
</thead>
<tbody>
    <?php
    foreach ($sites as $site): ?>            
       <tr>
           <td style="text-align: center;">
               <?php
                    //$status = $site['Site']['is_down'];
                    echo $this->element('Common/site_status_icon', array('status' => $site['Site']['is_down']));
                ?>
           </td>
           <td><?php
                    echo $this->Html->link($site['Site']['code'],
                    array('controller' => 'sites', 'action' => 'view', $site['Site']['id']));
                ?>
           </td>
           <td>
               <?php
                //echo $this->Html->link($site['Site']['name'],
               // truncate site names longer than 20 characters
                $name = substr($site['Site']['name'], 0, 20);
                if (strlen($site['Site']['name']) > 20 ) {
                    $name .= "...";
                }
                //echo $this->Html->link($name, array('controller' => 'sites', 'action' => 'view', $site['Site']['id']));
                echo '&nbsp;';
                echo $this->Html->link ($name, array('controller' => 'sites', 'action' => 'view_dev', $site['Site']['id']));
                ?>
               
           </td>
           <td><?php echo $site['Organization']['name']; ?></td>
           <td><?php echo $site['SiteState']['name']; ?></td>
           <td><?php echo $site['Zone']['name']; ?></td>
           <td>
<!--               <button class="btn btn-mini"></button>-->
            <?php echo $this->MyHTML->linkIfAllowed('Edit', array('action'=>'edit', $site['Site']['id']));?>
            <?php
                // echo $this->MyHTML->postLinkIfAllowed('Delete', array('action' => 'delete', $site['Site']['id']), null, 'Are you sure?' )
                echo $this->MyHTML->postLinkIfAllowed('Delete',
                        array('controller'=>'sites','action'=>'delete', $site['Site']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$site['Site']['name']),
                        null
                    );
            ?>
           </td>
       </tr>
    <?php
    endforeach;
    ?>
<tbody>
</table>

<?php
    // include pagination
    echo $this->element('Common/pagination');
?>

</div>
</div> <!-- /row -->
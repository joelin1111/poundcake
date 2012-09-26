<?php
    //echo $this->Html->script('jquery-1.7.2');
    //echo $this->Html->script('poundcake');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed(__('New Site'), array('action' => 'add')); ?></li>
    </ul>
    </div>
    
    <?php echo $this->element('Common/search'); ?>
    
    <H3>Install Teams</H3>
    <div class="well well-large">
    <ul>
        <?php
            foreach ($installteams as $key => $value) {
//                print_r($key);
//                print_r($value);
                echo '<LI>';
                echo $this->Html->link(($value), array('action' => 'schedule',$key));
                echo '</LI>';
            }
        ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    
    <h3>Sites</h3>
<table class="table table-condensed table-striped">
<thead>
   <tr>
       <th><?php echo $this->Paginator->sort('site_code'); ?></th>
       <th><?php echo $this->Paginator->sort('site_name'); ?></th>
       <th><?php echo $this->Paginator->sort('TowerOwner.name','Tower Owner'); ?></th>
       <th><?php echo $this->Paginator->sort('site_state_id'); ?></th>
       <th><?php echo $this->Paginator->sort('Zone.name','Zone');?></th> <!-- zone_id -->
       <th>Actions</th>
   </tr>
</thead>
<tbody>
    <?php
    foreach ($sites as $site): ?>
       <tr>
           <?php
                //print_r($site['Site']);
                //echo $site['Site']['PowerType'];
           ?>
           <td><?php
                    echo $this->Html->link($site['Site']['site_code'],
                    array('controller' => 'sites', 'action' => 'view', $site['Site']['id']));
                ?>
           </td>
           <td>
               <?php
                echo $this->Html->link($site['Site']['site_name'],
                array('controller' => 'sites', 'action' => 'view', $site['Site']['id']));
                ?>
           </td>
           <td><?php echo $site['TowerOwner']['name']; ?></td>
           <td><?php echo $site['SiteState']['name']; ?></td>
           <td><?php echo $site['Zone']['name']; ?></td>
           <td>
<!--               <button class="btn btn-mini"></button>-->
            <?php //echo $this->Html->link('Edit', array('action'=>'edit', $site['Site']['id']));?>
            <?php echo $this->MyHTML->linkIfAllowed('Edit', array('action'=>'edit', $site['Site']['id']));?>
            <?php echo $this->MyHTML->postLinkIfAllowed('Delete', array('action' => 'delete', $site['Site']['id']), null, 'Are you sure?' )?>
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
<?php
    //echo $this->Html->script('jquery-1.7.2');
    //echo $this->Html->script('poundcake');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Site'), array('action' => 'add')); ?></li>
    </ul>
   </div>
    <H3>Search</H3>
    <?php
      echo $this->Form->create(
          'Site',
          // calls the search function on the SitesController
          array('action'=>'search','class' => 'well')
      );
      echo $this->Form->input('site_code',array('escape' => true,'class' => 'span2'));
      echo $this->Form->input('site_name',array('class' => 'span2'));
      ?>
    <span class="help-block">Use * as a wildcard</span>
    <?php
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo $this->Form->end(); 
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    
    <h3>Sites</h3>
<!--   <div class="btn-toolbar">
       <div class="btn-group">-->
<!--           <a href="/sites/add"><button class="btn btn-mini">Add</button></A>-->
<!--    <div class="btn-toolbar">
    <div class="btn-group">
        <button class="btn btn-mini">Add</button>
        <button class="btn btn-mini">Edit</button>
        <button class="btn btn-mini">Delete</button>
    </div>
    <div class="btn-group">
      <button class="btn btn-mini">Export</button>
      <button class="btn btn-mini">Import</button>
 -->
<!-- Revisit the HTML in this view and replace with Html helper, e.g.
    echo $this->Html->tableHeaders(
            array (
                'Site',
                'Province',
                'District',
                'Site Type',
                'Power',
                'Internet',
                'Road',
                'Actions'
            )
     );
    this->html->tableCells...-->
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
            <?php echo $this->Html->link('Edit', array('action'=>'edit', $site['Site']['id']));?>
            <?php echo $this->Html->link('Delete', array('action' => 'delete', $site['Site']['id']), null, 'Are you sure?' )?>
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
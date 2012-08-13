<?php
    echo $this->Html->script('jquery-1.7.2');
    echo $this->Html->script('poundcake');
?>

<div class="row">
<div class="span3">
    <?php
      echo $this->Form->create(
          'School',
          // calls the search function on the SchoolsController
          array('action'=>'search','class' => 'well')
      );
      echo $this->Form->input('school_code',array('escape' => true,'class' => 'span2'));
      echo $this->Form->input('site_name',array('class' => 'span2'));
      ?>
<!--        <span class="help-block">Example block-level help text here.</span>-->
    <?php
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo $this->Form->end(); 
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    
    <h1>Schools</h1>
    <h4>Actions</h4>
   <div class="btn-toolbar">
       <div class="btn-group">
<!--           <a href="/schools/add"><button class="btn btn-mini">Add</button></A>-->
        <?php echo $this->Html->link(__('New School'), array('action' => 'add')); ?>
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
    </div>
    </div> <!--/.btn-toolbar -->

<BR><BR>

<!-- Revisit the HTML in this view and replace with Html helper, e.g.
    echo $this->Html->tableHeaders(
            array (
                'School',
                'Province',
                'District',
                'School Type',
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
       <th><?php echo $this->Paginator->sort('school_code'); ?></th>
       <th><?php echo $this->Paginator->sort('site_name'); ?></th>
       <th><?php echo $this->Paginator->sort('catchment_id','Catchment');?></th>
       <th><?php echo $this->Paginator->sort('area_id','Area'); ?></th>
       <th><?php echo $this->Paginator->sort('district_id','District'); ?></th>
       <th>Actions</th>
   </tr>
</thead>
<tbody>
    <?php
    foreach ($schools as $school): ?>
       <tr>
           <?php
                //print_r($school['School']);
                //echo $school['School']['PowerType'];
           ?>
           <td><?php
                    echo $this->Html->link($school['School']['school_code'],
                    array('controller' => 'schools', 'action' => 'view', $school['School']['id']));
                ?>
           </td>
           <td>
               <?
                    echo $this->Html->link($school['School']['site_name'],
                    array('controller' => 'schools', 'action' => 'view', $school['School']['id']));
                ?>
           </td>
           <td><?php echo $school['Catchment']['name']; ?></td>
           <td><?php echo $school['Area']['name']; ?></td>
           <td><?php echo $school['District']['name']; ?></td>
           <td>
<!--               <button class="btn btn-mini"></button>-->
            <?php echo $this->Html->link('Edit', array('action'=>'edit', $school['School']['id']));?>
            <?php echo $this->Html->link('Delete', array('action' => 'delete', $school['School']['id']), null, 'Are you sure?' )?>
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
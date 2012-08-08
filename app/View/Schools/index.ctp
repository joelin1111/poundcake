<?php
    echo $this->Html->script('jquery-1.7.2');
?>
<div class="maskAlt">
    <div class="headerAlt">
        <h1>TZ21 Schools</h1>
    </div>
<?php
    echo $this->Html->link('Add school',array('controller' => 'schools','action' => 'add'));
?>
<div class="bodyAlt">
<?php
    //echo ("<pre>"); print_r($schools); echo("</pre>");
?>
<BR><BR>
<fieldset>
    <legend><?php echo __('Search'); ?></legend>  
    <?php
        echo $this->Form->create(
                'School',
                //array('url' => array_merge(array('action' => 'index'), $this->params['pass']))
                // calls the search function on the SchoolsController
                array('action'=>'search')
        );

        //echo $this->Form->input('school_code', array('label' => 'School Code'), array('div' => false));

        echo $this->Form->input('school_code' /*, array('after'=>__(' Wildcard is *',true))*/);
        echo $this->Form->input('site_name' /*, array('after'=>__(' Wildcard is *',true))*/);

        //echo $this->Form->input('district', array('div' => false));
        //echo $this->Form->input('district', array('div' => false, 'options' => $schools));
        echo "";

    //    echo $this->AutoComplete->input( 
    //        'site_name', 
    //        //array('label' => 'School Name'),
    //        array( 
    //        'autoCompleteUrl'=>$this->Html->url(  
    //            array( 
    //                'controller'=>'Schools', 
    //                'action'=>'auto_complete', 
    //            ) 
    //        ), 
    //        'autoCompleteRequestItem'=>'autoCompleteText', 
    //        ) 
    //    );
    //    echo "<BR>";
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo "<P><I>* is a search wildcard operator</I></p>";
        echo $this->Form->end();    
    ?>
</fieldset>

<BR><BR>
<table>
    <?php
     /*
     Revisit the HTML in this view and replace with Html helper, e.g.
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
        this->html->tableCells...
  */              
  ?>
   <tr>
       <th><?php echo $this->Paginator->sort('school_code'); ?></th>
       <th><?php echo $this->Paginator->sort('site_name'); ?></th>
       <th><?php echo $this->Paginator->sort('catchment_id','Catchment');?></th>
       <th><?php echo $this->Paginator->sort('area_id','Area'); ?></th>
       <th><?php echo $this->Paginator->sort('district_id','District'); ?></th>
       <th><?php //echo $this->Paginator->sort('power_type_id','Power'); ?></th>
       <th><?php //echo $this->Paginator->sort('connectivity_type_id','Connectivity'); ?></th>
       <th>Actions</th>
   </tr>
   
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
<!--           <td><?php //echo $school['PowerType']['name']; ?></td>
           <td><?php //echo $school['ConnectivityType']['name']; ?></td>-->
           <td align="center">
            <?php echo $this->Html->link('Edit', array('action'=>'edit', $school['School']['id']));?>
            <?php echo $this->Html->link('Delete', array('action' => 'delete', $school['School']['id']), null, 'Are you sure?' )?>
           </td>
       </tr>
    <?php
    endforeach;
    ?>
</table>

<?php
    echo $this->Paginator->prev('<< Previous', null, null, array('class' => 'disabled'));
    ?>
    <?php
    // shows the page numbers
    echo $this->Paginator->numbers();
    ?>
    <?php
    echo $this->Paginator->next('Next >>', null, null, array('class' => 'disabled'));
    ?>
    <?php
    //prints X of Y, where X is current page and Y is number of pages -->
    echo $this->Paginator->counter();
?>


</div>
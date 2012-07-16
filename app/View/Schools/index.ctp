<h2>TZ21 Schools</h2>
<?php
    echo $this->Html->link('Add school',array('controller' => 'schools','action' => 'add'));
?>

<?php
    //echo ("<pre>"); print_r($schools); echo("</pre>");
?>
<BR><BR>
<h3>Sort by:</h3>
<LI><?php echo $this->Paginator->sort('primary_school', 'Primary School');?></LI>
<LI><?php echo $this->Paginator->sort('district', 'District');?></LI>


<BR><BR>
<table>
   <tr>
       <th>Province</th>
       <th>Primary School</th>
       <th>District</th>
       <th>TRC</th>
       <th>School Code</th>
       <th>Type</th>
       <th>S/N</th>
       <th>Actions</th>
   </tr>

    <?php
    foreach ($schools as $school): ?>
       <tr>
           <td><?php echo $school['Province']['name']; ?></td>
           <td><?php echo $this->Html->link($school['School']['primary_school'],
                   array('controller' => 'schools', 'action' => 'view', $school['School']['id']));
                ?>
           </td>
           <td><?php echo $school['School']['district']; ?></td>
           <td><?php echo $school['School']['trc']; ?></td>
           <td><?php echo $school['School']['school_code']; ?></td>
           <td><?php echo $school['School']['type']; ?></td>
           <td><?php echo $school['School']['sn']; ?></td>
           <td>
            <?php echo $this->Html->link('Edit', array('action'=>'edit', $school['School']['id']));?>
            <?php echo $this->Html->link('Delete', array('action' => 'delete', $school['School']['id']), null, 'Are you sure?' )?>
           </td>
       </tr>
    <?php
    endforeach;
    ?>
</table>

<?php
    echo $this->Paginator->prev('<<´ Previous', null, null, array('class' => 'disabled'));
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



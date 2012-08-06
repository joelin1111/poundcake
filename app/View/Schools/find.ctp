<h1>TZ21 Schools</h1>
<?php
    //echo $this->Html->link('Add school',array('controller' => 'schools','action' => 'add'));
?>

<?php
    //echo ("<pre>"); print_r($schools); echo("</pre>");
?>

<?php
    echo $this->Form->create('School', array(
        'url' => array_merge(array('action' => 'index'), $this->params['pass'])
    ));
    echo $this->Form->input('site_name', array('div' => false));
    //echo $this->Form->input('district', array('div' => false));
    //echo $this->Form->input('district', array('div' => false, 'options' => $schools));
    echo $this->Form->submit(__('Search', true), array('div' => false));
    echo $this->Form->end();
?>

<table>
   <tr>
       <th>ID</th>
       <th>District</th>
       <th>TRC</th>
       <th>School Code</th>
       <th>Type</th>
       <th>S/N</th>
       <th>Primary School</th>
       <th>Actions</th>
   </tr>

    <?php
    foreach ($schools as $school): ?>
       <tr>
           <td><?php echo $school['School']['id']; ?></td>
           <td><?php echo $school['School']['district']; ?></td>
           <td><?php echo $school['School']['trc']; ?></td>
           <td><?php echo $school['School']['school_code']; ?></td>
           <td><?php echo $school['School']['type']; ?></td>
           <td><?php echo $school['School']['sn']; ?></td>
           <td><?php echo $this->Html->link($school['School']['site_name'],
                   array('controller' => 'schools', 'action' => 'view', $school['School']['id']));
                ?>
           </td>
           <td>
            <?php echo $this->Html->link('Edit', array('action'=>'edit', $school['School']['id']));?>
            <?php echo $this->Html->link('Delete', array('action' => 'delete', $school['School']['id']), null, 'Are you sure?' )?>
           </td>
       </tr>
    <?php
    endforeach;
    ?>
</table>
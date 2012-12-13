<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Contact', array('action' => 'add')); ?></li>
    </ul>
    </div>
    <H3>Search</H3>
    <?php
    
      echo $this->Form->create(
          'Contact',
          // calls the search function on the SchoolsController
          array('action'=>'search','class' => 'well')
      );
     
      echo $this->Form->input('first_name',array('escape' => true,'class' => 'search-query'));
      echo '<br>';
      echo $this->Form->input('last_name',array('class' => 'search-query'));
      echo '<br>';
      ?>
    <span class="help-block"></span>
    <?php
        $options = array(
            'label' => 'Search',
            //'name' => 'Update',
            //'div' => array(        'class' => 'glass-pill',    ));
            'div' => false,
            'class'=>'btn'
            );
        echo $this->Form->end($options);
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Contacts</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name_vf','Name'); ?></th>
                    <th><?php echo $this->Paginator->sort('title'); ?></th>
                    <th><?php echo $this->Paginator->sort('Organization'); ?></th>
                    <th><?php echo $this->Paginator->sort('priority'); ?></th>
                    <th><?php echo ('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($contacts as $contact): ?>
                <?
//                echo '<pre>';
//                print_r($contact);
//                echo '</pre>';
                ?>
	<tr>
            <td><?php
                //echo $contact['Contact']['name_vf'];
                    echo $this->Html->link($contact['Contact']['name_vf'],
                    array('controller' => 'contacts', 'action' => 'view', $contact['Contact']['id']));
                ?>
            </td>
            <td><?php echo $contact['Contact']['title'];?></td>
            <td><?php echo $contact['Organization']['name'];?></td>
            <td><?php echo $contact['Contact']['priority'];?></td>
            <td>
            <?php echo $this->MyHTML->linkIfAllowed(('Edit'), array('action' => 'edit', $contact['Contact']['id'])); ?>
            <?php //echo $this->MyHTML->postLinkIfAllowed(('Delete'), array('action' => 'delete', $contact['Contact']['id']), null, __('Are you sure you want to delete contact %s?', $contact['Contact']['first_name'])); ?>
            <?php
                echo $this->MyHTML->postLinkIfAllowed('Delete',
                    array('controller'=>'contacts','action'=>'delete', $contact['Contact']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$contact['Contact']['name_vf']),
                    null
                );
            ?>
            </td>
	</tr>
        <?php endforeach; ?>
            </tbody>
        </table>

	
	<?php
            // include pagination
            echo $this->element('Common/pagination');
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
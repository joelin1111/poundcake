<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Project', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Projects</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($projects as $project): ?>
	<tr>
            <td><?php echo $this->MyHtml->linkIfAllowed($project['Project']['name'], array('action' => 'view', $project['Project']['id'])); ?></td>
            <td>
                <?php echo $this->MyHtml->linkIfAllowed('Edit', array('action' => 'edit', $project['Project']['id']));  ?>
                <?php 
                    // Standard Cake delete syntax:
                    // echo $this->Form->postLink('Delete', array('action' => 'delete', $project['Project']['id']), null, 'Are you sure you want to delete project %s?', $project['Project']['name']);
                    // new Bootbox-compatible delete -- see poundcake.js
                    echo $this->MyHtml->postLinkIfAllowed('Delete',
                        array('controller'=>'projects','action'=>'delete', $project['Project']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$project['Project']['name']),
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
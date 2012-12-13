<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Organization'), array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Organizations</h2>
	<table class="table table-condensed table-striped">
        <thead>
            <tr>
                <th><?php echo $this->Paginator->sort('name'); ?></th>
                <th><?php echo 'Actions'; ?></th>
            </tr>
        </thead>
        <tbody>
	<?php
	foreach ($organizations as $organization): ?>
	<tr>
            <td><?php echo $organization['Organization']['name'];?></td>
            <td>
                <?php echo $this->Html->link('Edit', array('action' => 'edit', $organization['Organization']['id'])); ?>
                <?php
                    echo $this->Form->postLink('Delete',
                        array('controller'=>'organizations','action'=>'delete', $organization['Organization']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$organization['Organization']['name']),
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
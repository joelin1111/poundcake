<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Tower Member'), array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Tower Members</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($towermembers as $towermember): ?>
	<tr>
            <td><?php echo $towermember['TowerMember']['name'];?></td>
            <td>
            <?php
                echo $this->Html->link('Edit', array('action' => 'edit', $towermember['TowerMember']['id']));
                echo $this->Form->postLink('Delete',
                    array('controller'=>'towermembers','action'=>'delete', $towermember['TowerMember']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$towermember['TowerMember']['name']),
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
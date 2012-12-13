<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Equipment Space', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Equipment Spaces</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($equipmentspaces as $equipmentspace): ?>
	<tr>
            <td><?php echo $equipmentspace['EquipmentSpace']['name'];?></td>
            <td>
                <?php echo $this->Html->link('Edit', array('action' => 'edit', $equipmentspace['EquipmentSpace']['id'])); ?>
                <?php echo $this->Form->postLink('Delete', array('action' => 'delete', $equipmentspace['EquipmentSpace']['id']), null, __('Are you sure you want to delete equipment space %s?', $equipmentspace['EquipmentSpace']['name'])); ?>
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
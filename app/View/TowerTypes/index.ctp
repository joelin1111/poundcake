<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Tower Type'), array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Tower Type</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($towerequipments as $towerequipment): ?>
	<tr>
            <td><?php echo h($towerequipment['TowerType']['name']);?></td>
            <td>
                <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $towerequipment['TowerType']['id'])); ?>
                <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $towerequipment['TowerType']['id']), null, __('Are you sure you want to delete tower type %s?', $towerequipment['TowerType']['name'])); ?>
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
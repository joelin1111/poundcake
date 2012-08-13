<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New Area'), array('action' => 'add')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Areas</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($areas as $area): ?>
	<tr>
            <td><?php echo h($area['Area']['name']); ?>&nbsp;</td>
            <td><?php
                //echo $this->Html->link($area['Catchment']['name'], array('controller' => 'catchments', 'action' => 'view', $area['Catchment']['id']));
                echo h($area['Catchment']['name']);
                ?>

            </td>
            <td>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $area['Area']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $area['Area']['id']), null, __('Are you sure you want to delete Area %s?', $area['Area']['name'])); ?>
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

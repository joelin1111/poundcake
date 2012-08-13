<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New Intervention Type'), array('action' => 'add')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Intervention Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($interventionTypes as $interventionType): ?>
	<tr>
            <td><?php echo h($interventionType['InterventionType']['name']);?></td>
            <td>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $interventionType['InterventionType']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $interventionType['InterventionType']['id']), null, __('Are you sure you want to delete Intervention Type %s?', $interventionType['InterventionType']['name'])); ?>
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
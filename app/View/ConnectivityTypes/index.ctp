<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New Connectivity Type'), array('action' => 'add')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Connectivity Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($connectivityTypes as $connectivityType): ?>
	<tr>
            <td><?php echo h($connectivityType['ConnectivityType']['name']);?></td>
            <td>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $connectivityType['ConnectivityType']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $connectivityType['ConnectivityType']['id']), null, __('Are you sure you want to delete Connectivity Type %s?', $connectivityType['ConnectivityType']['name'])); ?>
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
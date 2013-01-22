<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Monitoring System Type', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Monitor System Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($monitoringSystemTypes as $monitoringSystemType): ?>
	<tr>
            <td><?php echo $monitoringSystemType['MonitoringSystemType']['name'];?></td>
            <td>
                <?php
                    echo $this->Html->link('Edit', array('action' => 'edit', $monitoringSystemType['MonitoringSystemType']['id']));
                    echo '&nbsp;';
                    echo $this->Form->postLink('Delete',
                        array('controller'=>'monitoringsystemtypes','action'=>'delete', $monitoringSystemType['MonitoringSystemType']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$monitoringSystemType['MonitoringSystemType']['name']),
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
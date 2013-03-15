<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Root IP Space', array('action' => 'root')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>IP Spaces</h2>
	<table class="table table-condensed table-striped table-hover">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('IpSpace.name'); ?></th>
                    <th><?php echo $this->Paginator->sort('Project.name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($ip_spaces as $ip_space): ?>
	<tr>
            <td><?php echo $ip_space['IpSpace']['name'];?></td>
            <td><?php echo $ip_space['Project']['name'];?></td>
            <td>
                <?php
                    echo $this->Html->link('View', array('action' => 'view', $ip_space['IpSpace']['id']));
                    echo '&nbsp;';
                    echo $this->PoundcakeHTML->postLinkIfAllowed('Delete',
                        array('controller'=>'ipspaces','action'=>'delete', $ip_space['IpSpace']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$ip_space['IpSpace']['name']),
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

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Network Service', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Network Services</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Checked'; ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($networkservices as $item): ?>
	<tr>
            <td><?php echo $item['NetworkService']['name'];?></td>
            <td><?php if ( $item['NetworkService']['default'] > 0 ) { echo "Yes"; } ?></td>
            <td>
            <?php
                echo $this->Html->link('Edit', array('action' => 'edit', $item['NetworkService']['id']));
                echo '&nbsp;';
                echo $this->Form->postLink('Delete',
                    array('controller'=>'networkservices','action'=>'delete', $item['NetworkService']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$item['NetworkService']['name']),
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
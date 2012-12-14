<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Build Item Type', array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Build Item Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($builditemtypes as $item): ?>
	<tr>
            <td><?php echo $item['BuildItemType']['name'];?></td>
            <td>
            <?php echo $this->Html->link('Edit', array('action' => 'edit', $item['BuildItemType']['id'])); ?>
            <?php
                echo $this->Form->postLink('Delete',
                    array('controller'=>'builditemtypes','action'=>'delete', $item['BuildItemType']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$item['BuildItemType']['name']),
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
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Router Type'), array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Router Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($routerTypes as $routerType): ?>
	<tr>
            <td><?php echo $routerType['RouterType']['name'];?></td>
            <td>
                    <?php echo $this->Html->link('Edit', array('action' => 'edit', $routerType['RouterType']['id'])); ?>
                    <?php
                        echo $this->Form->postLink('Delete',
                            array('controller'=>'routertypes','action'=>'delete', $routerType['RouterType']['id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$routerType['RouterType']['name']),
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
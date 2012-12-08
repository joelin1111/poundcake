<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Role'), array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'users','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Roles</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($roles as $role): ?>
	<tr>
            <td><?php echo h($role['Role']['name']);?></td>
            <td>
                <?php
                    // no edit or delete for admin or view roles
                    if(($role['Role']['rolealias'] != 'admin') && ($role['Role']['rolealias'] != 'view')) { ?>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $role['Role']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $role['Role']['id']), null, __('Are you sure you want to delete role %s?', $role['Role']['name'])); ?>
                <?php } ?>
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
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New User', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Users</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo $this->Paginator->sort('role_id'); ?></th>
<!--                    <th><?php //echo $this->Paginator->sort('created'); ?></th>-->
                    <th><?php echo $this->Paginator->sort('last_login'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
        foreach ($users as $user): ?>
	<tr>
		<td><?php echo $user['User']['username']; ?>&nbsp;</td>
		<td>
                    <?php
                        //echo $this->Html->link($user['Role']['name'], array('controller' => 'roles', 'action' => 'view', $user['Role']['id']));
                        echo $user['Role']['name'];
                    ?>
		</td>
<!--		<td><?php // echo $user['User']['created']; ?>&nbsp;</td>-->
		<td><?php
                    $date = new DateTime($user['User']['last_login']);
                    echo date_format($date, 'D m/d/y g:ia');
                    //echo $user['User']['modified']; ?>&nbsp;</td>
		<td class="actions">
                    <?php //echo $this->Html->link('View'), array('action' => 'view', $user['User']['id']));
                        echo $this->Html->link('Edit', array('action' => 'edit', $user['User']['id']));
                        echo '&nbsp;';
                        //echo $this->Html->link('Password', array('action' => 'password', $user['User']['id']));
                        echo $this->Html->link('Permissions', array('action' => 'permissions', $user['User']['id']));
                        echo '&nbsp;';
                        echo $this->Form->postLink('Delete', array('action' => 'delete', $user['User']['id']), null, 'Are you sure you want to delete user %s?', $user['User']['username']);
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

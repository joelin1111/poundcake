<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Install Team'), array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'users','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Install Teams</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($installteams as $team): ?>
	<tr>
            <td><?php echo $this->Html->link($team['InstallTeam']['name'], array('action' => 'view', $team['InstallTeam']['id'])); ?></td>
            <td>
            <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $team['InstallTeam']['id'])); ?>
            <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $team['InstallTeam']['id']), null, __('Are you sure you want to delete install team %s?', $team['InstallTeam']['name'])); ?>
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
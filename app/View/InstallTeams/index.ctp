<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('New Install Team', array('action' => 'add')); ?></li>
        <li><?php echo $this->PoundcakeHTML->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Install Teams</h2>
	<table class="table table-condensed table-striped table-hover">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo $this->Paginator->sort('project_id'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($installteams as $team): ?>
	<tr>
            <td><?php echo $this->Html->link($team['InstallTeam']['name'], array('action' => 'view', $team['InstallTeam']['id'])); ?></td>
            <td><?php echo $team['Project']['name']; ?></td>
            <td>
            <?php
                echo $this->PoundcakeHTML->link('Edit', array('action' => 'edit', $team['InstallTeam']['id']));            
                echo '&nbsp;';
                echo $this->PoundcakeHTML->postLinkIfAllowed('Delete',
                            array('controller'=>'installteams','action'=>'delete', $team['InstallTeam']['id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$team['InstallTeam']['name']),
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
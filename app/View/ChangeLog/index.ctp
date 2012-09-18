<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Change'), array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Changes</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('version'); ?></th>
                    <th><?php echo $this->Paginator->sort('release_date'); ?></th>
                    <th><?php echo $this->Paginator->sort('descrption'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($changeLogs as $change): ?>
	<tr>
            <td><?php echo h($change['ChangeLog']['version']);?></td>
            <td>
            <?php
                $date = new DateTime($change['ChangeLog']['release_date']);
                echo $date->format('Y-m-d');
                ?>
            </td>
            <td><?php
                    $desc = substr($change['ChangeLog']['description'], 0, 40);
                    if (strlen($change['ChangeLog']['description']) > 40 ) {
                        $desc .= "...";
                    }
                    echo $this->Html->link($desc, array('action' => 'view', $change['ChangeLog']['id']));
                ?>
            </td>
            <td>
            <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $change['ChangeLog']['id'])); ?>
            <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $change['ChangeLog']['id']), null, __('Are you sure you want to delete change %s?', $change['ChangeLog']['version'])); ?>
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
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHtml->linkIfAllowed('New Change', array('action' => 'add')); ?></li>
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
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($changeLogs as $change): ?>
	<tr>
            <td><?php echo $change['ChangeLog']['version'];?></td>
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
            <?php
                echo $this->MyHTML->linkIfAdmin('Edit', array('action' => 'edit', $change['ChangeLog']['id']));
                echo '&nbsp;';
                echo $this->MyHTML->postLinkIfAllowed('Delete',
                            array('controller'=>'changelog','action'=>'delete', $change['ChangeLog']['id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$change['ChangeLog']['version']),
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
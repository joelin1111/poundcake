<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('New Build Item', array('action' => 'add')); ?></li>
        <li><?php echo $this->PoundcakeHTML->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Build Items</h2>
	<table class="table table-condensed table-striped table-hover">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('quantity'); ?></th>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo $this->Paginator->sort('build_item_type_id'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($builditems as $item): ?>
	<tr>
            <td><?php echo $item['BuildItem']['quantity'];?></td>
            <td><?php
                // some of these are long, so truncate as appropriate
                $len = 40;
                $str = $item['BuildItem']['name'];
                echo (strlen($str) > $len) ? substr($str,0,$len).'...' : $str;
            ?></td>
            <td><?php echo $item['BuildItemType']['name'];?></td>
            <td>
            <?php
                echo $this->PoundcakeHTML->link('Edit', array('action' => 'edit', $item['BuildItem']['id']));
                echo '&nbsp;';
                echo $this->PoundcakeHTML->postLinkIfAllowed('Delete',
                            array('controller'=>'builditems','action'=>'delete', $item['BuildItem']['id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$item['BuildItem']['name']),
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
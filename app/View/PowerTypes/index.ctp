<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Power Type', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Power Types</h2>
	<table class="table table-condensed table-striped table-hover">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($powerTypes as $powerType): ?>
	<tr>
            <td><?php echo $powerType['PowerType']['name'];?></td>
            <td>
                <?php
                    echo $this->Html->link('Edit', array('action' => 'edit', $powerType['PowerType']['id']));
                    echo '&nbsp;';
                    echo $this->MyHTML->postLinkIfAllowed('Delete',
                        array('controller'=>'powertypes','action'=>'delete', $powerType['PowerType']['id']),
                        array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$powerType['PowerType']['name']),
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
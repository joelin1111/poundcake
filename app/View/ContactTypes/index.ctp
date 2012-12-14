<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Contact Type', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Contact Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($contactTypes as $contactType): ?>
	<tr>
            <td><?php echo $contactType['ContactType']['name'];?></td>
            <td>
                    <?php echo $this->Html->link('Edit', array('action' => 'edit', $contactType['ContactType']['id'])); ?>
                    <?php
                        echo $this->Form->postLink('Delete',
                            array('controller'=>'contacttypes','action'=>'delete', $contactType['ContactType']['id']),
                            array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$contactType['ContactType']['name']),
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
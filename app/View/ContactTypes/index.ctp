<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Contact Type'), array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Contact Types</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($contactTypes as $contactType): ?>
	<tr>
            <td><?php echo h($contactType['ContactType']['name']);?></td>
            <td>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $contactType['ContactType']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $contactType['ContactType']['id']), null, __('Are you sure you want to delete contact type %s?', $contactType['ContactType']['name'])); ?>
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
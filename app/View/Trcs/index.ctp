<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New TC/TRC'), array('action' => 'add')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h3>TCs/TRCs</h3>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('trc_code','TC/TRC Code'); ?></th>
                    <th><?php echo $this->Paginator->sort('trc_name','TC/TRC Name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($trcs as $trc): ?>
	<tr>
            <td><?php echo $this->Html->link(__($trc['Trc']['trc_code']), array('action' => 'view', $trc['Trc']['id'])); ?></td>
            <td><?php echo $this->Html->link(__($trc['Trc']['trc_name']), array('action' => 'view', $trc['Trc']['id'])); ?></td>
            <td>
                <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $trc['Trc']['id'])); ?>
                <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $trc['Trc']['id']), null, __('Are you sure you want to delete TC/TRC %s?', $trc['Trc']['trc_name'])); ?>
            </td>
	</tr>
        <?php endforeach; ?>
            </tbody>
        </table>

	
	<?php
            // include pagination
            // file is in ./View/Elements/Common/pagination.ctp
            echo $this->element('Common/pagination');
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
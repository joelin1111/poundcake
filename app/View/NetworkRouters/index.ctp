<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('New Radio'), array('action' => 'add')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Radios</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo $this->Paginator->sort('site_id'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($networkradios as $networkradio): ?>
	<tr>
            <td><?php echo $this->Html->link(__($networkradio['NetworkRadio']['name']), array('action' => 'view', $networkradio['NetworkRadio']['id']))?></td>
            <td><?php echo $networkradio['Site']['site_vf'];?></td>
            <td>
                <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $networkradio['NetworkRadio']['id'])); ?>
                <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $networkradio['NetworkRadio']['id']), null, __('Are you sure you want to delete Radio %s?', $networkradio['NetworkRadio']['name'])); ?>
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
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed(__('New Router'), array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Routers</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($networkrouters as $networkrouter): ?>
	<tr>
            <td><?php echo h($networkrouter['NetworkRouter']['name']);?></td>
            <td>
                    <?php echo $this->MyHTML->linkIfAllowed(__('Edit'), array('action' => 'edit', $networkrouter['NetworkRouter']['id'])); ?>
                    <?php echo $this->MyHTML->postLinkIfAllowed(__('Delete'), array('action' => 'delete', $networkrouter['NetworkRouter']['id']), null, __('Are you sure you want to delete router %s?', $networkrouter['NetworkRouter']['name'])); ?>
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
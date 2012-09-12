<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('New Site State'), array('action' => 'add')); ?></li>
    </ul>
    </div>
    Note that site states and related icons are not dynamic.  New site states will default to a yellow icon.  There likely exists a need to manually modify the map code to reflect other changes.  
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Site States</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo __('Actions'); ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($siteStates as $siteState): ?>
	<tr>
            <td><?php echo h($siteState['SiteState']['name']);?></td>
            <td>
                    <?php echo $this->Html->link(__('Edit'), array('action' => 'edit', $siteState['SiteState']['id'])); ?>
                    <?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $siteState['SiteState']['id']), null, __('Are you sure you want to delete site state %s?', $siteState['SiteState']['name'])); ?>
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
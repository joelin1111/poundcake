<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('New Site State', array('action' => 'add')); ?></li>
        <li><?php echo $this->Html->link('Admin',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
    
    <P>
    Grab site icons from <a href="http://mapicons.nicolasmollet.com/markers/restaurants-bars/wi-fi/" target="_blank">here</a>.    
    </p>
    <P>
    Generally "wi-fi unsecured", first row 3rd icon over, pick a color then Save As.
    </P>
    
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Site States</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo $this->Paginator->sort('sequence'); ?></th>
                    <th><?php echo $this->Paginator->sort('project_id'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($siteStates as $siteState): ?>
	<tr>
            <td><?php echo $this->Html->link(($siteState['SiteState']['name']), array('action' => 'view', $siteState['SiteState']['id'])); ?></td>
            <td><?php echo $siteState['SiteState']['sequence']; ?></td>
            <td><?php echo $siteState['Project']['name']; ?></td>
            <td>
            <?php
                echo $this->Html->link('Edit', array('action' => 'edit', $siteState['SiteState']['id']));
                echo '&nbsp;';
                echo $this->Form->postLink('Delete',
                    array('controller'=>'sitestates','action'=>'delete', $siteState['SiteState']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$siteState['SiteState']['name']),
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
            // file is in ./View/Elements/Common/pagination.ctp
            echo $this->element('Common/pagination');
        ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
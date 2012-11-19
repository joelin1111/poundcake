<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Router', array('action' => 'add')); ?></li>
    </ul>
    </div>
    
    <H3>Search</H3>
    <?php
      echo $this->Form->create(
          'NetworkRouter',
          // calls the search function on the SitesController
          array('action'=>'search','class' => 'well')
      );
      echo $this->Form->input('name',array('escape' => true,'class' => 'span2'));
      ?>
    <span class="help-block">Use * to wildcard</span>
    <?php
        echo $this->Form->submit(__('Search', true), array('div' => false));
        echo $this->Form->end(); 
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
	<h2>Routers</h2>
	<table class="table table-condensed table-striped">
            <thead>
                <tr>
                    <th><?php echo $this->Paginator->sort('name'); ?></th>
                    <th><?php echo 'Actions'; ?></th>
                </tr>
            </thead>
            <tbody>
	<?php
	foreach ($networkrouters as $networkrouter): ?>
	<tr>
            <td><?php echo h($networkrouter['NetworkRouter']['name']);?></td>
            <td>
                <?php echo $this->MyHTML->linkIfAllowed('Edit', array('action' => 'edit', $networkrouter['NetworkRouter']['id'])); ?>
                <?php echo $this->MyHTML->postLinkIfAllowed('Delete', array('action' => 'delete', $networkrouter['NetworkRouter']['id']), null, __('Are you sure you want to delete router %s?', $networkrouter['NetworkRouter']['name'])); ?>
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
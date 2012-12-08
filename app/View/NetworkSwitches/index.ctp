<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Switch', array('action' => 'add')); ?></li>
    </ul>
    </div>
    
    <H3>Search</H3>
    <?php
      echo $this->Form->create(
          'NetworkSwitch',
          // calls the search function on the SitesController
          array('action'=>'search','class' => 'well')
      );
      echo $this->Form->input('name',array('escape' => true,'class' => 'search-query'));
      ?>
    <span class="help-block"></span>
    <?php
        echo $this->Form->submit(__('Search', true), array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
    
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>Switches</h2>
    <table class="table table-condensed table-striped">
        <thead>
            <tr>
                <th><?php echo $this->Paginator->sort('name'); ?></th>
                <th><?php echo __('Actions'); ?></th>
            </tr>
        </thead>
        <tbody>
    <?php
    foreach ($networkswitches as $networkswitch): ?>
    <tr>
        <td><?php echo $this->Html->link($networkswitch['NetworkSwitch']['name'], array('action' => 'view', $networkswitch['NetworkSwitch']['id'])); ?></td>
        <td>
            <?php echo $this->MyHTML->linkIfAllowed(('Edit'), array('action' => 'edit', $networkswitch['NetworkSwitch']['id'])); ?>
            <?php echo $this->MyHTML->postLinkIfAllowed(('Delete'), array('action' => 'delete', $networkswitch['NetworkSwitch']['id']), null, __('Are you sure you want to delete switch %s?', $networkswitch['NetworkSwitch']['name'])); ?>
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
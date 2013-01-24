<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Radio', array('action' => 'add')); ?></li>
    </ul>
    </div>
    
    <H3>Search</H3>
    <?php
      echo $this->Form->create(
          'NetworkRadio',
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
    <h2>Radios</h2>
    <table class="table table-condensed table-striped">
        <thead>
            <tr>
                <th><?php echo $this->Paginator->sort('name'); ?></th>
                <th><?php echo $this->Paginator->sort('site_id'); ?></th>
                <th><?php echo $this->Paginator->sort('radio_type_id'); ?></th>
                <th><?php echo 'Actions'; ?></th>
            </tr>
        </thead>
        <tbody>
    <?php
    foreach ($networkradios as $networkradio): ?>
    <tr>
        <td><?php echo $this->Html->link($networkradio['NetworkRadio']['name'], array('action' => 'view', $networkradio['NetworkRadio']['id']))?></td>
        <td><?php echo $networkradio['Site']['site_vf'];?></td>
        <td><?php echo $networkradio['RadioType']['name'];?></td>
        <td>
            <?php
                echo $this->MyHTML->linkIfAllowed('Edit', array('action' => 'edit', $networkradio['NetworkRadio']['id']));
                echo '&nbsp;';
                //echo $this->MyHTML->postLinkIfAllowed(__('Delete'), array('action' => 'delete', $networkradio['NetworkRadio']['id']), null, __('Are you sure you want to delete radio %s?', $networkradio['NetworkRadio']['name']));
                echo $this->MyHTML->postLinkIfAllowed('Delete',
                    array('controller'=>'networkradios','action'=>'delete', $networkradio['NetworkRadio']['id']),
                    array('method' => 'post','class'=>'confirm','data-dialog_msg'=>'Confirm delete of '.$networkradio['NetworkRadio']['name']),
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
        //echo $this->element('sql_dump');
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
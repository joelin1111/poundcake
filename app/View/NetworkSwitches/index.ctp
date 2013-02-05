<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->MyHTML->linkIfAllowed('New Switch', array('action' => 'add')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>Switches</h2>
    <table class="table table-condensed table-striped table-hover">
        <thead>
            <tr>
                <th style="text-align: center;"><?php echo $this->Paginator->sort('is_down','Status'); ?></th>
                <th><?php echo $this->Paginator->sort('name'); ?></th>
                <th><?php echo 'Actions'; ?></th>
            </tr>
        </thead>
        <tbody>
    <?php
    foreach ($networkswitches as $networkswitch): ?>
    <tr>
        <td style="width: 50px; text-align: center;"><?php echo $this->element('Common/site_status_icon', array('status' => $networkswitch['NetworkSwitch']['is_down'])); ?></td>
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
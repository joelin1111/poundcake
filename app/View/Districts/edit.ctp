<?php
    echo $this->Html->script('jquery-1.7.2');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('District.id')), null, __('Are you sure you want to delete District %s?', $this->Form->value('District.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Districts'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('District'); ?>
    <h2>Edit District</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('catchment_id');
            echo $this->Form->input('area_id');
            echo $this->Form->input('name');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    // include the Javascript which handles Ajax refresh of the
    // catchment/area/region select lists
    include 'district_form_js.php';
?>
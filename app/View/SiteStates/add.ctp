<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('List Installation States'), array('action' => 'index')); ?>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('InstallationState'); ?>
    <h2>Add Installation State</h2>
    <?php
        echo $this->Form->input('name');
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

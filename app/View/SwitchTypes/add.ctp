<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Switch Types'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('SwitchType'); ?>
    <h2>Add Switch Type</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('ports');
        echo $this->Form->input('manufacturer');
        echo $this->Form->input('model');
    ?>
    </fieldset>
    <?php echo $this->Form->end('Save'); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
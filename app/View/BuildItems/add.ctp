<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Build Items'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('BuildItem');
    //echo $this->element('sql_dump'); ?>
    <h2>Add Build Item</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('quantity');
        echo $this->Form->input('build_item_type_id', array('type'=>'select','options' => $builditemtypes)); //,'empty' => true));
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Save')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
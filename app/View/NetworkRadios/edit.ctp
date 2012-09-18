<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('NetworkRadio.id')), null, __('Are you sure you want to delete radio %s?', $this->Form->value('NetworkRadio.name'))); ?></li>
        <li><?php echo $this->Html->link(__('List Radios'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>Edit Radio</h2>
    <?php
        //echo $this->element('sql_dump');
        echo $this->Form->create('NetworkRadio');
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('site_id');
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        //echo $this->Form->input('site_id',array('label' =>'foo'));
    ?>
    </fieldset>
    <?php echo $this->Form->end(__('Submit')); ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

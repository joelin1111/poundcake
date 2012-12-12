<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink('Delete', array('action' => 'delete', $this->Form->value('RadioMode.id')), null, __('Are you sure you want to delete radio mode %s?', $this->Form->value('RadioMode.name'))); ?></li>
        <li><?php echo $this->Html->link('List Radio Modes', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('RadioMode'); ?>
    <h2>Edit Radio Mode</h2>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
            echo $this->Form->input('inverse_mode_id',
                array(
                    'type'=>'select',
                    'options' => $radiomodes,
                    'label'=>'Inverse Mode (Optional)',
                    'empty' => true
                    ));
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
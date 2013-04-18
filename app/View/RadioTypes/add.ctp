<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well"> <!-- was: well-large -->
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('List Radio Types', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('RadioType'); ?>
    <h2>Add Radio Type</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('manufacturer');
        echo $this->Form->input('radio_band_id', array('type'=>'select','options' => $radiobands));
        // checkboxes for compatable antenna types
        echo $this->Form->input('AntennaType.AntennaType',array(
            'label' => 'Compatible Antennas',
            'type' => 'select',
            'multiple' => 'checkbox',
            'options' => $antennaTypes,
        ));
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->submit('Cancel', array('name' => 'cancel','div' => false,'class'=>'btn btn-cancel'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
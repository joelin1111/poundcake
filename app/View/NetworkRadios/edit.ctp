<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('snmp_override');
?>
    
<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Radios', array('action' => 'index')); ?></li>
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
        echo $this->Form->input('site_id', array('type'=>'select','options' => $sites,'empty' => false));
        echo $this->Form->input('network_switch_id', array( 'value' => $network_switch_id, 'type' => 'hidden' ));
        echo $this->Form->input('switch_port', array(
            'label' => 'Switch/Port #',
            'type' => 'select',
            'options' => $networkswitches,
            'empty' => false
        ));       
        echo $this->Form->input('sector', array('label'=>'Sector Radio' ));
        // if the radio is a sector then enable the azimuth field
        $sector_disabled = ($this->data['NetworkRadio']['sector'] > 0 ? false : true);
        echo $this->Form->input('true_azimuth', array('label'=>'True Azimuth','disabled' => $sector_disabled));
        echo $this->Form->input('radio_type_id', array('type'=>'select','options' => $radiotypes));
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        echo $this->Form->input('radio_mode_id', array('type'=>'select','options' => $radiomodes));
        echo $this->Form->input('elevation');
        echo $this->Form->input('min_height', array('label'=>'Min. Height (meters)'));
        echo $this->Form->input('frequency', array('type'=>'select','options' => $frequencies));
        echo $this->Form->input('ssid', array('label'=>'SSID'));
        echo $this->element('Common/snmp_override');  // include fiels for SNMP override
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    // include the JQuery to handle updating the list of available
    // switches for the selected site
    echo $this->element('Common/site_change');
?>
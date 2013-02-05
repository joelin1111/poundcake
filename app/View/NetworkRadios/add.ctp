<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('sector');
    echo $this->Html->script('poundcake/poundcake-snmp_override');
?>

<div class="row">
    <?php echo $this->Html->addCrumb('Radios', '/networkRadios'); ?>
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Radios', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkRadio'); ?>
    <h2>Add Radio</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('site_id', array('type'=>'select','options' => $sites,'empty' => false));
        echo $this->Form->input('network_switch_id', array( 'value' => $network_switch_id, 'type' => 'hidden' ));
        echo $this->Form->input('switch_port', array(
            'label' => 'Switch/Port #',
            'type' => 'select',
            'options' => $networkswitches,
            'empty' => false
        ));
        //echo $this->Form->input('switch_port', array('type'=>'select','options' => $switchports,'empty' => true));
        
        echo $this->Form->input('serial');
        echo $this->Form->input('sector', array('label'=>'Sector Radio'));
        // sector will default to being un-checked, so we can disable this field by default
        echo $this->Form->input('true_azimuth', array('label'=>'True Azimuth','disabled' => true));
        echo $this->Form->input('radio_type_id', array('type'=>'select','options' => $radiotypes,'default'=>'1'));
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        echo $this->Form->input('radio_mode_id', array('type'=>'select','options' => $radiomodes));
        echo $this->Form->input('elevation');
        echo $this->Form->input('min_height', array('label'=>'Min. Height (meters)','value'=>'20')); // default value set in model?  Setting _schema not working?!
        echo $this->Form->input('frequency', array('type'=>'select','options' => $frequencies));
        echo $this->Form->input('ssid', array('label'=>'SSID'));
        echo $this->Form->input('ip_address',
                array('type' => 'text',
                    'label'=>'Primary IP Address'
                )
        );
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    // include the JQuery to handle updating the list of available
    // switches for the selected site
    echo $this->element('Common/site_change');
?>
<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
    //echo $this->Html->script('poundcake');
    echo $this->Html->script('sector');
?>
<script type="text/javascript">
/*
$(document).ready(function() {
    $("#NetworkRadioSector").click(
    function() {
       $("#NetworkRadioTrueAzimuth").each(
            function() {
               this.disabled = !this.disabled;
            }
        );
       $("#NetworkRadioMagAzimuth").each(
            function() {
               this.disabled = !this.disabled;
            }
        );
    });
});
*/
</script>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Radios'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkRadio'); ?>
    <h2>Add Radio</h2>
    <?php
    
        echo $this->Form->input('name');
        echo $this->Form->input('serial');
        echo $this->Form->input('site_id');
        echo $this->Form->input('sector', array('label'=>'Sector Radio'));
        // sector will default to being un-checked, so we can disable these fields
        echo $this->Form->input('true_azimuth', array('label'=>'True Azimuth','disabled' => true));
        echo $this->Form->input('mag_azimuth', array('label'=>'Magnetic Azimuth','disabled' => true));
        //echo $this->Form->input('true_azimuth', array('label'=>'True Azimuth'));
        //echo $this->Form->input('mag_azimuth', array('label'=>'Magnetic Azimuth'));
        
        echo $this->Form->input('radio_type_id', array('type'=>'select','options' => $radiotypes,'default'=>'1'));
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        echo $this->Form->input('radio_mode_id', array('type'=>'select','options' => $radiomodes));
        echo $this->Form->input('elevation');
        echo $this->Form->input('min_height', array('label'=>'Min. Height (meters)'));
        echo $this->Form->input('frequency', array('type'=>'select','options' => $frequencies));
        echo $this->Form->input('ssid', array('label'=>'SSID'));
        echo $this->Form->input('network_switch_id', array('type'=>'select','options' => $networkswitches,'empty' => true));
        echo $this->Form->input('switch_port', array('type'=>'select','options' => $switchports));
        
        echo $this->Form->end(__('Save'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    // include the JQuery to handle updating the list of available ports for the selected switch
    echo $this->element('Common/switch_change');
?>
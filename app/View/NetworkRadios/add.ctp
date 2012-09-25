<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
?>

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
        echo $this->Form->input('site_id');
        echo $this->Form->input('radio_type_id', array('type'=>'select','options' => $radiotypes));
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        echo $this->Form->input('link_distance', array('label'=>'Link Distance'));
        echo $this->Form->input('true_azimuth', array('label'=>'True Azimuth'));
        //echo $this->Form->input('mag_azimuth', array('label'=>'Magnetic Azimuth'));
        echo $this->Form->input('elevation');
        echo $this->Form->input('frequency', array('type'=>'select','options' => $frequencies));
        echo $this->Form->input('ssid', array('label'=>'SSID'));
        echo $this->Form->input('network_switch_id', array('type'=>'select','options' => $networkswitches,'empty' => true));
        echo $this->Form->input('switch_port', array('type'=>'select','options' => $switchports));
        
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<?php
    // include the JQuery to handle updating the list of available ports for the selected switch
    echo $this->element('Common/switch_change');
?>

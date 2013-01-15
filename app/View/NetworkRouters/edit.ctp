<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('snmp_override');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Routers', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkRouter'); ?>
    <h2>Edit Router</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('site_id', array('type'=>'select','options' => $sites));
        echo $this->Form->input('router_type_id', array('type'=>'select','options' => $routertypes));
        echo $this->Form->input('serial');
        echo $this->element('Common/snmp_override');  // include fiels for SNMP override
        // the IPv4 behavior is correctly decoding the IP address, but this doesn't
        // seem to populate the form:
        // echo $this->Form->input('ip_address', array('label'=>'Primary IP'));
        echo $this->Form->input('ip_address', array(
            'label' => 'Primary IP Address',
            'type' => 'text',
            // 'value' => '1\.2\.3\.4'
            'value' => $this->data['NetworkRouter']['ip_address'],
            'placeholder' => 'For Testing'
        ));
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

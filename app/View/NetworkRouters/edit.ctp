<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('poundcake/poundcake-snmp-override');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('List Routers', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkRouter'); ?>
    <h2>Edit Router</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
//        echo $this->Form->input('site_id', array('type'=>'select','options' => $sites));
        // see comments in edit for why this field is here
        echo $this->Form->input('old_site_id', array('type'=>'hidden','value' => $old_site_id ));
        echo $this->Form->input('Site.id', array('type'=>'select','options' => $sites,'label'=>'Site'));
        echo $this->Form->input('router_type_id', array('type'=>'select','options' => $routertypes));
        echo $this->Form->input('serial');
        echo $this->element('Common/snmp_override');  // include fiels for SNMP override
        // the IPv4 behavior is correctly decoding the IP address, but this doesn't
        // seem to populate the form:
        // echo $this->Form->input('ip_address', array('label'=>'Primary IP'));
        echo $this->Form->input('ip_address', array(
            'label' => 'Primary IP Address (Legacy)',
            'type' => 'text',
            // 'value' => '1\.2\.3\.4'
            'value' => $this->data['NetworkRouter']['ip_address'],
            'placeholder' => 'For Testing'
        ));
        echo $this->Form->input('ip_space_id', array('type'=>'select','label'=>'IP Address','options' => $ip_spaces));
        echo $this->Form->input('project_id', array('type'=>'hidden','value' => $project_id ));
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

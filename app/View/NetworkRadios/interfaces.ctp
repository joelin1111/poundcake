<?php
    // jQuery to enable/disable fields based on checkbox
    // echo $this->Html->script('poundcake/sector');
    echo $this->Html->script('poundcake/poundcake-snmp-override');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well">
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('View Radio', array('action' => 'view',$id,null)); ?>
        <li><?php echo $this->PoundcakeHTML->link('List Radios', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkInterfaceIpSpace'); ?>
    <h2>Configure Interface</h2>
    <?php
//    echo '<pre>';
//    var_dump($interfaces);
        $n = 0;
        foreach( $interfaces as $interface ) {
            echo $this->Form->input('NetworkInterfaceIpSpace.'.$n.'.ip_space_id',
                    array(
                        'type' => 'select',
                        'label' => $if_name.$n, // eth0, eth1, etc.
                        'options' => $ip_spaces,
                        'empty' => true,
                        'default' => $interface['NetworkInterfaceIpSpace']['ip_space_id']
                    ));
            // the number of the interface
            echo $this->Form->input('NetworkInterfaceIpSpace.'.$n.'.if_number',
                    array(
                        'value' => $n,
                        'type' => 'hidden'
                ));
            echo $this->Form->input('NetworkInterfaceIpSpace.'.$n.'.network_interface_type_id',
                    array(
                        'value' => $interface['NetworkInterfaceIpSpace']['network_interface_type_id'],
                        'type' => 'hidden'
                ));
            echo $this->Form->input('NetworkInterfaceIpSpace.'.$n.'.network_radio_id',
                    array(
                        'value' => $id, // NetworkRadio.id
                        'type' => 'hidden'
                ));                
            $n++;
        }            

        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->submit('Cancel', array('name' => 'cancel','div' => false,'class'=>'btn btn-cancel'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
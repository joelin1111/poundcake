<table>
<?php
//    echo $this->Form->input('NetworkInterfaceType.NetworkInterfaceType',array(
//        'label' => __('Network Interface Types',true),
//        'type' => 'select',
//        'multiple' => 'checkbox',
//        'options' => $networkInterfaceTypes,
//        'selected' => $this->Html->value('NetworkInterfaceType.NetworkInterfaceType'),
//    ));
    
//    var_dump( $existing_network_interface_types );

    $n = 0;
    foreach ( $networkInterfaceTypes as $networkInterfaceType ) {
        $checked = false;
        $number = 0;
        
        // true if we're on the edit page
        if ( isset($existing_network_interface_types) ) {
            foreach( $existing_network_interface_types as $e ) {
                if ( $networkInterfaceType['NetworkInterfaceType']['id'] == $e['network_interface_type_id'] ) {
                    $checked = true;
                    $number = $e['number'];
                }
            }
        }
//        var_dump($networkInterfaceType);
        // strtolower because Cake will capitalize the first letter,
        // and in this case we don't want eth to be Eth
        // strtolower doesn't seem t work on the first argument
        $id = $networkInterfaceType['NetworkInterfaceType']['id'];
        $label = strtolower( $networkInterfaceType['NetworkInterfaceType']['name'] );
        echo '<tr><td>';
        echo $this->Form->input(
                'NetworkInterfaceTypeSwitchType.'.$id.'][network_interface_type_id]',
                array(
                    'value' => $id,
                    'label' => $label,
                    'type' => 'checkbox',
                    'checked' => $checked
                )
        );
        echo '</td><td>';
        echo $this->Form->input( 'NetworkInterfaceTypeSwitchType.'.$id.'][number]',
                array(
                    'label' =>'',
                    'value'=> $number,
                    'style'=>'width:30px;'
            )
        );        
        echo '</td></tr>';
        
        $n++;        
    }
 ?>
</table>
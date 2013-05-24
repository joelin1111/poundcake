<?php
    echo $this->Form->input('NetworkInterface.NetworkInterface',array(
        'label' => __('Network Interfaces',true),
        'type' => 'select',
        'multiple' => 'checkbox',
        'options' => $networkInterfaceTypeTypes,
        'selected' => $this->Html->value('NetworkInterface.NetworkInterface'),
    ));
?>

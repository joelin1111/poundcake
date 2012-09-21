
<?php
    //$this->Js->get('#NetworkRadioNetworkSwitchId')->event('change', $this->Js->alert('changed'));    
    $this->Js->get('#NetworkRadioNetworkSwitchId');    
    $this->Js->event('change',
        $this->Js->request(array(
        'controller' => 'networkSwitches',
            'action'=>'getPortsBySwitchType'),
                array('async' => true,
                    'update' => '#NetworkRadioSwitchPort',
                    'dataExpression' => true,
                    'data'=> $this->Js->serializeForm(
                            array(
                                'isForm' => true,
                                'inline'=> true
                                )
                            ),
                    'method' => 'post'
                    )
                )
    );
    echo $this->Js->writeBuffer(); // Write cached scripts
?>

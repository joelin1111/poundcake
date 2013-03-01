<?php
//    $this->Js->get('#NetworkRadioRadioTypeId')->event('change', $this->Js->alert('changed'));    
    $this->Js->get('#NetworkRadioRadioTypeId');    
    $this->Js->event('change',
        $this->Js->request(
                array(
                    'controller' => 'radioTypes',
                    'action' => 'getFrequenciesForRadioType'
                ),
                array(
                    'async' => true,
                    'update' => '#NetworkRadioFrequency',
                    'dataExpression' => true,
                    'data'=> $this->Js->serializeForm (
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

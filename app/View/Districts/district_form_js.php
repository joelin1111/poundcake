<?php
    // $this->Js->get('#catchment_id')->event('change', $this->Js->alert('hey you!'));

    // this creates the Javascript to refresh the Areas select box after a user
    // picks a District -- basically call getByCatchment on the Areas controller
    // which dynamically replaces just the HTML for $this->Form->select('area_id')
    // with the view code defined in Areas/get_by_catchment.ctp
    
    // the user has changed the Area, so update the Regipon
    /*
    $this->Js->get('#DistrictAreaId')->event('change',
        $this->Js->request(array(
            'controller' => 'districts',
            'action'=>'getByArea'),
                array('async' => true,
                    'update' => '#DistrictAreaId',
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
    */
    //echo $this->Html->scriptBlock($("#DistrictAreaId").trigger("change"););
    
    // the user has changed the District, so update the Area
    $this->Js->get('#DistrictCatchmentId')->event('change',
        $this->Js->request(array(
            'controller' => 'areas',
            'action'=>'getByCatchment'),
                array('async' => true,
                    'update' => '#DistrictAreaId',
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
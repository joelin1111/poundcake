<?php
    echo $this->Html->script('jquery-1.7.2');
?>

<fieldset>
    <legend><?php echo __('Add School'); ?></legend>
<?php
    echo $this->Form->create('School', array('action'=>'add'));
    echo $this->Form->input('School.site_name');
    
    // drop down meny of available catchments, etc.
    //echo $this->Form->input('School.catchment_id', array('type'=>'select','options' => $catchments));
    echo $this->Form->input('catchment_id');
    //echo $this->Form->input('School.area_id', array('type'=>'select','options' => $areas));
    echo $this->Form->input('area_id');
    //echo $this->Form->input('School.district', array('label'=>'School District')); // another syntax of labeling fields
    //echo $this->Form->input('district_id',array('disabled' => true));
    echo $this->Form->input('district_id');
    
    echo $this->Form->input('trc_id');
    
    echo $this->Form->input('School.school_code');
    echo $this->Form->input('School.type');
    echo $this->Form->input('School.sn');
    
    // drop down menu of available connectivity types
    echo $this->Form->input('School.connectivity_type_id', array('type'=>'select','options' => $connectivitytypes));
    // drop down menu of available intervention types
    echo $this->Form->input('School.intervention_type_id', array('type'=>'select','options' => $interventiontypes));
    // drop down menu of available service providers
    echo $this->Form->input('School.service_provider_id', array('type'=>'select','options' => $serviceproviders));
    // drop down menu of available installation states
    echo $this->Form->input('School.site_state_id', array('type'=>'select','options' => $sitestates));
    // drop down menu of available power types
    echo $this->Form->input('School.power_type_id', array('type'=>'select','options' => $powertypes));
    
    // see documentation on Edit page
    echo $this->Form->input('lat', array (
        'label' => 'Latitude',
        'value' => ''
        )
    );
    
    echo $this->Form->input('lon', array (
        'label' => 'Longitude',
        'value' => ''
        )
    );
    // no upload field since we don't have a School.id until after save
    echo $this->Form->end('Save school');
?>
</fieldset>

<?php
    //$this->Js->get('#SchoolCatchmentId')->event('change', $this->Js->alert('catchment changed!'));
    //$this->Js->get('#catchment_id')->event('change', $this->Js->alert('hey you!'));

    // this creates the Javascript to refresh the Areas select box after a user
    // picks a District -- basically call getByCatchment on the Areas controller
    // which dynamically replaces just the HTML for $this->Form->select('area_id')
    // with the view code defined in Areas/get_by_catchment.ctp

    $this->Js->get('#SchoolCatchmentId');
    $this->Js->event('change',
        $this->Js->request(array(
        'controller' => 'areas',
                'action'=>'getByCatchment'),
                    array('async' => true,
                        'update' => '#SchoolAreaId',
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
    
    $this->Js->get('#SchoolAreaId');
    $this->Js->event('change',
        $this->Js->request(array(
        'controller' => 'districts',
                'action'=>'getByArea'),
                    array('async' => true,
                        'update' => '#SchoolDistrictId',
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
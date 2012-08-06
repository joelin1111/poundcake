<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
    # jquery UI - for the date picker
    echo $this->Html->script('jquery-ui-1.8.21.custom.min');
    # other date picker stuff is in poundcake and datepicker js files
    echo $this->Html->script('poundcake');
    echo $this->Html->script('datepicker');
?>

<fieldset>
    <legend><?php echo __('Edit School'); ?></legend>
<?php
    //echo $this->Form->create('School', array('action' => 'edit'));
    echo $this->Form->create('School');
    echo $this->Form->input('id', array('type'=>'hidden'));
    echo $this->Form->input('site_name');
    
    //echo "<pre>".print_r($this->request->data)."</pre>";
     
    // drop down meny of available catchments, etc.
    echo $this->Form->input('catchment_id');
    echo $this->Form->input('area_id');
    echo $this->Form->input('district_id');
    echo $this->Form->input('trc');
    echo $this->Form->input('school_code');
    echo $this->Form->input('type');
    echo $this->Form->input('sn');
     
    // drop down menu of available link types
    echo $this->Form->input('School.connectivity_type_id', array('type'=>'select','options' => $connectivitytypes));
    // drop down menu of available intervention types
    echo $this->Form->input('School.intervention_type_id', array('type'=>'select','options' => $interventiontypes));
    // drop down menu of available intervention types
    echo $this->Form->input('School.service_provider_id', array('type'=>'select','options' => $serviceproviders));
    // drop down menu of available intervention types
    echo $this->Form->input('School.site_state_id', array('type'=>'select','options' => $sitestates));
    // drop down menu of available power types
    echo $this->Form->input('School.power_type_id', array('type'=>'select','options' => $powertypes));
    // drop down menu of available power types
    echo $this->Form->input('School.road_type_id', array('type'=>'select','options' => $roadtypes));
    
    // again, we're treating the latitude and longitude values special here,
    // accessing them by a vaiarable since we have to save them to the model
    // in a special way so that MySQL treats it as spatial data
    //echo "<pre>".$lat."</pre>";
    
    echo $this->Form->input('lat', array (
        'label' => 'Latitude',
        'value' => $lat
        )
    );
    
    echo $this->Form->input('lon', array (
        'label' => 'Longitude',
        'value' => $lon
        )
    );
    
    echo $this->Form->input('access_instruction', array('type'=>'textarea','label' => 'Access Instructions', 'rows' => 15, 'cols' => 35));
    
    echo $this->Form->input('install_date', 
        array(
           'class'=>'datepicker', 
           'type'=>'text'
        )
    );
   echo "<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>";
    
    // this is the upload field
    echo $this->Upload->edit('School', $this->Form->fields['School.id']); 
    
    echo $this->Form->end('Save School');
    
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

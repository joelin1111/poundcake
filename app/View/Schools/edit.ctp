<h1>Edit School</h1>
<?php
    echo $this->Form->create('School', array('action' => 'edit'));
    echo $this->Form->input('id', array('type'=>'hidden'));
    echo $this->Form->input('primary_school');
    
    // drop down meny of available catchments, etc.
    echo $this->Form->input('School.catchment_id', array('type'=>'select','options' => $catchments));
    echo $this->Form->input('School.area_id', array('type'=>'select','options' => $areas));
    echo $this->Form->input('School.district_id', array('type'=>'select','options' => $districts));
    
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
    
    // this is the upload field
    echo $this->Upload->edit('School', $this->Form->fields['School.id']); 
    echo $this->Form->end('Save School');
?>

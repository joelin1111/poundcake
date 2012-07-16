<h1>Add School</h1>
<?php
    echo $this->Form->create('School', array('action'=>'add'));
    echo $this->Form->input('School.primary_school');
    // drop down meny of available regions
    echo $this->Form->input('School.province_id', array('type'=>'select','options' => $provinces));
    echo $this->Form->input('School.district', array('label'=>'School District')); // another syntax of labeling fields
    echo $this->Form->input('School.trc');
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
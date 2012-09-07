<?php
    echo $this->Html->script('jquery-1.7.2.min'); // min only works with Bootstrap dropdown?
    //echo $this->Html->script('poundcake');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('List Sites'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h3>Add Site</h3>
<?php
    echo $this->Form->create('Site', array('action'=>'add'));
    echo $this->Form->input('Site.school_name');
    
    // drop down meny of available zones, etc.
    //echo $this->Form->input('Site.catchment_id', array('type'=>'select','options' => $catchments));
    echo $this->Form->input('zone_id');
    
    echo $this->Form->input('Site.site_code');
    echo $this->Form->input('Site.type');
    
    // drop down menu of available connectivity types
    echo $this->Form->input('Site.connectivity_type_id', array('type'=>'select','options' => $connectivitytypes));
    // drop down menu of available intervention types
    echo $this->Form->input('Site.intervention_type_id', array('type'=>'select','options' => $interventiontypes));
    // drop down menu of available service providers
    echo $this->Form->input('Site.service_provider_id', array('type'=>'select','options' => $serviceproviders));
    // drop down menu of available installation states
    echo $this->Form->input('Site.site_state_id', array('type'=>'select','options' => $sitestates));
    // drop down menu of available power types
    echo $this->Form->input('Site.power_type_id', array('type'=>'select','options' => $powertypes));
    
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
    // no upload field since we don't have a Site.id until after save
    echo $this->Form->end('Save site');
?>
</fieldset>

<?php
    /*
    //$this->Js->get('#SchoolCatchmentId')->event('change', $this->Js->alert('catchment changed, again!'));
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
    */
    //In client side JS, onchange is dependant upon onfocus() and onblur().
    //So when you simply change the value of a select element, niehter focus
    //nor blur happens to that element so onchange is never evoked.
?>
<?php
    # include Jquery
    echo $this->Html->script('jquery-1.7.2');
    # jquery UI - for the date picker
    echo $this->Html->script('jquery-ui-1.8.21.custom.min');
    # other date picker stuff is in poundcake and datepicker js files
    echo $this->Html->script('poundcake');
    echo $this->Html->script('datepicker');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Site.id')), null, __('Are you sure you want to delete site %s?', $this->Form->value('Site.site_id'))); ?></li>
        <li><?php echo $this->Html->link(__('List Sites'), array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo __('Edit Site');

    //echo $this->Form->create('School', array('action' => 'edit'));
    echo $this->Form->create('Site');
    echo $this->Form->input('id', array('type'=>'hidden'));
    //echo $this->Form->input('site_name');
    echo $this->Form->input('site_name',
            array('error' => array('attributes' => array('wrap' => 'span', 'class' => 'label label-important'))));
    
    echo $this->Form->input('Site.site_state_id', array('type'=>'select','options' => $sitestates));
    
    /*echo $this->Form->input(
        'live',
        array(
            'options' => $live_options,
            'type' => 'select',
            'empty' => false,
            'label' => 'Site Status'
        )
    );*/
    
    
    //echo "<pre>".print_r($this->request->data)."</pre>";
     
    // drop down meny of available zones, etc.
    
    echo $this->Form->input('site_code');
    echo $this->Form->input('Site.tower_owner_id', array('type'=>'select','options' => $towerowners));
    
    echo $this->Form->input('Site.power_type_id', array('type'=>'select','options' => $powertypes));
    //echo $this->Form->input('Site.road_type_id', array('type'=>'select','options' => $roadtypes));
    echo $this->Form->input('Site.network_switch_id', array('type'=>'select','options' => $networkswitches));
    echo $this->Form->input('Site.network_router_id', array('type'=>'select','options' => $networkrouters));

    echo $this->Form->input( 'lat', array( 'label' => 'Latitude' ) );
    echo $this->Form->input( 'lon', array( 'label' => 'Longitude' ) );
    
    echo $this->Form->input('zone_id');
    
    echo $this->Form->input('Site.tower_guard',array('style' => 'width:100%','label'=>'Tower Guard Contact Info'));
    echo $this->Form->input('Site.structure_type',array('style' => 'width:100%'));
    echo $this->Form->input('Site.description',array('style' => 'width:100%'));
    echo $this->Form->input('Site.mounting',array('style' => 'width:100%'));
    echo $this->Form->input('Site.access',array('style' => 'width:100%'));
    echo $this->Form->input('Site.storage',array('style' => 'width:100%'));
    echo $this->Form->input('Site.accommodations',array('style' => 'width:100%'));
    echo $this->Form->input('Site.notes',array('style' => 'width:100%'));
    
    echo $this->Form->input('install_date', 
        array(
           'class'=>'datepicker', 
           'type'=>'text'
        )
    );
    
    // this is the upload field
    echo $this->Upload->edit('Site', $this->Form->fields['Site.id']); 
    
    echo $this->Form->end('Save');
    /*
    $options = array(
        'label' => 'Save 2',
        'div' => array(
        'class' => 'btn',
        )
    );
    echo $this->Form->end($options);
    */

    /*
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
?>

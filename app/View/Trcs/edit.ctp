<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Trc.id')), null, __('Are you sure you want to delete TC/TRC %s?', $this->Form->value('Trc.trc_name'))); ?></li>
        <li><?php echo $this->Html->link(__('List TCs/TRCs'), array('action' => 'index')); ?></li>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Trc'); ?>
    <h2>Edit TC/TRC</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('trc_name');
        
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
    
    
        echo $this->Form->end(__('Save'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
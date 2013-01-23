<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
        <ul>
            <li><?php echo $this->Html->link('List Sites', array('action' => 'index')); ?></li>
        </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h3>Add Site: <?php echo $this->Session->read('project_name'); ?></h3>
<?php
    echo $this->Form->create('Site', array('action'=>'add'));
    echo $this->Form->input('Site.name');
    echo $this->Form->input('Site.code');
    echo $this->Form->input('zone_id');
    echo $this->Form->input('lat', array ('label' => 'Latitude','value' => ''));
    echo $this->Form->input('lon', array ('label' => 'Longitude','value' => ''));
    echo $this->Form->input('declination', array('type'=>'hidden'));
    echo $this->Form->input('project_id', array('type'=>'hidden','value'=>$this->Session->read('project_id')));
    
    echo $this->Form->input('install_date', 
        array(
           'class'=>'datepicker', 
           'type'=>'text'
        )
    );
    
    // drop down menus of available items
    echo $this->Form->input('Site.site_state_id', array('type'=>'select','options' => $sitestates));
    echo $this->Form->input('Site.organization_id', array('type'=>'select','options' => $organizations));
    
    echo $this->Form->input('Site.tower_type_id', array('type'=>'select','options' => $towertypes, 'empty' => true));
    echo $this->Form->input('Site.tower_member_id', array('type'=>'select','options' => $towermembers, 'empty' => true));
    echo $this->Form->input('Site.tower_mount_id', array('type'=>'select','options' => $towermounts, 'empty' => true));
    echo $this->Form->input('Site.equipment_space_id', array('type'=>'select','options' => $equipmentspace,'label' => 'Equipment Space'));
    
    echo $this->Form->input('Site.power_type_id', array('type'=>'select','options' => $powertypes));
    echo $this->Form->input('NetworkSwitch.name',array('label' => 'Add New Switch'));
    echo $this->Form->input('NetworkRouter.name',array('label' => 'Add New Router'));
    echo $this->element('Common/radio_builder');
    
    echo $this->Form->input('Site.tower_guard',array('style' => 'width:100%','label'=>'Tower Guard Contact Info'));
    echo $this->Form->input('Site.structure_type',array('style' => 'width:100%'));
    echo $this->Form->input('Site.description',array('style' => 'width:100%'));
    echo $this->Form->input('Site.mounting',array('style' => 'width:100%'));
    echo $this->Form->input('Site.access',array('style' => 'width:100%'));
    echo $this->Form->input('Site.storage',array('style' => 'width:100%'));
    echo $this->Form->input('Site.accommodations',array('style' => 'width:100%'));
    echo $this->Form->input('Site.notes',array('style' => 'width:100%'));
    
    // no upload field since we don't have a Site.id until after save
    echo $this->Form->end('Save', array('div' => false,'class'=>'btn'));
?>
</fieldset>
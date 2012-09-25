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
        <li><?php echo $this->Html->link(('View Site'), array('action' => 'view', $this->Form->value('Site.id')))?></li>
        <li><?php echo $this->Html->link(__('List Sites'), array('action' => 'index')); ?></li>
        <li><?php echo $this->Form->postLink(__('Delete'), array('action' => 'delete', $this->Form->value('Site.id')), null, __('Are you sure you want to delete site %s?', $this->Form->value('Site.site_id'))); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h3>Edit Site</h3>
    
    <div class="flash flash_success">
        <?php echo $this->Session->flash(); ?>
    </div>

    <?php

    //echo $this->Form->create('School', array('action' => 'edit'));
    echo $this->Form->create('Site', array('action' => 'edit'));
    echo $this->Form->input('id', array('type'=>'hidden'));
    echo $this->Form->input('site_name', array('error' => array('attributes' => array('wrap' => 'span', 'class' => 'label label-important')))); // still testing
    echo $this->Form->input('site_code');
    echo $this->Form->input('zone_id');
    echo $this->Form->input('lat', array ('label' => 'Latitude')); // ,'value' => ''
    echo $this->Form->input('lon', array ('label' => 'Longitude'));
    echo $this->Form->input('declination', array('type'=>'hidden'));
    echo $this->Form->input('install_team_id', array('type'=>'select','options' => $installteams,'label' => 'Install Team'));
    
    echo $this->Form->input('install_date', 
        array(
           'class'=>'datepicker', 
           'type'=>'text'
        )
    );
    
    echo $this->Form->input('Site.site_state_id', array('type'=>'select','options' => $sitestates));
    echo $this->Form->input('Site.tower_owner_id', array('type'=>'select','options' => $towerowners));
    echo $this->Form->input('Site.power_type_id', array('type'=>'select','options' => $powertypes));
    
    // if the site has no switch, give them the option to add one -- otherwise, give them a pick list
    if (empty($this->request->data['NetworkSwitch']['name'])) {
        echo $this->Form->input('NetworkSwitch.name',array('label' => 'Add New Switch'));
    } else {
        echo $this->Form->input('Site.network_switch_id', array('type'=>'select','options' => $networkswitches,'label' => 'Switch'));
    }
    
    // ditto for routers
    if (empty($this->request->data['NetworkRouter']['name'])) {
        echo $this->Form->input('NetworkRouter.name',array('label' => 'Add New Router'));
    } else {
        echo $this->Form->input('Site.network_router_id', array('type'=>'select','options' => $networkrouters,'label' => 'Router'));
    }
    
    
    //echo $this->Form->input('Site.network_switch_id', array('type'=>'select','options' => $networkswitches));
    //echo $this->Form->input('Site.network_router_id', array('type'=>'select','options' => $networkrouters));
    //echo $this->Form->input('NetworkRouter.name',array('label' => 'Add New Router'));

    //print_r($this->request->data['NetworkRadios']);
    $c = count($this->request->data['NetworkRadios']);
    //echo "c is".$c;
    if ($c > 0) {
        echo "<table class=\"table table-condensed table-striped\">";
        echo "<th>Radio</th>";
        echo "<th>Frequency</th>";
        echo "<th>SSID</th>";

        foreach ($this->request->data['NetworkRadios'] as $radio) {
            echo "<tr><td>";
            echo $this->Html->link(__($radio['name']), array(
                'controller' => 'networkRadios',
                'action' => 'view',
                $radio['id']));
            echo "</td>";

            echo "<td>";
            if (!empty($radio['frequency'])) {
                 echo $radio['frequency'];
            } else {
                echo "-";
            }
            echo "</td>";

            echo "<td>";
            if (!empty($radio['ssid'])) {
                 echo $radio['ssid'];
            } else {
                echo "-";
            }
            echo "</td>";

            echo "</tr>";
        }
        echo "</table>";
    }
    ?>
        </table>

    
    <?php
    echo $this->element('Common/radio_builder');

    echo $this->Form->input('Site.tower_guard',array('style' => 'width:100%','label'=>'Tower Guard Contact Info'));
    echo $this->Form->input('Site.structure_type',array('style' => 'width:100%'));
    echo $this->Form->input('Site.description',array('style' => 'width:100%'));
    echo $this->Form->input('Site.mounting',array('style' => 'width:100%'));
    echo $this->Form->input('Site.access',array('style' => 'width:100%'));
    echo $this->Form->input('Site.storage',array('style' => 'width:100%'));
    echo $this->Form->input('Site.accommodations',array('style' => 'width:100%'));
    echo $this->Form->input('Site.notes',array('style' => 'width:100%'));
    
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

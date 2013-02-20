<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Projects', array('action' => 'index')); ?></li>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
        <?php
        echo $this->element('Common/date_format');
        echo $this->element('Common/zoom_level');
    ?>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Project'); ?>
    <h2>Edit Project</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('default_lat', array( 'label' => 'Default Latitude' ));
        echo $this->Form->input('default_lon', array( 'label' => 'Default Longitude' ));
        echo $this->Form->input('workorder_title', array( 'label' => 'Title for Workorder' ));
        echo $this->Form->input('datetime_format', array( 'label' => 'Datetime Format (PHP compatible)' ));
        echo $this->Form->input('snmp_type_id', array('type'=>'select','options' => $snmptypes, 'label' => 'SNMP Version', 'empty' => true));
        echo $this->Form->input('snmp_community_name', array( 'label' => 'SNMP Community Name' ));
        echo $this->Form->input('monitoring_system_type_id', array('type'=>'select','options' => $monitoringSystemTypes, 'label' => 'Monitoring System Type', 'empty' => true));
        echo $this->Form->input('monitoring_system_username', array( 'label' => 'Monitoring System Username' ));
        echo $this->Form->input('monitoring_system_password', array( 'type'=>'password', 'label' => 'Monitoring System Password' ));
        //echo $this->Form->input('monitoring_system_password', array( 'label' => 'Monitoring System Password' ));
        echo $this->Form->input('monitoring_system_url', array( 'label' => 'Complete URL to ReST API','placeholder' => '' ));
    ?>
    
    <table class="table table-condensed table-striped">
        <tr>
            <th>Username</th>
            <th>Role</th>
        </tr>
        <?php
            $project_id = $this->request->data['Project']['id'];
            $n = 0;
            var_dump( $this->request->data );
            foreach ($this->request->data['User'] as $user ) {
                //var_dump( $user );
                echo '<tr><td>'.$user['username'].'</td>';
                echo $this->Form->input('ProjectRoles.'.$n.'.project_id',array( 'type' => 'hidden', 'value' => $project_id ));
                echo $this->Form->input('ProjectRoles.'.$n.'.user_id',array( 'type' => 'hidden', 'value' => $user['id']));
                //echo $this->Form->input("User.{$user['id']}.user_id",array( 'type' => 'hidden', 'value' => $user['id']));
                //echo '<td>'.$this->Form->input("Role.{$user['id']}.role_id", array('type'=>'select','options' => $roles, 'label' => '')).'</td></tr>';
                //echo '<td>'.$this->Form->input("Project.{$user['id']}.role_id", array('type'=>'select','options' => $roles, 'label' => '')).'</td></tr>';
                echo '<td>'.$this->Form->input('ProjectRoles.'.$n.'.role_id', array('type'=>'select','options' => $roles, 'label' => '')).'</td></tr>';
                $n++;
            }
        ?>
    </table>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
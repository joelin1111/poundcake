<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well">
    <ul>
        <li><?php echo $this->Html->link('List IP Spaces', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('IpSpace'); ?>
    <h2>Add IP Space</h2>
    <?php
        echo $this->Form->hidden('parent_id', array( 'value' => $parent_id ));        
        echo $this->Form->input('name', array( 'value' => 'subnet', 'required' => false ));
        echo $this->Form->input('cidr', array( 'label' => 'CIDR', 'options' => $cidrs, 'selected'=> '0' ));
        echo $this->Form->hidden('project_id', array( 'value' => $project_id ));        
    ?>
    </fieldset>
    <?php
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->submit('Cancel', array('name' => 'cancel','div' => false,'class'=>'btn btn-cancel'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
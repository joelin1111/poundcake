<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Site States', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('SiteState', array('type' => 'file')); ?>
    <h2>Edit Installation State</h2>
    <?php
        echo $this->Form->input('id');
        echo $this->Form->input('name');
        echo $this->Form->input('project_id');
        echo $this->Form->input('sequence');
        echo $this->Form->file('File');
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->
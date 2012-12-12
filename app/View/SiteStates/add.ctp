<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Site States'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php
        //echo $this->Form->create('SiteState',array('action' => 'add', 'type' => 'file'));
        echo $this->Form->create('SiteState', array('type' => 'file'));
    ?>
    <h2>Add Installation State</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('sequence');
        echo $this->Form->file('File');
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

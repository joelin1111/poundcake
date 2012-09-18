<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Radios'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('NetworkRadio'); ?>
    <h2>Add Radio</h2>
    <?php
        echo $this->Form->input('name');
        echo $this->Form->input('site_id');
        echo $this->Form->input('radio_type_id', array('type'=>'select','options' => $radiotypes));
        echo $this->Form->input('antenna_type_id', array('type'=>'select','options' => $antennatypes));
        ////echo $this->Form->input('site_name');
        //echo $this->Form->input('Site.site_name', array('type'=>'select','options' => $sites));
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



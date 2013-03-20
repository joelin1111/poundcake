<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well"> <!-- was: well-large -->
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('List Build Items', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('BuildItem'); ?>
    <h2>Edit Build Item</h2>
    <?php
        echo $this->Form->input('name',array('style' => 'width: 500px;'));
        echo $this->Form->input('quantity');
        echo $this->Form->input('build_item_type_id', array('type'=>'select','options' => $builditemtypes)); //,'empty' => true));
        echo $this->Form->submit('Save', array('div' => false,'class'=>'btn btn-primary'));
        echo $this->Form->end(); 
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

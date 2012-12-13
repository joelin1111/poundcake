<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Changes', array('action' => 'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('ChangeLog'); ?>
    <h2>Edit Change</h2>
    <?php
        echo $this->Form->input('version');
        echo $this->Form->input('release_date', 
            array(
               'class'=>'datepicker', 
               'type'=>'text'
            )
        );
        echo $this->Form->input('description');
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

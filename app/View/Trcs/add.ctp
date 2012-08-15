<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <ul>
        <li><?php echo $this->Html->link(__('List TCs/TRCs'), array('action' => 'index')); ?>
    </ul>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <?php echo $this->Form->create('Trc'); ?>
    <h2>Add TC/TRC</h2>
    <?php
        echo $this->Form->input('trc_name',array('label' => 'Name'));
        echo $this->Form->end(__('Submit'));
    ?>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

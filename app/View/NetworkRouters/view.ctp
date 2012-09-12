<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Routers'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Router</h2>
    <P><B>Name:</B>&nbsp;<?php echo $networkrouter['NetworkRouter']['name']; ?></P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->



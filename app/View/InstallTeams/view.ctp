<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link(__('List Install Teams'), array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Install Team</h2>
    <P><B>Name:</B>&nbsp;<?php echo $contact['InstallTeam']['name']; ?></P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Changes', array('action' => 'index')); ?>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Change</h2>
    <P><B>Version:</B>&nbsp;<?php echo $changeLog['ChangeLog']['version']; ?></P>
    <P><B>Date:</B>&nbsp;
        <?php
        //echo $changeLog['ChangeLog']['release_date'];
        $date = new DateTime($changeLog['ChangeLog']['release_date']);
        echo $date->format('Y-m-d');
        ?>
    </P>
    <P><B>Description:</B>&nbsp;<?php echo $changeLog['ChangeLog']['description']; ?></P>
</div> <!-- /.span9 -->
</div> <!-- /.row -->

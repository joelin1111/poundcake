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
    <P><B>Name:</B>&nbsp;<?php echo $installteam['InstallTeam']['name']; ?></P>
    
    <?php
    //echo '<pre>';
    foreach ($installteam['Contact'] as $key => $value) {
        //print_r($installteam['Contact']);
        echo $this->Html->link($installteam['Contact'][$key]['name_vf'], array('action' => 'view', 'controller' => 'contacts',$installteam['Contact'][$key]['id']));
    }
    //echo '</pre>';  
?>
    
</div> <!-- /.span9 -->
</div> <!-- /.row -->

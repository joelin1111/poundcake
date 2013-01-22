<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Site States', array('action' => 'index')); ?>
        <li><?php echo $this->Html->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Site State</h2>
    <P><B>Name:</B>&nbsp;<?php echo $siteState['SiteState']['name']; ?>&nbsp;
    <?php
        //echo '<img src="data:image/png;base64,' . base64_encode( $siteState['SiteState']['img_data'] ) . '" />';
        echo '<img src="data:'.$siteState['SiteState']['img_type'].';base64,'.base64_encode( $siteState['SiteState']['img_data'] ) . '" />';
    ?>
    </P>
    
    
</div> <!-- /.span9 -->
</div> <!-- /.row -->

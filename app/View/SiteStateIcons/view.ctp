<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well"> <!-- was: well-large -->
    <ul>
        <li><?php echo $this->PoundcakeHTML->link('List Site State Icons', array('action' => 'index')); ?>
        <li><?php echo $this->PoundcakeHTML->link('Setup',array('controller'=>'admin','action' => 'setup')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Site State</h2>
    <P><B>Name:</B>&nbsp;<?php echo $siteStateIcon['SiteStateIcon']['name']; ?>&nbsp;
    <?php
        //echo '<img src="data:image/png;base64,' . base64_encode( $siteStateIcon['SiteStateIcon']['img_data'] ) . '" />';
        echo '<img src="data:'.$siteStateIcon['SiteStateIcon']['img_type'].';base64,'.base64_encode( $siteStateIcon['SiteStateIcon']['img_data'] ) . '" />';
    ?>
    </P>
    
    
</div> <!-- /.span9 -->
</div> <!-- /.row -->

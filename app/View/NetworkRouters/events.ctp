<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->PoundcakeHTML->linkIfAllowed('View Router', array('action'=>'view', $id ));?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <h2>View Events: <?php echo $name; ?> </h2>
    <?php echo $this->element( 'Common/events', $events ); ?>  
</div> <!-- /.span9 -->
</div> <!-- /.row -->
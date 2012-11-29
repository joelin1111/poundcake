<?php
    //echo $this->Html->script('jquery-1.7.2');
?>

<div class="row">
<div class="span3">
    <H3>Actions</H3>
    <div class="well well-large">
    <ul>
        <li><?php echo $this->Html->link('List Sites', array('action'=>'index')); ?></li>
    </ul>
    </div>
</div><!-- /.span3 .sb-fixed -->

<div class="span9">
    <div class="row">
        <h2>KML File Uplod</h2>            
        <div class="span4">
        <?php
            echo $this->Form->create('Site', array('type' => 'file'));
            echo $this->Form->file('File');
            echo $this->Form->end('Import');
        ?>
        </div>
        
    </div> <!-- ./row -->
 </div> <!-- ./span9 -->
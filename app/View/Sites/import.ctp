<?php
    // jQuery to enable/disable fields based on checkbox
    echo $this->Html->script('poundcake/poundcake-snmp-override');
    
    echo $this->Html->script('jasny/bootstrap-fileupload'); 
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
        <h2>KML Import</h2>        
        <div class="span9">
        <P>Select a Google Earth KML file with sites to import into the 
            <?php echo $this->Session->read('project_name') ?> project.
        </p>
        <p>
            You will have an opportunity to review the sites before the import is
            complete.
        </p>
        <p>Note that Google Earth KMZ (compressed KML) files will be quietly ignored.</p>
        <?php        
            echo $this->Form->create('Site', array('type' => 'file'));
        ?>
<!--            <div class="controls span9">
                <label class="checkbox">
                    <input type="checkbox" class="checkbox" name="overwrite" value="true">Overwrite sites with same name
                </label>
            </div>-->
        <BR><BR>
        
        
        <div class="fileupload fileupload-new" data-provides="fileupload">
  <div class="input-append">
    <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div>
    <span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name="data[Site][File]"/></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
  </div>
</div>
        <?php
            //echo $this->Form->file('File');
            //echo $this->Form->end('Import',array('class'=>'btn btn-primary'));
            echo $this->Form->submit('Import', array('div' => false,'class'=>'btn btn-primary'));
            echo $this->Form->end(); 
        ?>
        </div>
        
    </div> <!-- ./row -->
 </div> <!-- ./span9 -->
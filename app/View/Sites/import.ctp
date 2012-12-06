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
        <div class="span9">
        <P>Google Earth KML files only.  Google Earth KMZ (compressed KML) files will be quietly ignored.</p>
        <?php        
            echo $this->Form->create('Site', array('type' => 'file'));
            echo "<p>Sites will be imported into the project: ".$this->Session->read('project_name')."</p>";
            echo $this->Form->create('Site', array('type' => 'file'));
        ?>
            <div class="controls span9">
                <label class="checkbox">
                    <input type="checkbox" class="checkbox" name="overwrite" value="true">Overwrite sites with same name
                </label>
            </div>
        
        <?php
            echo $this->Form->file('File');
            echo $this->Form->end('Import');
        ?>
        </div>
        
    </div> <!-- ./row -->
 </div> <!-- ./span9 -->
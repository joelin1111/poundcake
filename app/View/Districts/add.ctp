
<div class="districts form">
<?php
        echo $this->Html->script('jquery');
        //echo $this->element('sql_dump');

?>
    <?php
        echo "<pre>";
        //print_r($this->Form);
        echo "</pre>";
    ?>
	<fieldset>
		<legend><?php echo __('Add District'); ?></legend>
	<?php
		echo $this->Form->input('catchment_id');
                echo $this->Form->input('area_id');
                echo $this->Form->input('name');
		?>
                
	</fieldset>
<?php echo $this->Form->end(__('Submit')); ?>
</div>
<div class="actions">
	<h3><?php echo __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Districts'), array('action' => 'index')); ?></li>
	</ul>
</div>
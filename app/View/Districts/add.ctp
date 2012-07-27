<?php
    echo $this->Html->script('jquery-1.7.2');
?>

<div class="districts form">
<?php
    echo $this->Form->create('District');
?>
	<fieldset>
		<legend><?php echo __('Add District'); ?></legend>
	<?php
		echo $this->Form->input('catchment_id');
                //echo $this->Form->input('area_id',array('empty' => 'Select One'));
                echo $this->Form->input('area_id');
                echo $this->Form->input('region_id');
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

<?php
    // include the Javascript which handles Ajax refresh of the
    // catchment/area/region select lists
    include 'district_form_js.php';
?>
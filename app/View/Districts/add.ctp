<?php
        
        // echo $this->element('sql_dump');
        // jquery is used to auto-refresh the Areas select box after a user
        // picks a District
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
                /*
                $options = array(
                    array(
                        'name' => '(Select District)',
                        'value' => '(Select District)',
                        'disabled' => true,
                        'label' => 'Pick Catchment',
                        'selected' => false
                        )
                );

                //echo $this->Form->select('area_id', $options);
                
                echo $this->Form->input(
                    'area_id',
                    array(
                        'options' => $options,
                        'type' => 'select',
                        'empty' => '-- Select a Catchment --',
                        'label' => 'Area'
                    )
                );
                */
                echo $this->Form->input('area_id');
                // echo $this->Form->input('area_id');
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
    // $this->Js->get('#catchment_id')->event('change', $this->Js->alert('hey you!'));

    // this creates the Javascript to refresh the Areas select box after a user
    // picks a District -- basically call getByCatchment on the Areas controller
    // which dynamically replaces just the HTML for $this->Form->select('area_id')
    // with the view code defined in Areas/get_by_catchment.ctp
    $this->Js->get('#DistrictCatchmentId');
    $this->Js->event('change',
        $this->Js->request(array(
        'controller' => 'areas',
                'action'=>'getByCatchment'),
                    array('async' => true,
                        'update' => '#DistrictAreaId',
                        'dataExpression' => true,
                        'data'=> $this->Js->serializeForm(
                                array(
                                    'isForm' => true,
                                    'inline'=> true
                                    )
                                ),
                        'method' => 'post'
                        )
                    )
    );
    echo $this->Js->writeBuffer(); // Write cached scripts

?>
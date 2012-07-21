<?php
        
        //echo $this->element('sql_dump');

?>
<div class="districts form">
<?php
    echo $this->Form->create('District');
?>
	<fieldset>
		<legend><?php echo __('Add District'); ?></legend>
	<?php
		echo $this->Form->input('catchment_id');
                
                $options = array(
                    array(
                        'name' => '(Select District)',
                        'value' => '(Select District)',
                        'disabled' => true,
                        'selected' => false
                    )
                    );
                echo $this->Form->select('area_id', $options);
                
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
    /*
    $this->Js->get('#catchment_id')->event('change',
            $this->Js->request(
                    array(
                        'controller'=>'areas',
                        'action' => 'getByCatchment'), 
                            array(
                                'async' => true,
                                'method' => 'post',
                                'update' => '#area_id',
                                'dataExpression' => true,
                                'data'=> $this->Js->serializeForm(
                                        array(
                                            'isForm' => true,
                                            'inline' => true
                                            ))
                            )
                    )
      );*/

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

    /*
        $this->Js->request(array(
		'controller'=>'areas',
		'action'=>'getByCategory'
		), array(
		'update'=>'#area_id',
		'async' => true,
		'method' => 'post',
		'dataExpression'=>true,
		'data'=> $this->Js->serializeForm(array(
			'isForm' => true,
			'inline' => true
			))
		))
	);
    */
    
    echo $this->Js->writeBuffer(); // Write cached scripts

?>
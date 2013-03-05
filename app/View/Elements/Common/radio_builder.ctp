<div class="row">
    <div class="span3">
        <?php
            // echo $this->Form->input('NetworkRadio.0.name',array('label' => 'Add New Radio'));
            echo $this->Form->input('NetworkRadio.name',array('label' => 'Add New Radio'));
        ?>
    </div>
    <div class="span3">
        <?php
        echo $this->Form->input(
                'NetworkRadio.radio_type_id',
                // 'NetworkRadio.0.radio_type_id',
                array(
                    'type' => 'select',
                    'label' => 'Radio Type',
                    'options' => $radiotypes,
                    'empty' => true,
                    'default'=>'0'
                    )
        );
        ?>
    </div>
    <div class="span3">
        <?php
        echo $this->Form->input(
                'NetworkRadio.antenna_type_id',
                // 'NetworkRadio.0.antenna_type_id',
                array(
                    'type' => 'select',
                    'label' => 'Antenna Type',
                    'options' => $antennatypes,
                    'empty' => true
                    )
        );
        ?>
    </div>

</div>
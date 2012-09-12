<H3>Legend</H3>
<?php
/*
    Active: Green 
    Planned: Light blue 
    Power Install Complete: Orange 
    HRBN Install Complete: Orange 
    Deactivated: Orange 
    Equipment Recovered: Orange 
    Decommissioned: Red

    Not used:  tower-p.png
    */
?>
<?php echo $this->Html->image('tower-g.png', array('alt' => 'Active')); ?>&nbsp;Active<BR>
<?php echo $this->Html->image('tower-b.png', array('alt' => 'Planned')); ?>&nbsp;Planned<BR>
<?php echo $this->Html->image('tower-y.png', array('alt' => 'Power Install Complete')); ?>&nbsp;Power Install Complete<BR>
<?php echo $this->Html->image('tower-y.png', array('alt' => 'HRBN Install Complete')); ?>&nbsp;HRBN Install Complete<BR>
<?php echo $this->Html->image('tower-y.png', array('alt' => 'Deactivated')); ?>&nbsp;Deactivated<BR>
<?php echo $this->Html->image('tower-y.png', array('alt' => 'Equipment Recovered')); ?>&nbsp;Equipment Recovered<BR>
<?php echo $this->Html->image('tower-r.png', array('alt' => 'Decommissioned')); ?>&nbsp;Decommissioned<BR>


<div class="maskAlt">
<div class="headerAlt">
<h1>Edit TC/TRC</h1>
</div>
<?php echo $this->Form->create('Trc'); ?>
    <?php
            echo $this->Form->input('id');
            echo $this->Form->input('name');
            //echo $this->Form->input('school_id',array('default' => $this->Form->value('Trc.id')));
    ?>
<?php echo $this->Form->end(__('Submit')); ?>

<h3><?php echo __('Actions'); ?></h3>
<ul>
        <li><?php echo $this->Form->postLink(__('Delete TC/TRC'), array('action' => 'delete',$this->Form->value('Trc.id')), null, __('Are you sure you want to delete # %s?', $this->Form->value('Trc.id'))); ?></li>
        <li><?php echo $this->Html->link(__('List TCs/TRCs'), array('action' => 'index')); ?></li>
</ul>
</div>
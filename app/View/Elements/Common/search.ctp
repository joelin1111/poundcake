<H3>Search</H3>
<?php
  echo $this->Form->create(
      'Site',
      array('action'=>'index','class' => 'well')
  );
  //echo $this->Form->input('site_code',array('escape' => true,'class' => 'span2'));
  echo $this->Form->input('site_code',array('escape' => false,'class' => 'span2'));
  echo $this->Form->input('site_name',array('class' => 'span2'));
  //echo $this->Form->input('site_state_id',array('class' => 'span2'));

  echo $this->Form->select('site_state_id', $sitestates, array(
    'multiple' => 'checkbox'
    ));
  
  /*
  echo $this->Form->input(
          'site_state_id',
          array('type'=>'select',
              'empty' => 'Any',
              'options' => $sitestates,
              'label' => '',
              'class' => 'span2'
              ));
  */
  
  ?>
<span class="help-block">Use * to wildcard</span>
<?php
    echo $this->Form->submit('Search', array('div' => false));
    echo $this->Form->end(); 
?>
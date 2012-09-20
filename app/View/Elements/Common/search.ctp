<H3>Search</H3>
<?php
  echo $this->Form->create(
      'Site',
      // calls the search function on the SitesController
      array('action'=>'search','class' => 'well')
  );
  echo $this->Form->input('site_code',array('escape' => true,'class' => 'span2'));
  echo $this->Form->input('site_name',array('class' => 'span2'));
  ?>
<span class="help-block">Use * as a wildcard</span>
<?php
    echo $this->Form->submit(__('Search', true), array('div' => false));
    echo $this->Form->end(); 
?>
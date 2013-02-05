<H3>Search</H3>
<div class="well well-large">
<fieldset id="sitestate_search">
<?php
  echo $this->Form->create(
      'Site',
      array(
          'action'=>'index',
          //'class' => 'well',          
          //'name' => 'sitesearch'
          )
  );
  //echo $this->Form->input('code',array('escape' => true,'class' => 'span2'));
  //echo '<div style="width:10px;">';
  echo $this->Form->input('code',array('escape' => false,'class' => 'search-query'));
  echo '<br>'; 
  echo $this->Form->input('name',array('class' => 'search-query'));
  echo '<br>';
 
  echo $this->Form->select(
          'site_state_id',
          $sitestates, array(
              'multiple' => 'checkbox'
            )
    );
?>
    
    <div align="center">
        <a rel="sitestate_search" href="#select_all">Check All</a> |  
        <a rel="sitestate_search" href="#select_none">Check None</a><br>
        <a rel="sitestate_search" href="#clear_all">Clear Search</a><BR><BR>
        <!--<span class="help-block">Search is greedy, case-insensitive, * to wildcard further</span>-->
        <?php
            echo $this->Form->submit('Search', array('div' => false,'class'=>'btn btn-primary'));
            echo $this->Form->end(); 
        ?>
    </div>
</div>  <!--/.well well-large -->

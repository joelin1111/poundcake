<!--<script type="text/javascript">
function checkAll(formname, checktoggle)
{
  var checkboxes = new Array(); 
  checkboxes = document[formname].getElementsByTagName('input');
 
  for (var i=0; i<checkboxes.length; i++)  {
    if (checkboxes[i].type == 'checkbox')   {
      checkboxes[i].checked = checktoggle;
    }
  }
}
</script>-->

<H3>Search</H3>
<fieldset id="sitestate_search">
<?php
  echo $this->Form->create(
      'Site',
      array(
          'action'=>'index',
          'class' => 'well',
          //'name' => 'sitesearch'
          )
  );
  //echo $this->Form->input('site_code',array('escape' => true,'class' => 'span2'));
  echo $this->Form->input('site_code',array('escape' => false,'class' => 'span2'));
  echo $this->Form->input('site_name',array('class' => 'span2'));
  //echo $this->Form->input('site_state_id',array('class' => 'span2'));
   
  //echo $this->Form->checkbox('check_all_none', array('class' => 'checkall','label'=>'Check All/None'));
 
  echo $this->Form->select(
          'site_state_id',
          $sitestates, array(
              'multiple' => 'checkbox',
              //'class' => 'mycheckbox'
            )
    );
  
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
    <div align="left">
        
<a rel="sitestate_search" href="#select_all">Select All</a><BR>
<a rel="sitestate_search" href="#select_none">Select None</a><BR>
<!--
<a rel="sitestate_search" href="#invert_selection">Invert Selection</a>
-->
    </div>
    


<span class="help-block">Use * to wildcard</span>

<?php
    echo $this->Form->submit('Search', array('div' => false));
    echo $this->Form->end(); 
?>

</fieldset>
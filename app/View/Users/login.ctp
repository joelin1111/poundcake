<BR>
<?php

    echo $this->Session->flash('auth');
    echo $this->Form->create('User',array('class' => 'form-horizontal'));
 /*
    //echo '<p>Please enter your username and password.</p>';
    echo '<p>'.$this->Form->input('username',array('class' => 'search-query', 'placeholder' => 'Username' )).'</p>';
    echo '<p>'.$this->Form->input('password',array('class' => 'search-query', 'placeholder' => 'Password' )).'</p>';
    //echo $this->Form->end('Login',array('class'=>'btn'));
    echo $this->Form->submit('Login', array('div' => false,'class'=>'btn'));
    echo $this->Form->end(); 
*/
?>

  <div class="control-group">
    <?php
        echo $this->Form->input('username',array('class' => 'search-query', 'placeholder' => 'Username' ));
        echo $this->Form->input('password',array('class' => 'search-query', 'placeholder' => 'Password' ))
    ?>
<!--  </div>
  <div class="controls">-->
      <?php
        echo $this->Form->submit('Login', array('div' => false,'class'=>'btn'));
        ?>
        <div align="center">
            Request access to Tower DB by emailing &#116;&#111;&#119;&#101;&#114;&#100;&#098;&#045;&#097;&#099;&#099;&#101;&#115;&#115;&#064;&#105;&#110;&#118;&#101;&#110;&#101;&#111;&#046;&#111;&#114;&#103;.
        </div>

    <?php
    echo $this->Form->end(); 
      ?>
  </div>
    

<div>
<P>
</p>
</div>
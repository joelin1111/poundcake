<ul class="nav pull-right">  
  <li>
  <div class="btn-group">
        <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i>
            <?php echo $user['username'];?></a>
        <!-- button height hack -- see PC-56 -->
        <a class="btn btn-primary dropdown-toggle" style="height:20px;" data-toggle="dropdown" href="#">
            <span class="caret"></span></a>
        <ul class="dropdown-menu">
<!--            <li><a href="#"><i class="icon-trash"></i> Delete</a></li>-->
<!--          <li>
              <i class="icon-pencil"></i>
              <?php
              // this didn't look right when used with the HTML helper
                //echo $this->Html->link('Change Password #1', array('controller' => 'users', 'action' => 'password', $user['id']));
              ?>
              
              the pencil icon:
            <i class="icon-pencil"></i>
            Also:
            class="icon-trash"
          </li>-->

          <?php
                $passwordURL = '/users/password/'.$user['id'];
          ?>
          <li><a href="<?php echo $passwordURL;?>">Change Password</a></li>
          <li><?php echo $this->Html->link('Switch Project', array('controller' => 'users', 'action' => 'project')); ?></li>
          <li><?php echo $this->Html->link('Logout', array('controller' => 'users', 'action' => 'logout')); ?></li>
        </ul>
        </div>
  </li>
</ul><!--/.nav .pull-right -->
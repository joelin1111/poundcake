<ul class="nav pull-right">  
  <li>
  <div class="btn-group">
        <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i>
            <?php echo $user['username'];?></a>
        <!-- button height hack -- see PC-56 -->
        <a class="btn btn-primary dropdown-toggle" style="height:18px;" data-toggle="dropdown" href="#"><span class="caret"></span></a>
        <ul class="dropdown-menu">
<!--            <li><a href="#"><i class="icon-trash"></i> Delete</a></li>-->
<!--          <li>
              <i class="icon-pencil"></i>
              <?php
              // this didn't look right when used with the HTML helper
                //echo $this->Html->link('Change Password #1', array('controller' => 'users', 'action' => 'password', $user['id']));
              ?>
              
          </li>-->

          <?php
                $passwordURL = '/users/password/'.$user['id'];
          ?>
          <li><a href="<?php echo $passwordURL;?>"><i class="icon-pencil"></i> Change Password</a></li>
<!--          <li><a href="#"><i class="icon-trash"></i> Delete</a></li>-->
<!--          <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
          <li class="divider"></li>
          <li><a href="#"><i class="i"></i> Login</a></li>-->
        </ul>
        </div>
  </li>
</ul><!--/.nav .pull-right -->
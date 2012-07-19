<?php
/**
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       Cake.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

$cakeDescription = __d('cake_dev', 'CakePHP: the rapid development php framework');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php echo $cakeDescription ?>:
		<?php echo $title_for_layout; ?>
	</title>
	<?php
		echo $this->Html->meta('icon');
		echo $this->Html->css('poundcake');
		echo $this->fetch('meta');
		echo $this->fetch('css');
		echo $this->fetch('script');
	?>
</head>
<body>
<div id="wrap">
		<div id="navigation">
                    <?php
                        // $user is set in AppController's beforeRender
                        //echo "<pre>".print_r($user)."</pre>";
                        
                        // may want to use:  $this->Session->read('User.id')));
                        // 
                        // if the user is logged in, show their name and role
                        // near the top
                        if ( isset($user) ) {
                            echo "<small>Logged in as: ".$user['username']."<br>";
                            echo "Role: ".$user['role']."</small><br><br><br>";
                            //echo $this->Html->link('Pages Home', array('controller' => 'pages', 'action' => 'index'));
                            echo $this->Html->link('About', array('controller' => 'schools', 'action' => 'about'));
                            echo $this->Html->link('Map v1', array('controller' => 'schools', 'action' => 'overview'));
                            echo $this->Html->link('Map v2', array('controller' => 'schools', 'action' => 'overviewalt'));
                            echo $this->Html->link('Schools', array('controller' => 'schools', 'action' => 'index'));
                            if ($user['role'] === 'admin'  ) {
                                echo $this->Html->link('Setup', array('controller' => 'users', 'action' => 'setup'));
                                }
                            echo $this->Html->link('Logout', array('controller' => 'users', 'action' => 'logout'));
                            
                        }
                        else {
                            // otherwise show a login box
                            echo $this->Html->link('Login', array('controller' => 'users', 'action' => 'login'));
                        }
                    ?>
		</div>
		<div id="content"><?php echo $content_for_layout; ?></div>
		<div id="footer">
                    Copyright © <?php echo date("Y"); ?>. All Rights Reserved.
                </div>
	</div>
        Debugging info:
	<?php //echo $this->element('sql_dump'); ?>
</body>
</html>

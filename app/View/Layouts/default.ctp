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

//$banner = 'Tower DB system upgrade Sept 24, 2012 at 1:00 PM (13:00) Pacific';

$cakeDescription = __d('poundcake', 'Tower DB');
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
            //echo $this->Html->script('jquery-1.7.2');
            echo $this->Html->meta('icon');
            echo $this->fetch('meta');
            echo $this->fetch('css');
            echo $this->fetch('script');
            
            echo $this->Html->css('poundcake'); // Our custom CSS file
            echo $this->Html->css('bootstrap'); // Bootstrap's CSS file

            //echo $this->Html->script('deprecated/jquery-1.7.2');
            echo $this->Html->script('jquery-1.8.3'); 
            //echo $this->Html->script('jquery-ui-1.8.21.custom.min'); 
            echo $this->Html->script('jquery-ui-1.9.2.custom.min');
            echo $this->Html->script('bootstrap'); // Bootstrap's JS file
            
            echo $this->Html->script('deprecated/bootstrap-dropdown'); // now in bootstrap.js?
            echo $this->Html->script('datepicker');
            echo $this->Html->script('poundcake');
        ?>
    
        <style type="text/css"> 
        /* bootstrap Google map fix
        See:  http://gis.yohman.com/up206b/tutorials/5-2/
        */
        #map_canvas img {
            max-width: none;
        }
        </style>
        <style>
          body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
          }

          @media (min-width: 768px) { 
            .sb-fixed{
                    position: fixed;
                    } 
                 }

            .box{
                min-height: 20px;
                padding: 19px;
                margin-bottom: 20px;
                background-color: whiteSmoke;
                border: 1px solid #EEE;
                border: 1px solid rgba(0, 0, 0, 0.05);
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
                -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
            }
        </style>
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</head>
<body>

<div class="navbar navbar-fixed-top"> 
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand" href="/sites/overview">Tower DB <?php echo $this->Session->read('version');?>&nbsp;&nbsp;</a>
                <ul class="nav">
                    <li class="active">
                        <?php echo $this->Html->link('Map', array('controller' => 'sites', 'action' => 'overview')); ?>
                    </li>
                    <li>
                        <?php echo $this->Html->link('Sites', array('controller' => 'sites', 'action' => 'index')); ?>
                    </li>
                    <li>
                        <?php echo $this->Html->link('Contacts', array('controller' => 'contacts', 'action' => 'index')); ?>
                    </li>
                    <li>
                        <?php echo $this->Html->link('Radios', array('controller' => 'networkRadios', 'action' => 'index')); ?>
                    </li>
                    <li>
                        <?php echo $this->Html->link('Routers', array('controller' => 'networkRouters', 'action' => 'index')); ?>
                    </li>
                    <li>
                        <?php echo $this->Html->link('Switches', array('controller' => 'networkSwitches', 'action' => 'index')); ?>
                    </li>
                    
                    <?php
                    // this doesn't really belong here, should probably serve up a different
                    // view for admins
                    if ($user['Role']['name'] === 'admin') {
                        echo "<LI>";
                        echo $this->Html->link('Setup', array('controller' => 'users', 'action' => 'setup'));
                        echo "</LI>";
                    }
                    ?>
                    
                </ul>
            <?php
                // if the user is logged in, show a button on the right side with
                // links to change their password, etc.
                if ( isset($user) ) {
                    include 'user.ctp';
                }
            ?>
            </div>
        </div>
    </div>
    </div> <!--/.navbar -->
    
    <div class="row" align="center">
        <?php //include 'breadcrumb.ctp'; ?>
    </div> <!--/.bread crumbs -->
    
    <div class="container">       
    <div align="center">
    <?php
        // show banner, if any -- this would be set in AppController::beforeFilter
        $banner = $this->Session->read('banner');
        if (isset($banner) && strlen($banner) > 0 ) {
            //echo '<div class="row">';
            //echo '<div class="span9" align="center">';
            echo '<div align="center">';
            echo '<span style="vertical-align:middle" class="label label-warning">';       
            echo  $banner;
            echo '</span></div><br>';
        }
    ?>
    </div>
            
        <?php echo $content_for_layout; ?>
        
        <div id="footer" align="center"><BR><BR><BR>
                        
        <div class="row" align="center">
            <?php include 'breadcrumb.ctp'; ?>
        </div> <!--/.bread crumbs -->
    
        <?php
            $project_name = $this->Session->read('project_name');
            echo "Current Project: ";
            echo $project_name != "" ? $project_name : "Unknown";
            echo " | ";
            echo $this->Html->link(('Switch Project'), array('action' => 'project', 'controller' => 'users', CakeSession::read("Auth.User.id")));
        ?><BR>
            <?
                $copyright = 'Copyright © 2012';
                $current_year = date("Y");
                if ($current_year > 2012)
                    $copyright = 'Copyright © 2012-'.$current_year;
                echo $copyright . ' All Rights Reserved.<BR>';
                echo $this->Html->link(('Version History'), array('action' => 'index', 'controller' => 'changeLog'));
            ?>

        
<!--        Debugging info:-->
    <?php //echo $this->element('sql_dump'); ?>

    <?php //echo $scripts_for_layout; ?>
    <!-- Js writeBuffer -->
    <?php
    //if (class_exists('JsHelper') && method_exists($this->Js, 'writeBuffer')) echo $this->Js->writeBuffer();
    // Writes cached scripts
    ?>
    
    
   <?php
       $host = gethostname();
        if ($host == 'Catapult-Clarks-MacBook.local') {
        ?>
        <BR>
        <div style="background-color: orange; border: 1px solid black; width: 100%; height:5em;">            
            <div style="height:3em;padding:1em 0 1em 0">
                Development version - (<?php echo $host ?>
            </div>
        </div>
    <?php
        }
    ?>
    </div> <!-- /footer -->
    </div> <!-- /.container -->
</body>
</html>
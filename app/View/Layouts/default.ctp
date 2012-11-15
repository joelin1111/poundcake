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

            echo $this->Html->script('jquery-1.7.2');
            echo $this->Html->script('bootstrap-dropdown');
            echo $this->Html->script('poundcake');
            /*
            <script src="js/bootstrap-transition.js"></script>
            <script src="js/bootstrap-alert.js"></script>
            <script src="js/bootstrap-modal.js"></script>
            <script src="js/bootstrap-dropdown.js"></script>
            <script src="js/bootstrap-scrollspy.js"></script>
            <script src="js/bootstrap-tab.js"></script>
            <script src="js/bootstrap-tooltip.js"></script>
            <script src="js/bootstrap-popover.js"></script>
            <script src="js/bootstrap-button.js"></script>
            <script src="js/bootstrap-collapse.js"></script>
            <script src="js/bootstrap-carousel.js"></script>
            <script src="js/bootstrap-typeahead.js"></script>
            */
	?>
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
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="/">Tower DB <?php echo $this->Session->read('version');?></a>
         <div class="nav-collapse">
            <ul class="nav pull-left">
            <?php
                // may want to use:  $this->Session->read('User.id')));
                // 
                // if the user is logged in, show their name and role
                // near the top
                if ( isset($user) ) {
                    //echo "<small>Logged in as: ".$user['username']."<br>";
                    //echo "Role: ".$user['Role']['name']."</small><br><br><br>";
                    echo "<LI>";
                    echo $this->Html->link('Map', array('controller' => 'sites', 'action' => 'overview'));
                    echo "</LI>";
                    
                    echo "<LI>";
                    echo $this->Html->link('Sites', array('controller' => 'sites', 'action' => 'index'));
                    echo "</LI>";
                    
                    echo "<LI>";
                    echo $this->Html->link('Contacts', array('controller' => 'contacts', 'action' => 'index'));
                    echo "</LI>";
                    
                    echo "<LI>";
                    echo $this->Html->link('Radios', array('controller' => 'networkRadios', 'action' => 'index'));
                    echo "</LI>";
                    
                    echo "<LI>";
                    echo $this->Html->link('Routers', array('controller' => 'networkRouters', 'action' => 'index'));
                    echo "</LI>";
                    
                    echo "<LI>";
                    echo $this->Html->link('Switches', array('controller' => 'networkSwitches', 'action' => 'index'));
                    echo "</LI>";
                    
                    // this doesn't really belong here, should probably serve up a different
                    // view for admins
                    if ($user['Role']['name'] === 'admin') {
                        echo "<LI>";
                        echo $this->Html->link('Setup', array('controller' => 'users', 'action' => 'setup'));
                        echo "</LI>";
                    }
                }
            ?>
            </ul><!--/.nav .pull-left -->
            
            <?php
            // if the user is logged in, show a button on the right side with
            // links to change their password, etc.
            if ( isset($user) ) {
                include 'user.ctp';
            }
            ?>
          </div><!--/.nav-collapse  -->          
        </div>
      </div>
    
        
    </div> <!--/.navbar -->
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
    <div class="container">
        <div align="center">
        <!-- <a href="javascript:window.history.back()">Back</a> -->
        <?php
            /*
            $startText = array(
                'text' => 'Overview',
                'url' => '/sites/overview'
            );
            echo $this->Html->getCrumbs(' » ',$startText);
            */
            
            // $breadcrumbs = $this->Session->read('breadcrumbs');
            $breadcrumbs = CakeSession::read('breadcrumbs');
            if (!isset($breadcrumbs)) {
                $breadcrumbs = array();
            }
//            echo '<pre>';
//            print_r($breadcrumbs);
//            echo '</pre>';
            $controller = $this->name;
            $view = $this->action;
            $label = $controller.'/'.$view;
            $url = $controller.'/'.$view;
            $link = '';
            
            $params = '';
            if (sizeof($this->params['pass']) > 0)
                $params = $this->params['pass'][0];
            /*
            $length = sizeof($this->params['pass']) - 1;
            $u = 0;
            foreach ($this->params['pass'] as $param) {
                //echo "Param " . $param ."<BR>";
                $url .= '/'.$param;
                if ($u <  $length ) 
                    $url .= '/';
                $u++;
            }
            */
            
//            echo '<pre>';
//            echo $label;
//            echo $url;
//            echo '</pre>';
            
            $link = $this->Html->link(
                $label,
                array(
                    'controller' => $controller,
                    'action' => $view,
                    $params
                ));
                    
//            echo '<pre>';
//            //print_r($this->params['pass']);
//            echo "LABEL:  ".$label.'<br>';
//            echo "URL:  ".$url.'<br>';
//            //echo $length;
//            echo '</pre>';
            
            //echo $link;
            array_unshift($breadcrumbs, $link);
            echo "History: ";
            $i = 0;
            $max = 7;
            $breadcrumbs = array_slice($breadcrumbs, 0, $max);           
            foreach ($breadcrumbs as $bc ) {
                //echo '<LI>'.$bc.'</LI>';
                echo $bc;
                if ($i < $max -1 ) 
                    echo " &raquo; ";
                $i++;
            }
            echo "<HR>";
            CakeSession::write('breadcrumbs', $breadcrumbs);            
        ?>
        </div>
        <BR>
        <?php echo $content_for_layout; ?>
        <div id="footer" align="center"><BR><BR><BR>
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

        </div> <!-- /footer -->
<!--        Debugging info:-->
    <?php //echo $this->element('sql_dump'); ?>

    <?php //echo $scripts_for_layout; ?>
    <!-- Js writeBuffer -->
    <?php
    //if (class_exists('JsHelper') && method_exists($this->Js, 'writeBuffer')) echo $this->Js->writeBuffer();
    // Writes cached scripts
    ?>
    </div> <!-- /.container --> 
</body>
</html>
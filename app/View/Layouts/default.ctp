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
            // jQuery                
            echo $this->Html->script('jquery-1.9.0.min');
            echo $this->Html->script('jquery-ui/jquery-ui-1.10.0.custom.min');
            echo $this->Html->script('bootstrap.min'); // Bootstrap's jQuery file
            echo $this->Html->script('poundcake/poundcake'); // Our custom jQuery file
            echo $this->Html->script('bootbox.min'); // Bootbox jQuery -- for the dialogs
            echo $this->Html->script('jquery.form'); // Testing this out, see http://www.malsup.com/jquery/form/#download
            
            echo $this->Html->meta('icon');
            echo $this->fetch('meta');
            echo $this->fetch('css');
            echo $this->fetch('script');            
            
            // CSS
            echo $this->Html->css('bootstrap'); // Bootstrap's CSS file
            echo $this->Html->css('poundcake'); // Our custom CSS file
            echo $this->Html->css('jasny-bootstrap');  // Jasny is used for the File upload widget
            
            // LESS 
            // @see http://mindthecode.com/using-less-in-cakephp/
            // @see https://github.com/leafo/lessphp
            echo $this->Less->css('variables');
            echo $this->Less->css('bootswatch');
        ?>
    
        <style type="text/css"> 
        /* bootstrap Google map fix
        See:  http://gis.yohman.com/up206b/tutorials/5-2/
        */
        #map_canvas img {
            max-width: none;
        }
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
    
<?
define('MAINTENANCE', 1); 
if( MAINTENANCE > 0 && $_SERVER['REMOTE_ADDR'] != '24.20.20.146' ) {
    include( 'maintenance.ctp');
    die(); 
}
?>
    
<div class="navbar navbar-fixed-top"> <!-- was: navbar-fixed-top -->    
        <div class="navbar-inner">
            <div class="container">
                <a class="brand" href="/sites/overview">Tower DB <?php echo $this->Session->read('version');?>&nbsp;&nbsp;</a>
                <div class="main-navigation">
                    <ul class="nav">
                    <?php
                        if ( isset($user) ) {
                            include 'navigation.ctp';
                        }
                    ?>
                    </ul>
                </div>
            <?php
                // if the user is logged in, show a button on the right side with
                // links to change their password, etc.
                if ( isset($user) ) {
                    include 'user.ctp';
                }
            ?>
            </div>
        </div>
    </div> <!--/.navbar -->
    
    <!-- show banner, if any -- this would be set in AppController::beforeRender -->
    <div class="container">
    <div class="row">
    <?php
        
        $banner = $this->Session->read('banner');
        if ( strlen($banner) > 0 ) {
            echo '<div class="alert" align="center">'.$banner.'</div>';
        }
           
        $flashClass = "alert-spacer";
        $flashMessage = "";
        if( $this->Session->check('Message.flash') ) {
            $flashMessage = $this->Session->flash();
            $flashClass = "alert-success";
            if (strlen(strstr($flashMessage,'Error')) > 0) {
                $flashClass = "alert-error";
            } else if (strlen(strstr($flashMessage,'Info'))>0) {
                $flashClass = "alert-info";
            }
        }
        
        if ( strlen($flashMessage) > 0 ) {
            echo '<div align="center" id="flash" class="alert '.$flashClass.'">';
            echo $flashMessage;
            echo '</div>';
        }

    ?>
        </div>
        <?php echo $content_for_layout; ?>
        
        <div id="footer" align="center"><BR><BR>
                        
        <div class="row" align="center">
            <?php include 'breadcrumb.ctp'; ?>
        </div> <!--/.bread crumbs -->
    
        <?php
            $project_name = $this->Session->read('project_name');
            
            // only show this stuff if the user is logged in
            if ( !(is_null($project_name))) {
                echo "Current Project: ";
                echo $project_name != "" ? $project_name : "Unknown";
                echo " | ";
                echo $this->Html->link(('Switch Project'), array('action' => 'project', 'controller' => 'users', CakeSession::read("Auth.User.id")));
            }
            echo '<br><small>Current Role: '.$this->Session->read('role');
           
            $copyright = 'Copyright © 2012';
            $current_year = date("Y");
            if ($current_year > 2012)
                $copyright = '<BR>Copyright © 2012-'.$current_year;
            echo $copyright . ' All Rights Reserved.<BR>';
            
            // again, only show if logged in
            if ( !(is_null($project_name))) {
                echo $this->Html->link(('Version History'), array('action' => 'index', 'controller' => 'changeLog'));
            }
            echo '</small>';
            
        ?>
            
    <?php //echo $this->element('sql_dump'); ?>
    </div> <!-- /footer -->
    </div> <!-- /.container -->
</body>
</html>
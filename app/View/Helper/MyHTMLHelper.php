<?php
class MyHTMLHelper extends AppHelper {
  var $helpers = array('Html');
  
  function linkIfAllowed($title, $url) {
      $role = $_SESSION['Auth']['User']['Role']['rolealias'];
      //echo "Role : " .$role;
      //echo "Quiet : " .$quiet;
      
      
      if (($role === 'edit') || ($role === 'admin') ) {
        //$link = $this->Html->link($title, $url, array('class' => 'edit'));
        //return $this->output("<div class=\"editOuter\">$link</div>");
        //$link = $this->Html->link($title, $url, array('class' => 'edit'));
        return $this->Html->link($title, $url);
      } else {
          return $title;
      }
  }
}
?>

<?php
class MyHTMLHelper extends AppHelper {
    var $helpers = array('Html','Form');

    function linkIfAllowed($title, $url) {
        $role = $this->getRoleAlias();
        if (($role === 'edit') || ($role === 'admin') ) {
          return $this->Html->link($title, $url);
        } else {
            return $title;
        }
    }
    
    function linkIfAdmin($title, $url) {
        $role = $this->getRoleAlias();
        if ($role === 'admin') {
          return $this->Html->link($title, $url);
        } else {
            return $title;
        }
    }

    // this should probably be in MyFormHelper ;-)
    function postLinkIfAllowed($title, $url = null, $options = array(), $confirmMessage = false) {
        $role = $this->getRoleAlias();
        if (($role === 'edit') || ($role === 'admin') ) {
            return $this->Form->postLink($title,$url,$options,$confirmMessage);
        } else {
            return $title;
        }
    }
    
    
    function postLinkAltMessage($title, $url = null, $options = array(), $confirmMessage = false, $alternateString) {
        $role = $this->getRoleAlias();
        if (($role === 'edit') || ($role === 'admin') ) {
            return $this->Form->postLink($title,$url,$options,$confirmMessage);
        } else {
            return $title;
        }
    }
    
    private function getRoleAlias() {
        return $_SESSION['Auth']['User']['Role']['rolealias'];
    }
}


?>

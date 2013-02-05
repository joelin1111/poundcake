<?php
/**
 * Simple helper class that leverages Poundcake's security scheme to show or not show
 * links, as appropriate.  Method calls/signatures should be equivalent to
 * CakePHP's native HtmlHelper.
 * 
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.View.Helper
 * @since         PoundcakeHTMLHelper precedes Poundcake v2.2.1
 * @license       XYZ License
 */

class PoundcakeHTMLHelper extends AppHelper {
    
    /*
     * Other helpers this helper relies on
     */
    var $helpers = array('Html','Form'); // maybe we should have extendedHtmlHelper versus just using it?
    
    /*
     * Returns hyperlink if permissions permit.
     */
    function linkIfAllowed($title, $url) {
        //debug( $url );
        $role = $this->getRoleAlias();
        if (($role === 'edit') || ($role === 'admin') ) {
          return $this->Html->link($title, $url);
        } else {
            return $title;
        }
    }
    
    /*
     * Returns hyperlink if administrator
     */
    function linkIfAdmin($title, $url) {
        $role = $this->getRoleAlias();
        if ($role === 'admin') {
          return $this->Html->link($title, $url);
        } else {
            return $title;
        }
    }

   /*
    * Returns postLink if permissions permit
    */
    function postLinkIfAllowed($title, $url = null, $options = array(), $confirmMessage = false) {
         // this should probably be in PoundcakeFormHelper ;-)
        $role = $this->getRoleAlias();
        if (($role === 'edit') || ($role === 'admin') ) {
            return $this->Form->postLink($title,$url,$options,$confirmMessage);
        } else {
            return $title;
        }
    }
    
   /*
    * Returns postLink if administrator
    */
    function postLinkIfAdmin($title, $url = null, $options = array(), $confirmMessage = false) {
        $role = $this->getRoleAlias();
        if ( $role === 'admin') {
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
    
    /*
     * Return the user's role
     */
    private function getRoleAlias() {
        return $_SESSION['Auth']['User']['Role']['rolealias'];
    }
}


?>

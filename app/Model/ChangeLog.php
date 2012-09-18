<?php
App::uses('AppModel', 'Model');

class ChangeLog extends AppModel {
    
    public $displayField = 'name';
    
    var $order = "ChangeLog.release_date DESC";

}

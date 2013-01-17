<?php
/**
 * Model for site.
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
 * @package       app.Model
 * @since         Site precedes Poundcake v2.2.1
 * @license       XYZ License
 */

class Site extends AppModel {
        
    /*
     * Display field for select lists
     */
    public $displayField = 'site_vf';
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'Zone',
        'SiteState',
        'Organization',
        'PowerType',
        'NetworkSwitch',
        'NetworkRouter',
        'EquipmentSpace',
        'TowerMember',
        'TowerType',
        'TowerMount',
        'InstallTeam',
        'Project'
    );
   
    /*
     * Relations
     */
    public $hasMany = array(
        'NetworkRadios' => array(
            'className' => 'NetworkRadio',
            'foreignKey' => 'site_id',
            'order' => 'switch_port'
        )
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
        )
        ,
        'lat' => array(
//            RegEx for GPS field:
//            -? allows for, but does not require, a negative sign
//            \d{1,2} requires 1 or 2 decimal digits
//            \. requires a decimal point
//            \d{5} requires exactly 5 decimal digits
//            , matches a single comma
//            (repeat the first 5 bullets)
//            $ anchors at the end of input
            'rule' => '/^-?\d{1,3}\.\d{1,14}$/',
            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
        ),
        'lon' => array(
            // same as above
            'rule' => '/^-?\d{1,3}\.\d{1,14}$/',
            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
            )
        
    );
    
    /*
     * Use CakePHP virtual fields to combine code and name
     * Note: this virtualField is also defined in the sp_nearby stored procedure
     * - that version is used to place placemarkers for nearby sites on the site
     * view page map
     */
    var $virtualFields = array('site_vf' => 'CONCAT(code, " ", Site.name)');
    
    /*
     * Default sort order
     */
    var $order = 'Site.code ASC';

    /*
     * Constructor - Note: cannot remember why we defined a constructor here
     */
    public function __construct($id = false,$table = null,$ids = null) {
        parent::__construct($id,$table,$ids);
    }
    
    /*
     * Rreturns true if a site is owned by a user (was created by)
     */
    public function isOwnedBy($site, $user) {
        return $this->field('id', array('id' => $site, 'user_id' => $user)) === $site;
    }
    
    /*
     * Returns the declination for a given lat/lon pair using NOAA web service
     */
    function getDeclination($lat, $lon) {
        $dec = null;
        if (isset($lat) && isset($lon)) {
            // since Jan 2013 they appear to want the month now as part of the URL
            // so just get the current month number
            $month = date('m');
            $url='http://www.ngdc.noaa.gov/geomag-web/calculators/calculateDeclination?lat1='.$lat.'&startMonth='.$month.'&lon1='.$lon.'&resultFormat=csv';
            $x = file_get_contents($url);
            $y = str_getcsv($x);            
            // count should be > 1 unless the web service is down or some other network error
            if (count($y) > 1) {
                $dec = $y[3];
            } else {
                $dec = 0;
            }
        }
        
        return $dec;
    }    
}
?>
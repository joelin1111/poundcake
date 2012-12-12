<?php
/**
 * Model for NetworkRadio.
 * 
 * This Model could have been called just Radio, but for consistency with
 * NetworkSwitch and NetworkRouter, it is NetworkRadio.
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
 * @since         NetworkRadio precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model','CakeSession');

class NetworkRadio extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'Site',
        'RadioType',
        'NetworkSwitch',
        'AntennaType',
        'RadioMode',
    );
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                'allowEmpty' => false,
                'required' => true,
                //'last' => false, // Stop validation after this rule
                'on' => 'create', // Limit validation to 'create' or 'update' operations
            ),
            'isUnique' => array(
                'rule' => array('isUnique', array('name')),
                'message' => 'This field need must be unique.'
            ),
            /*
            'format' => array(
                'rule' => '/^[a-z0-9]{1,}\-[a-z0-9]{1,}$/i',
                'message' => 'Wrong format, should be: [Letters, Numbers]-[Letters, Numbers]'
            ),*/
        ),
    );
    
    /*
     * Returns the link ditance (in kilometers) between two NetworkRadios
     */
    function getLinkDistance($id, $link_id) {
        // uses Haversine formula
        // http://sgowtham.net/blog/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
        
        $distance = 0;
        
        $radio1 = $this->findById($id);
        $radio2 = $this->findById($link_id);
        
        if (is_array($radio2)) {
            $lat1 = $radio1['Site']['lat'];
            $lon1 = $radio1['Site']['lon'];
            $lat2 = $radio2['Site']['lat'];
            $lon2 = $radio2['Site']['lon'];
            // we do the hard work in the superclass
            $distance = parent::getDistance($lat1, $lon1, $lat2, $lon2);
        }
        
        return $distance;
    }
    
    /*
     * Return the bearing (in degrees) between two NetworkRadios
     */
    function getRadioBearing($id, $link_id) {
        $radio1 = $this->findById($id);
        $radio2 = $this->findById($link_id);
        
        $b = 0.000;
        if (is_array($radio2)) {
            $lat1 = $radio1['Site']['lat'];
            $lon1 = $radio1['Site']['lon'];
            $lat2 = $radio2['Site']['lat'];
            $lon2 = $radio2['Site']['lon'];

            $b = parent::getBearing($lat1, $lon1, $lat2, $lon2);
            /*
            // http://mathforum.org/library/drmath/view/60398.html
            // http://mathforum.org/library/drmath/view/55417.html
            // The algorithm it gives for bearing (or course) between two points is this:
            // tc1=mod(atan2(sin(lon2-lon1)*cos(lat2),cos(lat1)*sin(lat2)-sin(lat1)*cos(lat2)*cos(lon2-lon1)),2*pi)
            // The formula gives the initial heading for a great-circle route from point A to point B. The heading will change in the course of the trip. The quantities in the formula have these meanings:
            // lon1 = longitude of point A
            // lat1 = latitude of point A
            // lon2 = longitude of point B
            // lat2 = latitude of point B
            // tc1 = direction of point B from point A (angle east of north)
            // $pi = 3.141596;
            // The magnetic poles drift over years. The current location of the magnetic north pole is somewhere around 78.3 deg N, 104.0 deg W. Use 
            // these coordinates for point B and your own location for point A when using the formula on the page above.

            $b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1)) % (2*pi());
            http://www.ig.utexas.edu/outreach/googleearth/latlong.html
            $b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1));
            $b = rad2deg($b);
            $b = $b * (180/pi());
            $b = ($b + 360) % 360;
            if ($b < 0) {
               $b += 360;
            }
            */
        }
        return $b;
    }
}

<?php
App::uses('AppModel', 'Model');

class NetworkRadio extends AppModel {

    public $displayField = 'name';

    var $belongsTo = array(
        'Site',
        'RadioType',
        'NetworkSwitch',
        'AntennaType',
        'RadioMode',
        //'NetworkLink'
        //'NetworkLink' => array('foreignKey' => 'zipcode')

    );
    
    /*
    var $virtualFields = array(
        'target' => "NetworkLink.radio_dest_id"
    );    
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
                'message' => 'This field need must be unique!'
            ),
            'format' => array(
                'rule' => '/^[a-z0-9]{1,}\-[a-z0-9]{1,}$/i',
                'message' => 'Wrong format, should be: [Letters, Numbers]-[Letters, Numbers]'
            ),
        ),
    );
    
    /*
    function getLinkLatLon($link_id) {
        $this->loadModel('Site');
        $radio = $this->findById($link_id);
        return array (
            $radio['Site']['lat'],
            $radio['Site']['lon']
        );
    }
    */
    
    // return the distance between two radios
    function getLinkDistance($id, $link_id) {
        // uses Haversine formula
        // http://sgowtham.net/blog/2009/08/04/php-calculating-distance-between-two-locations-given-their-gps-coordinates/
        
        $distance = "";
        $earth_radius = 3960.00; # in miles
        
        $radio1 = $this->findById($id);
        $radio2 = $this->findById($link_id);
        
        if (is_array($radio2)) {
//        $radio1 = $this->NetworkRadio->findById($id);
//        $radio2 = $this->NetworkRadio->findById($link_id);

            $lat1 = $radio1['Site']['lat'];
            $lon1 = $radio1['Site']['lon'];
            $lat2 = $radio2['Site']['lat'];
            $lon2 = $radio2['Site']['lon'];

            //global $earth_radius;
            $delta_lat = $lat2 - $lat1;
            $delta_lon = $lon2 - $lon1;

            $alpha  = $delta_lat/2;
            $beta = $delta_lon/2;
            $a = sin(deg2rad($alpha)) * sin(deg2rad($alpha)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin(deg2rad($beta)) * sin(deg2rad($beta)) ;
            $c = asin(min(1, sqrt($a)));
            $distance = 2*$earth_radius * $c;
            $distance = round($distance, 4);

            // return the distance as kilometers
            $distance = $distance * 1.60934;
        }
        
        return $distance;
    }
    
    function getBearing($id, $link_id) {
        $radio1 = $this->findById($id);
        $radio2 = $this->findById($link_id);
        
        $b = 0.000;
        if (is_array($radio2)) {
            $lat1 = deg2rad($radio1['Site']['lat']);
            $lon1 = deg2rad($radio1['Site']['lon']);
            $lat2 = deg2rad($radio2['Site']['lat']);
            $lon2 = deg2rad($radio2['Site']['lon']);

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

            //$b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1)) % (2*pi());
            // http://www.ig.utexas.edu/outreach/googleearth/latlong.html
            $b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1));
            $b = rad2deg($b);
            //$b = $b * (180/pi());
            //$b = ($b + 360) % 360;
            if ($b < 0) {
                $b += 360;
            }
        }
        //echo "B is $b";
        return $b;
    }
}

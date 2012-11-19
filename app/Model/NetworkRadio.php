<?php
App::uses('AppModel', 'Model','CakeSession');

class NetworkRadio extends AppModel {

    public $displayField = 'name';
    
    var $belongsTo = array(
        'Site',
        'RadioType',
        'NetworkSwitch',
        'AntennaType',
        'RadioMode',
    );
    
    // public $actAs = array('Containable');
    
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
            /*
            'format' => array(
                'rule' => '/^[a-z0-9]{1,}\-[a-z0-9]{1,}$/i',
                'message' => 'Wrong format, should be: [Letters, Numbers]-[Letters, Numbers]'
            ),*/
        ),
    );
    
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
            
            $distance = parent::getDistance($lat1, $lon1, $lat2, $lon2);
        }
        
        return $distance;
    }
    
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
//            $b  = atan2(sin($lon2-$lon1)*cos($lat2),cos($lat1)*sin($lat2)-sin($lat1)*cos($lat2)*cos($lon2-$lon1));
//            $b = rad2deg($b);
            //$b = $b * (180/pi());
            //$b = ($b + 360) % 360;
//            if ($b < 0) {
//                $b += 360;
//            }
        }
        //echo "B is $b";
        return $b;
    }
    /*
    function afterFind($results){
        echo '<pre>';
        print_r($results);
        echo '</pre>';
        die;
    }
    */
    /*
    public function beforeFind($queryData) {
        //$uid = CakeSession::read("Auth.User.id");
        $project_id = 3;
        
        // http://stackoverflow.com/questions/2727217/cakephp-beforefind-how-do-i-add-a-join-condition-after-the-belongsto-associa
        // The join can not reference anything in the associations, as the associations
        // are fetched via separate queries. If you need to add a join that references
        // an association, you will need to add the association manually in the join as well.
        
        $options['joins'] = array(
            array('table' => 'sites',
                //'alias' => 'Site2',
                'type' => 'LEFT',
                'conditions' => array(
                    'site.project_id =  '.$project_id,
                )
            )/*,
            array('table' => 'projects_users',
                'alias' => 'ProjectsUser',
                'type' => 'INNER',
                'conditions' => array(
                    //"Site.project_id  =  Project.id",
                    'ProjectsUser.user_id =  '.$uid,
                    'ProjectsUser.project_id = Project2.id'
                )
            )
        );
        $queryData['joins'] = $options['joins'];
        
//        $results = $this->Project->find('all', $options);
//        echo '<pre>';
//        print_r($queryData);
//        echo '</pre>';
//        die;
        return $queryData;
    }
    */
    
//    public function afterFind($results, $primary = false) {
//        echo '<pre>';
//        print_r($results);
//        echo '</pre>';
//    }
}

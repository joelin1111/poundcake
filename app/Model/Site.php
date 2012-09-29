<?php
class Site extends AppModel {
    
    // A site belongs to a Zone, etc.
    // this is a one-way relationship, e.g. at the moment you cannot get all
    // sites for a region, would need to define the relationship the other
    // way to do that
    var $belongsTo = array(
        'Zone',
        'SiteState',
        'TowerOwner',
        'PowerType',
        'NetworkSwitch',
        'NetworkRouter',
        'EquipmentSpace',
        'TowerMember',
        'TowerEquipment',
        'TowerMount',
        'InstallTeam',
        'Project'
    );
    
   //var $uses = array('User');
    
    public $hasMany = array(
        'NetworkRadios' => array(
            'className' => 'NetworkRadio',
            'foreignKey' => 'site_id',
            'dependent' => false,
            'conditions' => '',
            'fields' => '',
            'order' => '',
            'limit' => '',
            'offset' => '',
            'exclusive' => '',
            'finderQuery' => '',
            'counterQuery' => ''
        )
    );
    
    
    public $validate = array(
        'site_name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
        )
//        ,
//        'lat' => array(
//            /* RegEx for GPS field:
//            -? allows for, but does not require, a negative sign
//            \d{1,2} requires 1 or 2 decimal digits
//            \. requires a decimal point
//            \d{5} requires exactly 5 decimal digits
//            , matches a single comma
//            (repeat the first 5 bullets)
//            $ anchors at the end of input
//             */
//            'rule' => '/^-?\d{1,2}\.\d{1,14}$/',
//            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
//        ),
//        'lon' => array(
//            // same as above
//            'rule' => '/^-?\d{1,2}\.\d{1,14}$/',
//            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
//            )
    );
    
    var $actsAs = array('Containable'); 
    
    // we'll eventually save the site's latitude/longitude here -- but only
    // after decoding it from the spatial data type in the db
    //var $lat = 0;
    //var $lon = 0;
    
    // this virtualField is also defined in the sp_nearby stored procedure - that version
    // is used to place placemarkers for nearby sites on the site view page map
    var $virtualFields = array('site_vf' => 'CONCAT(site_code, " ", site_name)');
    
    // The displayField attribute specifies which database field should be used as a
    // label for the record. The label is used in scaffolding and in find('list') calls.
    // The model will use name or title, by default.
    public $displayField = 'site_vf';
    
    public function __construct($id = false,$table = null,$ids = null) {
        parent::__construct($id,$table,$ids);
    }
    
    // return true if a site is owned by a user (was created by)
    public function isOwnedBy($site, $user) {
        return $this->field('id', array('id' => $site, 'user_id' => $user)) === $site;
    }
    /*
    public function beforeFind($queryData) {
        //print_r($this->data['Site']['projects']);
        $uid = CakeSession::read("Auth.User.id");
        echo "User ID ". $uid.'<br>';
        $options = array( 
            'conditions' => array('User.id' => $uid), 
            'contain' => array( 
                    'Site' => array('fields' => array('id', 'title')) 
            ) 
        ); 
        $results = $this->Project->find('all', $options); 
        print_r($results);
        debug($query);
        die;
        
        $more_conditions = array(
            'AND' => array(
                'Site.project_id =' => 'Project.id',
                'Project.id =' => '10',
            )
        );
        
        die;
        // there is probably a more graceful way to do this, but with Sites we pretty
        // mcuh always have an AND condition coming in
        $conditions = $queryData['conditions'];
        $more_conditions = 
            array(
                'Site.project_id =' => array('1')
        );
        /*
        $more_conditions = array(
            'OR' => array(
                'Site.id >' => '0',
                'Site.id <' => '10',
            )
        );
        
        $conditions['AND'] = array_merge($conditions['AND'], $more_conditions);
        $queryData['conditions'] = $conditions;
        echo '<pre>';
        print_r($conditions);
        print_r($queryData['conditions']);
        echo '</pre>';
        die;
        return $queryData;
    }
    */
 
    function getUsersProjects() {
        $uid = CakeSession::read("Auth.User.id");
        $this->User = ClassRegistry::init('User');
        $this->User->id = $uid;
        $userData = $this->User->read();
        //$projects = $this->User->Project->find('all');
        
//        $conditions = array(
//            'AND' => array(
//                'User.id =' => 'Project.id'
//                'Site.site_name LIKE' => $site_name_arg,
//            )
//        );
//        
        //////$user = $this->User->read($this->Auth->user('id'));
        // get all the projects this user is allowed to access
        //$projects = $this->User->Project->find('all');
        //$projects = $this->User->Project->findAll(); //'list',array('fields'=>array('id')));
        
        //echo '<pre>';
        //print_r($userData);
        //print_r($projects);
        //echo '</pre>';
        return $userData['Project'];
    }
    
    function afterFind($results, $primary = false) {
        // make a nice tidy 
        $projects = $this->getUsersProjects();
        if (count($projects) > 0) {
            $project_ids = array();
            foreach($projects as $key => $value) {
                //echo "Key: ".$key."<BR>";
                //echo "Value: ".print_r($value)."<BR>";
                array_push($project_ids,$value['id']);
            }

            //$project_id = 3;
            //$project_id = array(3,4);
            //print_r($project_ids); die;
            //$n = 1;
            if ($primary) {
                //echo '<pre>';
                foreach($results as $key => $value) {
                    //echo "Key: ".$key."<BR>";
                    echo "Value: ".print_r($value)."<BR>";
                    //echo print_r($value['Site']['project_id'])."<BR>";
                    //echo $value['Site']['project_id']."<BR>";

                    if (!(in_array($value['Site']['project_id'], $project_ids))) {
                        //print_r($value['Site']);
                        unset($results[$key]);
                        //echo "site_code: ".$value['Site']['site_code']."<BR>";
                        //echo "project_id: ".$value['Site']['project_id']."<BR>";
                        //$n++;
                    }
                }
                //echo '</pre>';
            }
        }
        //die;
        return $results;
    }
}
?>
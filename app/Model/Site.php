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
        'TowerType',
        'TowerMount',
        'InstallTeam',
        'Project'
    );
   
   //public $actsAs = array('Containable');
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
        ,
        'lat' => array(
            /* RegEx for GPS field:
            -? allows for, but does not require, a negative sign
            \d{1,2} requires 1 or 2 decimal digits
            \. requires a decimal point
            \d{5} requires exactly 5 decimal digits
            , matches a single comma
            (repeat the first 5 bullets)
            $ anchors at the end of input
             */
            'rule' => '/^-?\d{1,2}\.\d{1,14}$/',
            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
        ),
        'lon' => array(
            // same as above
            'rule' => '/^-?\d{1,2}\.\d{1,14}$/',
            'message' => 'Expecting XX.XXXXX or -XX.XXXXX'
            )
    );
    
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
    
    public function beforeFind($queryData) {
        $uid = CakeSession::read("Auth.User.id");
        
        // http://stackoverflow.com/questions/2727217/cakephp-beforefind-how-do-i-add-a-join-condition-after-the-belongsto-associa
        // The join can not reference anything in the associations, as the associations
        // are fetched via separate queries. If you need to add a join that references
        // an association, you will need to add the association manually in the join as well.
        
        $options['joins'] = array(
            array('table' => 'projects',
                'alias' => 'Project2',
                'type' => 'LEFT',
                'conditions' => array(
                    'Project2.id = Site.project_id'
                )
            ),
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
}
?>
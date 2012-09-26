<?php
class Site extends AppModel {
    
    // A site belongs to a Zone, etc.
    // this is a one-way relationship, e.g. at the moment you cannot get all
    // sites for a region, would need to define the relationship the other
    // way to do that
    var $belongsTo = array(
        'Zone',
        //'ConnectivityType',
        'SiteState',
        'TowerOwner',
        'PowerType',
        'NetworkSwitch',
        'NetworkRouter',
        'TowerType',
        'TowerMember',
        'TowerEquipment',
        'TowerMount',
        'InstallTeam'
    );
    
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
    
    //public $actsAs = array('Search.Searchable');   // not sure if this is used anymore
    
    /*
    // used by search?
    public $filterArgs = array(
        // filterTitle is defined below
        array('name' => 'site_name', 'type' => 'query', 'method' => 'filterSite'),
        // this is used in a drop down of districts
        //array('name' => 'district', 'type' => 'value'),
    );
    */
    
    public function __construct($id = false,$table = null,$ids = null) {
        parent::__construct($id,$table,$ids);
    }

    /*
    public function filterSite($data, $field = null) {
        if(empty($data['site_name'])) {
            return array();
        }
        $site_name = '%' . $data['site_name'] . '%';
        return array(
            'OR' => array(
                $this->alias . '.site_name LIKE' => $site_name,
            ));
    }
    */
    
    // return true if a site is owned by a user (was created by)
    public function isOwnedBy($site, $user) {
        return $this->field('id', array('id' => $site, 'user_id' => $user)) === $site;
    }
}
?>
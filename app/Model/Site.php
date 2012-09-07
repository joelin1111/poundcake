<?php
class Site extends AppModel {
    
    // A site belongs to a region, etc.
    // this is a one-way relationship, e.g. at the moment you cannot get all
    // sites for a region, would need to define the relationship the other
    // way to do that
    var $belongsTo = array(
        'Zone',
        'ConnectivityType',
        'InterventionType',
        'SiteState',
        'ServiceProvider',
        'PowerType',
        'RoadType',
    );
    
    public $hasMany = array(
        'Contacts' => array(
                'className' => 'Contact',
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
                            'message' => 'This field cannot be blank.',
                            //'allowEmpty' => false,
                            //'required' => false,
                            //'last' => false, // Stop validation after this rule
                            //'on' => 'create', // Limit validation to 'create' or 'update' operations
                    ),
                    'alphanumeric' => array(
                            'rule' => array('alphanumeric'),
                            'message' => 'Only letters and numbers are allowed.',
                            //'allowEmpty' => false,
                            //'required' => false,
                            //'last' => false, // Stop validation after this rule
                            //'on' => 'create', // Limit validation to 'create' or 'update' operations
                    ),
            ),
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
                'rule' => '/^-?\d{1,2}\.\d{1,10}$/',
                'message' => 'Bad latutide data, expecting XX.XXXXX or -XX.XXXXX'
            ),
            'lon' => array(
                    // same as above
                    'rule' => '/^-?\d{1,2}\.\d{1,10}$/',
                    'message' => 'Bad longitude data, expecting XX.XXXXX or -XX.XXXXX'
                )
	);
    
    
    // we'll eventually save the site's latitude/longitude here -- but only
    // after decoding it from the spatial data type in the db
    var $lat = 0;
    var $lon = 0;
    
    // this virtualField is also defined in the sp_nearby stored procedure - that version
    // is used to place placemarkers for nearby sites on the site view page map
    var $virtualFields = array('site_vf' => 'CONCAT(site_code, " ", site_name)');
    
    // The displayField attribute specifies which database field should be used as a
    // label for the record. The label is used in scaffolding and in find('list') calls.
    // The model will use name or title, by default.
    public $displayField = 'site_vf';
    
    
    public $actsAs = array('Search.Searchable');
    
    public $filterArgs = array(
        // filterTitle is defined below
        // array('name' => 'site_name', 'type' => 'query','method'=>'filterTitle'),
        //array('name' => 'site_name', 'type' => 'like', 'field' => 'School.site_name'),
        array('name' => 'site_name', 'type' => 'query', 'method' => 'filterSchool'),
        //array('name' => 'district', 'type' => 'string'),
        // this is used in a drop down of districts
        array('name' => 'district', 'type' => 'value'),
        /*
        array('name' => 'title', 'type' => 'like'),
        array('name' => 'status', 'type' => 'value'),
        array('name' => 'blog_id', 'type' => 'value'),
        array('name' => 'search', 'type' => 'like', 'field' => 'Article.description'),
        array('name' => 'range', 'type' => 'expression', 'method' => 'makeRangeCondition', 'field' => 'Article.views BETWEEN ? AND ?'),
        array('name' => 'username', 'type' => 'like', 'field' => 'User.username'),
        array('name' => 'tags', 'type' => 'subquery', 'method' => 'findByTags', 'field' => 'Article.id'),
        array('name' => 'filter', 'type' => 'query', 'method' => 'orConditions'),
 
         */
    );
    
    /**
    construct *
    * @return void
    */
     public function __construct($id = false,$table = null,$ids = null) {
        /*$this->statuses = array(
            'open' => __('Open',true),
            'closed' => __('Closed',true),
        );
        $this->categories = array(
            'bug' => __('bug',true),
            'support' => __('support',true),
            'technical' => __('technical',true),
            'other' => __('other',true),
        );
        */
        parent::__construct($id,$table,$ids);
    }

    public function filterSchool($data, $field = null) {
        if(empty($data['site_name'])) {
            return array();
        }
        $site_name = '%' . $data['site_name'] . '%';
        return array(
            'OR' => array(
                $this->alias . '.site_name LIKE' => $site_name,
            ));
    }
    
    // return true if a site is owned by a user (was created by)
    public function isOwnedBy($site, $user) {
        return $this->field('id', array('id' => $site, 'user_id' => $user)) === $site;
    }
}
?>
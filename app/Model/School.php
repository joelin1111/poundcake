<?php
class School extends AppModel {
    
    // A school belongs to a region, etc.
    // this is a one-way relationship, e.g. at the moment you cannot get all
    // schools for a region, would need to define the relationship the other
    // way to do that
    var $belongsTo = array(
        'Province',
        'ConnectivityType',
        'InterventionType',
        'SiteState',
        'ServiceProvider',
        'PowerType',
        'District',
        'RoadType',
        'District'
    );
    
    // we'll eventually save the school's latitude/longitude here -- but only
    // after decoding it from the spatial data type in the db
    var $lat = 0;
    var $lon = 0;
    
    /**
    * Display field
    *
    * @var string
    */
    public $displayField = 'primary_school';
    
    public $actsAs = array('Search.Searchable');
    
    public $filterArgs = array(
        // filterTitle is defined below
        // array('name' => 'primary_school', 'type' => 'query','method'=>'filterTitle'),
        //array('name' => 'primary_school', 'type' => 'like', 'field' => 'School.primary_school'),
        array('name' => 'primary_school', 'type' => 'query', 'method' => 'filterSchool'),
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
        if(empty($data['primary_school'])) {
            return array();
        }
        $primary_school = '%' . $data['primary_school'] . '%';
        return array(
            'OR' => array(
                $this->alias . '.primary_school LIKE' => $primary_school,
            ));
    }
}
?>
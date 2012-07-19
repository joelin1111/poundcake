<?php
App::uses('AppModel', 'Model');
/**
 * District Model
 *
 */
class District extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';
        
        public $validate = array(
            'name' => array(
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
	);

}

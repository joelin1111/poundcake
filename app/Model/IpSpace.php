<?php
/**
 * Model for single IP address.
 *
 * Developed against CakePHP 2.3.0 and PHP 5.4.x.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         NetworkAddress was introduced in Poundcake v3.0.0
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class IpSpace extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'ip_address';

    /*
     * Default sort order
     */
    // var $order = 'IpSpace.ip_address ASC';
    
    /*
     * We're using a virtual field to point to the CIDR of the parent IpSpace
     * For a host record, we would not say 10.1.2.4/32 -- rather we'd say 10.1.2.4/24
     * and the "/24" comes from its parent IpSpace.
     */
    public $virtualFields = array(
        'parent_cidr' => 'SELECT cidr FROM ip_spaces WHERE id=IpSpace.parent_id',
        'gw_address' => 'SELECT INET_NTOA(ip_address) FROM ip_spaces WHERE id=IpSpace.gateway_id',
    );
    
    /*
     * Relations
     */
    var $belongsTo = array(
        'Project'
    );
    
    var $actsAs = array( 
        'IPv4' => array( 
            'fields' => array( 
                'ip_address'
            ) 
        ),
        'Tree' // @see http://book.cakephp.org/2.0/en/core-libraries/behaviors/tree.html
    );
}
?>
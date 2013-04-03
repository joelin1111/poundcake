<?php
/**
 * Behavior to encode/decode IPv4 addresses.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.x.
 *
 * Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2013, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model.Behavior
 * @since         IPv4Behavior was introduced in Poundcake v2.3
 * @license       XYZ License
 */

class IPv4Behavior extends ModelBehavior { 
    var $settings = array(); 
    
    function setup(Model $model, $settings = array()) { 
        if (!isset($this->settings[$model->alias])) { 
            $this->settings[$model->alias] = array( 
                'fields' => array() 
            ); 
        } 

        $this->settings[$model->alias] = array_merge($this->settings[$model->alias], $settings); 
    } 
    
    /*
     * Encode the IPv4 address to an unsigned in before saving to the database
     */
    function beforeSave(Model $model, $options = array()) { 
        foreach ($this->settings[$model->alias]['fields'] AS $field) { 
            if (isset($model->data[$model->alias][$field])) { 
                //print_r( $model->alias[$field] );
                $model->data[$model->alias]['d_'.$field] = $model->data[$model->alias][$field]; 
                $model->data[$model->alias][$field] = ip2long( $model->data[$model->alias][$field] ); 
//                debug($model->data[$model->alias]);
            } 
        }
        return true; 
    }
    
//    function beforeFind(Model $model, $query) { 
//        $queryData = null;
//        foreach ($this->settings[$model->alias]['fields'] AS $field) { 
//            if (isset($queryData['conditions'][$model->alias.'.'.$field])) { 
//                $queryData['conditions'][$model->alias.'.'.$field] = $this->encrypt($queryData['conditions'][$model->alias.'.'.$field]); 
//            } 
//        } 
//        return $queryData; 
//    } 
    
    /*
     * Decode the IPv4 address to a human readable "dotted quad" format
     */
    function afterFind(Model $model, $results, $primary) { 
        foreach ($this->settings[$model->alias]['fields'] AS $field) {
            if ($primary) { 
                foreach ($results AS $key => $value) { 
                    if (isset($value[$model->alias][$field])) { 
//                        debug( $value[$model->alias][$field] );
//                        $i = $value[$model->alias][$field];
//                        $i = long2ip( $i );
                        $results[$key][$model->alias][$field] = long2ip( $value[$model->alias][$field] ); 
//                        debug( $i );
//                        $results[$key][$model->alias][$field] = $i;
                    } 
                } 
            } else { 
                if (isset($results[$field])) { 
                    $results[$field] = long2ip( $results[$field] ); 
                } 
            }
        }
        
        return $results; 
    }
} 
?>

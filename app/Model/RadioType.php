<?php
/**
 * Model for radio type.
 *
 * Developed against CakePHP 2.2.3 and PHP 5.4.x.
 *
 * Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 *
 * Licensed under XYZ License.
 * 
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2012, Inveneo, Inc. (http://www.inveneo.org)
 * @author        Clark Ritchie <clark@inveneo.org>
 * @link          http://www.inveneo.org
 * @package       app.Model
 * @since         RadioType precedes Poundcake v2.2.1
 * @license       XYZ License
 */


App::uses('AppModel', 'Model');

class RadioType extends AppModel {

    /*
     * Display field for select lists
     */
    public $displayField = 'name';

    /*
     * Default sort order
     */
    var $order = 'RadioType.name ASC';
    
    /*
     * Relations
     */
    var $belongsTo = array(
       'RadioBand'
    );
    
    /*
     * Relations
     */
    var $hasMany = array(
       'NetworkRadios'
    );
    
    /*
     * Relations
     */
    public $hasAndBelongsToMany = array('AntennaType');
    
    // var $actsAs = array('Containable');
    
    /*
     * Field-level validation rules
     */
    public $validate = array(
        'name' => array(
            'notempty' => array(
                'rule' => array('notempty'),
                'message' => 'This field cannot be blank.',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
            )
        )
    );
    
    /*
     * 
     */
    public function getFrequencies( $radio_band_id = null ) {
        // this was originally in NetworkRadiosController (called when the NetworkRadio edit page
        // was displayed -- and also in the RadioTypes controller (called via jQuery when the
        // user pieced a different RadioType) -- cominging here into one model function used by
        // both
        if ( $radio_band_id == null ) {
            $radio_band_id = $this->field('radio_band_id');
        }
        
        $this->RadioBand->Frequency->recursive = -1;
        $frequencies_list = $this->RadioBand->Frequency->findAllByRadioBandId( $radio_band_id );
        $frequencies = array();
        foreach ( $frequencies_list as $f ) {
            $label = $f['Frequency']['name'].' ('.$f['Frequency']['frequency'].' MHz)';
            $frequencies[ $f['Frequency']['frequency'] ] = $label;
        }
        return $frequencies;
    }
    
    public function getAntennas( $radio_type_id = null ) {
        
        if ( $radio_type_id == null ) {
            $radio_type_id = $this->field('radio_type_id');
        }
        
        $antennatypes_tmp = $this->find('all', array(
            'conditions' => array('RadioType.id' => $radio_type_id ),
            'contain' => array('AntennaType'),
            // 'order' => array('AntennaType.name' => 'DESC')
        ));
        
        $antennatypes = array();
        foreach ( $antennatypes_tmp[0]['AntennaType'] as $at ) {
            $antennatypes[ $at['id'] ] = $at['name'];            
        }
//        $antennatypes[0] = 'foo1';$antennatypes[1] = 'bar1';
        
        return $antennatypes;
    }
}
?>
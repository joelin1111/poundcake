<?php
/**
 * Controller for IP Spacees.
 *
 * This is a very basic controller to add/view/update/delete IP Spacees.
 * Note: All heavy lifting (binary math) is performed in a SQL trigger.
 * 
 * Developed against CakePHP 2.3.0 and PHP 5.4.4.
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
 * @package       app.Controller
 * @since         IpSpaceController was introduced in Poundcake v3.0.0
 * @license       XYZ License
 */

App::uses('AppController', 'Controller');

class IpSpacesController extends AppController {

    //const MAX_CIDRS = 32;
    
    /*
     * Main listing for all IpSpaces
     */
    public function index( $id = null ) {
        $project_id = $this->Session->read('project_id' );        
        $ip_spaces = $this->IpSpace->find('threaded', array( 
           'order' => array('IpSpace.lft'),
           'conditions' => array('IpSpace.project_id' => $project_id)
        )); 
//        echo '<pre>';
//        print_r($ip_spaces);
//        echo '</pre>';
        $this->set(compact('ip_spaces', 'project_id')); 
    }
    
    /*
     * Add a new IpSpace
     */
    public function add( $parent_id = null ) {
        $project_id = $this->Session->read('project_id');
        
        if ($this->request->is('post')) {
//            echo '<pre>';
//            print_r( $this->request->data );
            $new_cidr = $this->request->data['IpSpace']['cidr'];
            // load the parent IP Space
            $this->IpSpace->recursive = -1;
            $parent_id = $this->request->data['IpSpace']['parent_id'];
            $this->IpSpace->id = $parent_id;
            $this->IpSpace->read();
            // number of existing IP Spaces that already *directly* hang
            // off the parent node
            $children = $this->IpSpace->childCount($parent_id, true);           
            $parent_ip = $this->IpSpace->field('ip_address');
            
            if ( $project_id == null ) {
                $this->IpSpace->create();
                if ($this->IpSpace->save($this->request->data)) {
                    $this->Session->setFlash('The IP Space has been saved.');
                    $this->redirect(array('action' => 'index'));
                }
            } elseif ( $children == 0 ) {
                $new_ip = $parent_ip;
            } else {                
                $parent_cidr = $this->IpSpace->field('cidr');
                $range = $this->getIpRange( $parent_ip, $parent_cidr );
                
                // calculate the maximum possible number of network's that can
                // be created within the parent network (based on the parent's
                // CIDR)
                $n = $new_cidr - $parent_cidr;
                $pos_nets = pow( 2, $n );
                
                if ( $children >= $pos_nets ) {
                    $this->Session->setFlash('Error!  Parent subnet is a /'.$parent_cidr.' - Maximum possible subnets reached.');
                    $this->redirect(array('action' => 'index', $parent_id ));
                }
                
//                echo( "A /$new_cidr in a /$parent_cidr has $pos_nets possible networks<br>" );
//                echo( "There are currently $children off the parent node<br>" );
//                echo( "Start at: ".long2ip($range[0])."<br>" );
//                echo( "End at: ".long2ip($range[1])."<br>" );
                $i=0;
                $start_at = $range[0];
                $jump_by = ( $range[1] - $range[0] ) / $pos_nets;
                while ( $i < $children ) {                    
//                    echo( " Block: ".long2ip($start_at)."<br>");
                    $start_at += $jump_by;
                    $i++;
                }
                $next_ip = $start_at;
                
                // I'm not sure about this... it seems to work?
                $dec = substr(strrchr($next_ip, "."), 1);
                if ( ( $dec == 50 ) || ( $dec == 75 ) ) {
                    $next_ip += 1;
                }
                
//                print_r( $next_ip );
//                echo '<br>';
//                print_r( long2ip( $next_ip ) );
//                echo '<br>';
//                print_r( round($next_ip, 0, PHP_ROUND_HALF_UP ));
//                echo '<br>';
//                print_r( long2ip( round($next_ip, 0, PHP_ROUND_HALF_UP )));
//                echo '<br>';
//                print_r( long2ip( round(180355071+1 )));
                
                //$next_ip = round($start_at, 0, PHP_ROUND_HALF_UP);
                
                $new_ip = long2ip ( round($next_ip, 0, PHP_ROUND_HALF_UP ) );
            }
            
            // /32s cannot end with .0 so add one
            if ( $new_cidr == 32 ) {
                $new_ip = long2ip( ip2long( $new_ip ) + 1 );
            }
                
            $this->request->data['IpSpace']['ip_address'] = $new_ip;
                    
            $this->IpSpace->create();
            if ($this->IpSpace->save($this->request->data)) {
                $this->Session->setFlash('The IP Space has been saved.');
                //$this->redirect(array('action' => 'view','parent_id'=>$parent_id,'project_id'=>$project_id));
                $this->redirect(array('action' => 'index/'.$parent_id));
            } else {
                $this->Session->setFlash('Error!  The IP Space could not be saved. Please, try again.');
//                $log = $this->IpSpace->getDataSource()->getLog(false, false);
//                debug($log);    
            }
        }
        if ( $parent_id > 0 ) {
            $this->IpSpace->recursive = -1;
            $this->IpSpace->id = $parent_id;
            $this->IpSpace->read();
            $parent_ip = $this->IpSpace->field('ip_address');
            $parent_cidr = $this->IpSpace->field('cidr');            
        } else {
            $parent_cidr = 7;
        }
//        var_dump($parent_cidr);
        if ( $parent_cidr >= self::MAX_CIDRS ) {
            $this->Session->setFlash('Error!  No more spaces can be added.');
            $this->redirect(array( 'action' => 'index/'.$parent_id ));
        }
        
        $this->getCidrs( $parent_cidr );
        $this->set(compact( 'parent_id', 'ip_address', 'project_id' ));
    }

//    private function getIpRange2($from, $to) {
//        $start = ip2long($from);
//        $end = ip2long($to);
//        $range = range($start, $end);
//        var_dump( $range );
//        return array_map('long2ip', $range);
//    }
    
    /*
     * Delete an existing IpSpace
     */
    public function delete($id = null) {
        /*
        We are not a post link!  This is non-standard CakePHP...
        
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        */
        
        $this->IpSpace->id = $id;
        $this->IpSpace->read();
        $parent_id = $this->IpSpace->field('parent_id');
        
        if (!$this->IpSpace->exists()) {
            throw new NotFoundException('Invalid IP Space');
        }
        if ($this->IpSpace->delete()) {
            $this->Session->setFlash('IP Space deleted.');
            $this->redirect(array('action' => 'index', $parent_id ));
        }
        $this->Session->setFlash('Error!  IP Space was not deleted.');
        $this->redirect(array('action' => 'index'));
    }
  
    /**
    * get the first ip and last ip from cidr(network id and mask length)
    * i will integrate this function into "Rong Framework" :)
    * @author admin@wudimei.com
    * @param string $cidr 56.15.0.6/16 , [network id]/[mask length]
    * @return array $ipArray = array( 0 =>"first ip of the network", 1=>"last ip of the network" );
    *                         Each element of $ipArray's type is long int,use long2ip( $ipArray[0] ) to convert it into ip string.
    * example:
    * list( $long_startIp , $long_endIp) = getIpRange( "56.15.0.6/16" );
    * echo "start ip:" . long2ip( $long_startIp );
    * echo "<br />";
    * echo "end ip:" . long2ip( $long_endIp );
    */
    private function getIpRange( $ip, $mask ) {
        // list($ip, $mask) = explode('/', $cidr);

        $maskBinStr =str_repeat("1", $mask ) . str_repeat("0", 32-$mask );      //net mask binary string
        $inverseMaskBinStr = str_repeat("0", $mask ) . str_repeat("1",  32-$mask ); //inverse mask

        $ipLong = ip2long( $ip );
        $ipMaskLong = bindec( $maskBinStr );
        $inverseIpMaskLong = bindec( $inverseMaskBinStr );
        $netWork = $ipLong & $ipMaskLong;  

        $start = $netWork+1;//去掉网络号 ,ignore network ID(eg: 192.168.1.0)

        $end = ($netWork | $inverseIpMaskLong) -1 ; //去掉广播地址 ignore brocast IP(eg: 192.168.1.255)
        return array( $start, $end );
  }
  
    public function isAuthorized($user) {
        
        $allowed = array( "index", "view" );
        if ( in_array( $this->action, $allowed )) {
            return true;
        }
        
//        $allowed = array( "add", "edit", "delete" );
//        if ( in_array( $this->action, $allowed )) {
//            if ( $this->Session->read('role') === 'edit') {
//                return true;
//            }
//        }
        
        return parent::isAuthorized($user);
    }
}

<?php
App::uses('AppController', 'Controller');
/**
 * Districts Controller
 *
 * @property District $District
 */
class DistrictsController extends AppController {

    //public $helpers = array('Js');
    //public $helpers = array('Js' => array('Jquery'));
    
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->District->recursive = 0;
		$this->set('districts', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->District->id = $id;
		if (!$this->District->exists()) {
			throw new NotFoundException(__('Invalid district'));
		}
		$this->set('district', $this->District->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->District->create();
			if ($this->District->save($this->request->data)) {
				$this->Session->setFlash(__('The district has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The district could not be saved. Please, try again.'));
			}
                }
                //$areas = $this->District->Area->find('list');
                
                // this is a little bit of a hack/cheat, but when someone goes to
                // add a district, normally we'd give them a select list showing all
                // areas
                // e.g. $areas = $this->District->Area->find('list');
                // however because we're using Ajax to auto-refresh the Area
                // select list with the areas for a specified catchment, let's
                // default the list to match the first item in the
                // Catchment list
                $areas = $this->District->Area->find(
                        'list',
                        array(
                            'conditions' => array('Area.catchment_id' => 1)
                        )
                );
                //echo "<pre>".print_r($areas)."</pre>";
                // get all Catchments
                $catchments = $this->District->Area->Catchment->find('list');
                $this->set(compact('catchments','areas'));
	}


/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->District->id = $id;
		if (!$this->District->exists()) {
			throw new NotFoundException(__('Invalid district'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->District->save($this->request->data)) {
				$this->Session->setFlash(__('The district has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The district could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->District->read(null, $id);
		}
	}

/**
 * delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->District->id = $id;
		if (!$this->District->exists()) {
			throw new NotFoundException(__('Invalid district'));
		}
		if ($this->District->delete()) {
			$this->Session->setFlash(__('District deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('District was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
    public function getByArea() {
            // see documenttion on Area controller
           
            //if ( $this->request->data != null ) {
                $area_id = $this->request->data['School']['area_id'];
                
                $conditions = array('District.area_id' => $area_id);
                
                $districts = $this->District->find('list', array(
                        'conditions' => $conditions,
                        'recursive' => -1
                        ));
                
                //$areas = array ('foo','bar','car');
                $this->set('districts', $districts);
                //$this->layout = false;
                $this->layout = 'ajax';
            //}
        }
}

<?php
App::uses('AppController', 'Controller');
/**
 * Regions Controller
 *
 * @property Region $Region
 */
class RegionsController extends AppController {

    public $helpers = array('Js');
    
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Region->recursive = 0;
		$this->set('regions', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
           
		$this->Region->id = $id;
		if (!$this->Region->exists()) {
			throw new NotFoundException(__('Invalid region'));
		}
		$this->set('region', $this->Region->read(null, $id));
    
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Region->create();
			if ($this->Region->save($this->request->data)) {
				$this->Session->setFlash(__('The region has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The region could not be saved. Please, try again.'));
			}
		}
		$areas = $this->Region->Area->find('list');
		$this->set(compact('areas'));
	}

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Region->id = $id;
		if (!$this->Region->exists()) {
			throw new NotFoundException(__('Invalid region'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Region->save($this->request->data)) {
				$this->Session->setFlash(__('The region has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The region could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Region->read(null, $id);
		}
		$areas = $this->Region->Area->find('list');
		$this->set(compact('areas'));
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
		$this->Region->id = $id;
		if (!$this->Region->exists()) {
			throw new NotFoundException(__('Invalid region'));
		}
		if ($this->Region->delete()) {
			$this->Session->setFlash(__('Region deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Region was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        public function getByArea() {
            // this function returns the set of catchments that match a given
            // area -- is used by the add method in the add district
            //if ( $this->request->data != null ) {
                
                // if this is being called from the Add District form, we get
                // catchment_id from $this->request->data['District']['catchment_id']
                // otherwise if this is being called from the Add School form,
                // we need to get it off the school object
                // $catchment_id = $this->request->data['District']['catchment_id'];
                
                // revisit, there is probably a cleaner way to do this
                // this is needed to re-use the Ajax code from multiple forms
                // $obj is basically the object of the form that the request is
                // coming from
                /*if ($this->request->data['Region'] != null ) {
                    $obj = 'Region';
                } elseif ($this->request->data['School'] != null ) {
                    $obj = 'School';
                }*/
                $area_id = $this->request->data['District']['area_id'];
                
                $conditions = array('Region.area_id' => $area_id);
                
                $regions = $this->Region->find('list', array(
                        'conditions' => $conditions,
                        'recursive' => -1
                        ));
                //$regions = array ('foo','bar','car');
                $this->set('regions',$regions);
                //$this->layout = false;
                $this->layout = 'ajax';
            //}
        }
}

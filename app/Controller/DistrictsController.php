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
                $areas = $this->District->Area->find('list');
                //$this->set(compact('areas'));
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
        
        
        
        public function getByCatchment() {
            
		$catchment_id = $this->request->data['Area']['catchment_id'];
                //echo $catchment_id;
                //die;
		$areas = $this->Area->find('list', array(
			'conditions' => array('Area.catchment_id' => $catchment_id),
			'recursive' => -1
			));
 
		$this->set('areas',$areas);
                 $this->layout = false;
		$this->layout = 'ajax';
	}
}

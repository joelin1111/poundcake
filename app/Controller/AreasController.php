<?php
App::uses('AppController', 'Controller');
/**
 * Areas Controller
 *
 * @property Area $Area
 */
class AreasController extends AppController {

    public $helpers = array('Js');
    
/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Area->recursive = 0;
		$this->set('areas', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Area->id = $id;
		if (!$this->Area->exists()) {
			throw new NotFoundException(__('Invalid area'));
		}
		$this->set('area', $this->Area->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Area->create();
			if ($this->Area->save($this->request->data)) {
				$this->Session->setFlash(__('The area has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The area could not be saved. Please, try again.'));
			}
		}
		$catchments = $this->Area->Catchment->find('list');
                $this->set(compact('catchments'));
        }

/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Area->id = $id;
		if (!$this->Area->exists()) {
			throw new NotFoundException(__('Invalid area'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Area->save($this->request->data)) {
				$this->Session->setFlash(__('The area has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The area could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Area->read(null, $id);
		}
		$catchments = $this->Area->Catchment->find('list');
		$this->set(compact('catchments'));
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
		$this->Area->id = $id;
		if (!$this->Area->exists()) {
			throw new NotFoundException(__('Invalid area'));
		}
		if ($this->Area->delete()) {
			$this->Session->setFlash(__('Area deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Area was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
        public function getByCatchment() {
            // this function returns the set of catchments that match a given
            // area -- is used by the add method in the add district
            //if ( $this->request->data != null ) {
                
                // if this is being called from the Add District form, we get
                // catchment_id from $this->request->data['District']['catchment_id']
                // otherwise if this is being called from the Add School form,
                // we need to get it off the school object
                // $catchment_id = $this->request->data['District']['catchment_id'];
                
                // revisit, there is probably a cleaner way to do this
                if ($this->request->data['District'] != null ) {
                    $obj = 'District';
                } elseif ($this->request->data['School'] != null ) {
                    $obj = 'School';
                }
                $catchment_id = $this->request->data[$obj]['catchment_id'];
                
                $conditions = array('Area.catchment_id' => $catchment_id);
                
                $areas = $this->Area->find('list', array(
                        'conditions' => $conditions,
                        'recursive' => -1
                        ));
                //$areas = array ('foo','bar','car');
                $this->set('areas',$areas);
                //$this->layout = false;
                $this->layout = 'ajax';
            //}
        }
}

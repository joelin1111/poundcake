<?php
App::uses('AppController', 'Controller');
/**
 * Contacts Controller
 *
 * @property Contact $Contact
 */
class ContactsController extends AppController {

/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->Contact->recursive = 0;
		$this->set('contacts', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->Contact->id = $id;
                if (!$this->Contact->exists()) {
			throw new NotFoundException(__('Invalid contact'));
		}
		$this->set('contact', $this->Contact->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Contact->create();
			if ($this->Contact->save($this->request->data)) {
				$this->Session->setFlash(__('The contact has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact could not be saved. Please, try again.'));
			}
		}
	}

        // return all the TC/TRCs to allow the user to be assigned to
        function getTrcs() {
            $this->set('trcs',$this->Contact->Trc->find('list'));
        }
        
        // return all the schools to allow the user to be assigned to
        function getSchools() {
            $this->set('schools',$this->Contact->School->find('list'));
        }
        
        // return all the districts to allow the user to be assigned to
        function getDistricts() {
            $this->set('districts',$this->Contact->District->find('list'));
        }
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->Contact->id = $id;
                $this->getTrcs();
                $this->getSchools();
                $this->getDistricts();
		if (!$this->Contact->exists()) {
			throw new NotFoundException(__('Invalid contact'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->Contact->save($this->request->data)) {
				$this->Session->setFlash(__('The contact has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The contact could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Contact->read(null, $id);
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
		$this->Contact->id = $id;
		if (!$this->Contact->exists()) {
			throw new NotFoundException(__('Invalid contact'));
		}
		if ($this->Contact->delete()) {
			$this->Session->setFlash(__('Contact deleted'));
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('Contact was not deleted'));
		$this->redirect(array('action' => 'index'));
	}
        
    public function isAuthorized($user) {
            // everyone can see the list and view individual Contacts
            if ($this->action === 'index' || $this->action === 'view') {
                return true;
            }
            // allow users with the rolealias of "edit" to add/edit/delete
            if ($this->action === 'add' || $this->action === 'edit' || $this->action === 'delete') {
                if (isset($user['Role']['rolealias']) && $user['Role']['rolealias'] === 'edit') {
                    return true;
                }
            }
        
        return parent::isAuthorized($user);
    }
}

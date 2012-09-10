<?php
App::uses('AppController', 'Controller');
/**
 * RoadTypes Controller
 *
 * @property RoadType $RoadType
 */
class RoadTypesController extends AppController {

    public function index() {
        $this->RoadType->recursive = 0;
        $this->set('roadTypes', $this->paginate());
    }

    public function view($id = null) {
        $this->RoadType->id = $id;
        if (!$this->RoadType->exists()) {
                throw new NotFoundException(__('Invalid road type'));
        }
        $this->set('roadType', $this->RoadType->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->RoadType->create();
            if ($this->RoadType->save($this->request->data)) {
                    $this->Session->setFlash(__('The road type has been saved'));
                    $this->redirect(array('action' => 'index'));
            } else {
                    $this->Session->setFlash(__('The road type could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->RoadType->id = $id;
        if (!$this->RoadType->exists()) {
                throw new NotFoundException(__('Invalid road type'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
                if ($this->RoadType->save($this->request->data)) {
                        $this->Session->setFlash(__('The road type has been saved'));
                        $this->redirect(array('action' => 'index'));
                } else {
                        $this->Session->setFlash(__('The road type could not be saved. Please, try again.'));
                }
        } else {
                $this->request->data = $this->RoadType->read(null, $id);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
                throw new MethodNotAllowedException();
        }
        $this->RoadType->id = $id;
        if (!$this->RoadType->exists()) {
                throw new NotFoundException(__('Invalid road type'));
        }
        if ($this->RoadType->delete()) {
                $this->Session->setFlash(__('Road type deleted'));
                $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Road type was not deleted'));
        $this->redirect(array('action' => 'index'));
    }

    // check the ACL
    public function isAuthorized($user) {
        return parent::isAuthorized($user);
    }
}

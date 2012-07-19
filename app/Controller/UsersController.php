<?php

// following this example:
// http://book.cakephp.org/2.0/en/tutorials-and-examples/blog-auth-example/auth.html

class UsersController extends AppController {

    public function index() {
        $this->User->recursive = 0;
        $this->set('users', $this->paginate());
    }

    public function view($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        $this->set('user', $this->User->read(null, $id));
    }

    public function add() {
        if ($this->request->is('post')) {
            $this->User->create();
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        }
    }

    public function edit($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
            unset($this->request->data['User']['password']);
        }
    }

    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->User->delete()) {
            $this->Session->setFlash(__('User deleted'));
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('User was not deleted'));
        $this->redirect(array('action' => 'index'));
    }
    
    public function beforeFilter() {
        parent::beforeFilter();
        // this needs to be removed before going into production
        // basically bypass authentication for:  /users/add 
        $this->Auth->allow('add');
    }
    
    public function setup() {
        debug();
        //// nothing
        /*
        if (!$this->User->isAuthorized()) {
            $this->redirect(array('controller' => 'schools', 'action' => 'overview'));
        }
        */
        exit;

    }
    
    public function login() {
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                $this->redirect($this->Auth->redirect());
            } else {
                $this->Session->setFlash(__('Invalid username or password, try again'));
            }
        }
    }

    public function logout() {
        // setFlash doesn't actually work here, maybe we should redirect them to a page
        // confirming they've been logged out (which then redirects to the main page?
        // $this->Session->setFlash(__('Logout complete')); // a white lie? :-)
        $this->redirect($this->Auth->logout());
    }
    
    public function isAuthorized($user) {
        // override isAuthorized in AppController by allowing specific functionality
        // All registered users can add posts
        // remember to comment this out!
        
        if ($this->action === 'add') {
            // for testing
            return true;
        }
        /*
        from the sample code:
        // The owner of a post can edit and delete it
        if (in_array($this->action, array('edit', 'delete'))) {
            $postId = $this->request->params['pass'][0];
            if ($this->Post->isOwnedBy($postId, $user['id'])) {
                return true;
            }
        }
        */
        
        return parent::isAuthorized($user);
    }
}
?>
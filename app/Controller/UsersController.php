<?php

class UsersController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'User.username' => 'asc'
        )
    );
    
    public function index() {
        $this->User->recursive = 0;
        $this->set('users', $this->paginate());
    }

    /*
    it seems unnecessary to have a view for user since the users are all listed
    on the index page
    public function view($id = null) {
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        $this->set('user', $this->User->read(null, $id));
    }
    */
    
    function getRoles() {
        $roles = $this->User->Role->find('list');
        $this->set('roles',$roles);
    }
    
    function getUsersProjects() {
        // return an array of projects this user is assigned to
        
        // this really would be more useful to take a user id as a parameter
        // and return an array of projects
        
        //$projects = $this->User->Project->find('list');
        // I thought Cake would make finding all projects this user is associated
        // with (which is a HABTM relation) easier -- or am I just not doing this
        // right?
        $projects = $this->User->Project->find('list', array( 
            'conditions' => array('ProjectsUser.user_id' => $this->Auth->user('id')), 
            'joins' => array( 
                array('table' => 'projects_users', 
                      'alias' => 'ProjectsUser', 
                      'type' => 'inner', 
                      'conditions'=> array('ProjectsUser.project_id = Project.id')) 
            ) 
            ));
//        echo '<pre>';
//        echo "For user ID: ".$this->Auth->user('id');
//        echo "<br>";
//        print_r(compact('projects'));
//        echo '</pre>';
//        die;
        
        $this->set(compact('projects'));
    }
    
    function getAllProjects() {
        // return all projects
        $projects = $this->User->Project->find('list');
        $this->set('projects',$projects);
    }
    
    public function project($id = null) {
        // this is true when the user has switched projects
        if ($this->request->is('post') || $this->request->is('put')) {
//            echo '<pre>';
//            print_r($this->request->data);
//            echo '</pre>';
//            die;
            $project_id = $this->request->data['Project']['Project'];
            
            $this->loadModel('Project',$project_id);
            $project = $this->Project->read();
            $this->Session->write('project_id', $project_id);
            $this->Session->write('project_name', $project['Project']['name']);
            
//            echo '<pre>';
//            echo "Session before:<BR>";
//            print_r($this->Session->read('conditions'));            
            $this->Session->delete('conditions'); // clear any search conditions
//            echo "Session after:<BR>";
//            print_r($this->Session->read('conditions'));            
//            echo '</pre>';
            
            
            
            
            // save the newly selected project id, name to a session variable
            // allows us to filter sites/radios/routers/switches to the currently
            // chosen project
            if ($this->Session->write('project_id',$project_id) &&
                $this->Session->write('project_name',$project['Project']['name'])
                ) {
                // also save the selected project id the database -- which
                // becomes the project the next time the user logs in
                // see login in this controller
                // $uid = CakeSession::read("Auth.User.id");
                if (!is_null($id)) {
                    $this->User->id = $id;
                    $this->User->saveField('project_id',$project_id);
                }
                $this->Session->setFlash(__('The project has been set'));
                $this->redirect(array('controller' => 'sites','action' => 'overview'));
            } else {
                $this->Session->setFlash(__('The project could not be set.'));
            }
        }
        $this->getUsersProjects();
    }
    
    public function add() {
        $this->getRoles();
        if ($this->request->is('post')) {
            $this->User->create();
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been saved'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        }
        $this->getAllProjects();
    }
    
    function password($id = null) {
        $this->User->id = $id;  
//        echo "<pre>";
//        print_r($this->User);
//        echo "</pre>";
//        die;
        if ($this->request->is('post') || $this->request->is('put')) {
            //$this->User->set($this->request->data);
            if ($this->User->validates(array('fieldList' => array('pwd_current')))) {
                //echo "pwd_current validated<br>";
                if ($this->User->validates(array('fieldList' => array('pwd_current','password')))) {
//                    echo "<pre>";
//                    $this->getProjects()
//                    print_r($this->request->data);
//                    echo "</pre>";
//                    die;
                    unset($this->request->data['User']['pwd_current']);
                    if ($this->User->saveAll($this->request->data)) {
                        // success flash/redirect
                        //echo "Saved";
                        $this->Session->setFlash('Password succssfully updated.  Please logout and login again.');
                        
                    } else {
                        $this->Session->setFlash('Error updating password.');
                        //debug($this->User->validationErrors);
                    }
                } else {
                     //echo "pwd FAILED validation<br>";
                }
            } else {
                 //echo "pwd_current FAILED validation<br>";
            }
        } else {
            $this->getAllProjects();
            $this->request->data = $this->User->read(null, $id);
        }
    }
    
    public function permissions($id = null) {
        $this->User->id = $id;
        $this->getRoles();
        $this->getAllProjects();
        
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->request->is('post') || $this->request->is('put')) {
            //unset($this->User->validate['password']);
            
            // we need to check if the user has been removed from a project
            // they were previously assigned to and possibly clear/change
            // their project_id field -- otherwise the user will still have access
            
            // get the id of the last project the user accessed
            $last_project_id = $this->User->field('project_id');
            
            // get an array of projects the user is now currently assigned to
            $new_projects = $this->request->data['Project']['Project'];
 
//            echo '<pre>';
//            echo "$last_project_id <br>";
//            print_r($new_projects);
//            echo '</pre>';
            
            if ( in_array( $last_project_id,  $new_projects ) == 0 ) {
                //echo "Reset project_id";
                // just assign them to the first item in the set of new projects
                $this->User->saveField('project_id',$new_projects[0]);              
            }
            
            // $blackList is also used above
            $blackList = array('password', 'username');
            if ($this->User->save($this->request->data, true, array_diff(array_keys($this->User->schema()), $blackList))) {
            //if ($this->User->save($this->request->data)) {
                $this->Session->setFlash(__('The user has been saved.'));
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash(__('The user could not be saved. Please, try again.'));
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
            unset($this->request->data['User']['password']);
        }
    }
    
    public function edit($id = null) {
        $this->User->id = $id;
        $this->User->read(null,$id);
        $this->set('username',$this->User->field('username'));
//        echo '<pre>';
//        print_r($this->User->field('username'));
//        echo '</pre>';
        
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            if ( $this->User->saveField('password',$this->request->data['User']['password'] )) {
                $this->Session->setFlash(__('The user has been saved.'));
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
    }
    
    public function setup() {
        // show the setup page - main admin landing page
    }
    
    public function login() {
        // if the user is already logged in (maybe opening the site in a new tab)
        // don't send them to the login page
        //echo print_r($this->Auth->user());
       /*
        if ( $this->Auth->user() != null) {
            // user logged in, send to overview page
            $this->redirect(array('controller' => 'sites', 'action' => 'index'));
        }
        */
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                
                $uid = CakeSession::read("Auth.User.id");
                $this->loadModel('User',$uid);
                $this->User->id = $uid;
                $user = $this->User->read();
//                    
                // load the last project the user had viewed -- which was saved
                // to the user table as project_id
                $project = $this->User->Project->findById($this->Auth->user('project_id'));

                // if there is no project_id (last viewed project), just give them their first assigned project
                if ( $project == null ) {
//                    echo "project is null";
//                    $uid = CakeSession::read("Auth.User.id");
//                    $this->loadModel('User',$uid);
//                    $user = $this->User->read();
                    $project = $this->User->Project->find('first');
                    //$this->User->saveField('project_id',$project['Project']['id']);                  
                }
                $project_id = $project['Project']['id'];
                $project_name = $project['Project']['name'];

                // save the project ID and name as session variables
                // see also projects() in this controller
                $this->Session->write('project_id', $project_id);
                $this->Session->write('project_name', $project_name);
                // log the user's login time
                $this->User->saveField('last_login', date( "Y-m-d H:i:s", time() ));
                //echo '<pre>'.$this->User->getLastQuery().'</pre>';
                // send them on their way
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
        //$this->redirect($this->Auth->logout());
        
        // having problems with the logout function sending them to a non-authorized page
        // this workaround seems to work, just send them back to the login page
        // problem described here:
        // see:  http://stackoverflow.com/questions/8262720/cakephp-2-0-logout
        if($this->Auth->user()) {
            //$this->Session->delete('banner');
            $this->Session->destroy();
            $this->redirect($this->Auth->logout());
        } else {
            $this->redirect(array('controller'=>'pages','action' => 'display','home'));
            $this->Session->setFlash(__('Not logged in'), 'default', array(), 'auth');
        }
    }
    
    public function isAuthorized($user) {
        // override isAuthorized in AppController by allowing specific functionality

        // these are the pages the user is allowed to access in this controller
        $available_actions = array(
            'logout',
            'password',
            'change_password',
            'project'
        );
        
        if (array_search($this->action, $available_actions)) {
            return true;
        }
        
        return parent::isAuthorized($user);
    }
}
?>
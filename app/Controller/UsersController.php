<?php
/**
 * Controller for users.
 *
 * This controller is used by both the admin interface, to add/update/delete/edit
 * users within the system, but also performs some user-level functions like
 * login, logout and switching project.  An admin can also assign permissions
 * with functions in this class.
 * 
 * Developed against CakePHP 2.2.3 and PHP 5.4.4.
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
 * @package       app.Controller
 * @since         UsersController precedes Poundcake v2.2.1
 * @license       XYZ License
 */

class UsersController extends AppController {

    public $paginate = array(
        'limit' => 20, // default limit also defined in AppController
        'order' => array(
            'User.username' => 'asc'
        )
    );
    
    /*
     * Main listing for all Users
     */
    public function index() {
        $this->User->recursive = 0;
        $this->set('users', $this->paginate());
    }

    /*
     * Get all the roles defined in the system
     */
    function getRoles() {
        $roles = $this->User->Role->find('list');
        $this->set('roles',$roles);
    }
    
    /*
     * Set an array of projects this user is assigned to
     */
    function getUsersProjects() {
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
        $this->set(compact('projects'));
    }
    
    /*
     * Set an array of all projects in the system
     */
    function getAllProjects() {
        // return all projects
        $projects = $this->User->Project->find('list');
        $this->set('projects',$projects);
    }
    
    /*
     * Switch a user's project context to a new project
     */
    public function project($id = null) {
        // this is true when the user has switched projects
        if ($this->request->is('post') || $this->request->is('put')) {
            $project_id = $this->request->data['Project']['Project'];
            
            $this->loadModel('Project',$project_id);
            $project = $this->Project->read();
            $this->Session->write('project_id', $project_id);
            $this->Session->write('project_name', $project['Project']['name']);
            
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
                $this->Session->setFlash('The project has been set.');
                $this->redirect(array('controller' => 'sites','action' => 'overview'));
            } else {
                $this->Session->setFlash('Error!  The project could not be set.');
            }
        }
        $this->getUsersProjects();
    }
    
    /*
     * Add a new User
     */
    public function add() {
        $this->getRoles();
        if ($this->request->is('post')) {
            
            // if they were not assigned to any projects, make them try again
            if ( !isset($this->request->data['Project']['Project'][0] )) {
                $this->Session->setFlash('Error!  The user must be assigned to at least one project.');
                $this->redirect(array('controller' => 'users','action' => 'add'));
            }
            
            $this->User->create();
            // project_id is the project the user defaults to when they login
            // this should be getting set by the login routine but we can set
            // it here just the same -- give them the first project to which they are assigned
            // if the admin didn't assign them to any projects this will return an error
            $this->request->data['User']['project_id'] = $this->request->data['Project']['Project'][0];
            //debug($this->request->data,false);
            if ($this->User->save($this->request->data)) {
                $this->Session->setFlash('The user has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The user could not be saved. Please, try again.');
            }
        }
        $this->getAllProjects();
    }
    
    /*
     * This password() function is for when a user changes their own password
     */
    function password($id = null) {
        $this->User->id = $id;  

        if ($this->request->is('post') || $this->request->is('put')) {
            if ($this->User->validates(array('fieldList' => array('pwd_current')))) {
                if ($this->User->validates(array('fieldList' => array('pwd_current','password')))) {
                    unset($this->request->data['User']['pwd_current']);
                    if ($this->User->saveAll($this->request->data)) {
                        $this->Session->setFlash('Password succssfully updated.  Please logout and login again.');
                        
                    } else {
                        $this->Session->setFlash('Error!  Problem updating password.');
                    }
                } else {
                     // echo "pwd FAILED validation<br>";
                }
            } else {
                 // echo "pwd_current FAILED validation<br>";
            }
        } else {
            $this->getAllProjects();
            $this->request->data = $this->User->read(null, $id);
        }
    }
    
    /*
     * Grant a user permissions in other projects
     */
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
            
            if ( in_array( $last_project_id,  $new_projects ) == 0 ) {
                // just assign them to the first item in the set of new projects
                $this->User->saveField('project_id',$new_projects[0]);              
            }
            
            // $blackList is also used above
            $blackList = array('password', 'username');
            if ($this->User->save($this->request->data, true, array_diff(array_keys($this->User->schema()), $blackList))) {
                $this->Session->setFlash('The user has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The user could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
            unset($this->request->data['User']['password']);
        }
    }
    
    /*
     * Edit a details for a user
     */
    public function edit($id = null) {
        $this->User->id = $id;
        $this->User->read(null,$id);
        $this->set('username',$this->User->field('username'));
        
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        
        if ($this->request->is('post') || $this->request->is('put')) {
            if ( $this->User->saveField('password',$this->request->data['User']['password'] )) {
                $this->Session->setFlash('The user has been saved.');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('Error!  The user could not be saved. Please, try again.');
            }
        } else {
            $this->request->data = $this->User->read(null, $id);
            unset($this->request->data['User']['password']);
        }
    }
    
    /*
     * Delete a user
     */
    public function delete($id = null) {
        if (!$this->request->is('post')) {
            throw new MethodNotAllowedException();
        }
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->User->delete()) {
            $this->Session->setFlash('User deleted.');
            $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash('Error!  User was not deleted.');
        $this->redirect(array('action' => 'index'));
    }
    
    /*
     * Standard callback function
     */
    public function beforeFilter() {
        // deprecated?  cannot recall why this is here -- doesn't do much...
        parent::beforeFilter();
    }
    
    /*
     * Login is our main login routine
     */
    public function login() {
        // if the user is already logged in (maybe opening the site in a new tab)
        // don't send them to the login page
        if ($this->request->is('post')) {
            if ($this->Auth->login()) {
                
                $uid = CakeSession::read("Auth.User.id");
                $this->loadModel('User',$uid);
                $this->User->id = $uid;
                $user = $this->User->read();

                // load the last project the user had viewed -- which was saved
                // to the user table as project_id
                $project = $this->User->Project->findById($this->Auth->user('project_id'));

                // if there is no project_id (last viewed project), just give them their first assigned project
                if ( $project == null ) {
                    $project = $this->User->Project->find('first');
                }
                $project_id = $project['Project']['id'];
                $project_name = $project['Project']['name'];

                // save the project ID and name as session variables
                // see also projects() in this controller
                $this->Session->write('project_id', $project_id);
                $this->Session->write('project_name', $project_name);
                // log the user's login time
                $this->User->saveField('last_login', date( "Y-m-d H:i:s", time() ));
                // send them on their way
                $this->redirect($this->Auth->redirect());
            } else {
                $this->Session->setFlash('Error!  Invalid username or password, try again.');
            }
        }
    }
    
    /*
     * Logout is our main logout routine
     */
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
            $this->Session->setFlash('Error!  Not logged in.', 'default', array(), 'auth');
        }
    }
    
    /*
     * Uses Auth to check the ACL to see if the user is allowed to perform any
     * actions in this controller
     */
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
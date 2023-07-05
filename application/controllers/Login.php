<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Login
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller .PHP
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Login extends CI_Controller {
    private $errorMessage;

  public function __construct()
  {
    parent::__construct();
    $this->load->model('client_model', 'clientModel', true);
    $this->errorMessage = array (
    "required" => 'Veuillez remplir le champ %s.'
		);
  }

  public function index() {
    $this->admin();
  }

  public function admin()
  {
		$data = array(
      'styleSheets' => ['login.css'],
      'title' => 'Login',
      'component' => 'login',
      'email' => 'admin',
      'password' =>'admin'
    );
		$this->load->view('login', $data);
  }

  public function utilisateur()
  {
		$data = array(
      'styleSheets' => ['login.css'],
      'title' => 'Login',
      'component' => 'login'
    );
		$this->load->view('login', $data);
  }

	public function authentification() {
    $this->form_validation->set_rules(
      "email", "Email", 
      "required", 
      $this->errorMessage 
    );
    $this->form_validation->set_rules(
      "password", "Mot de passe", 
      "required",
      $this->errorMessage
    );
    if($this->form_validation->run() == FALSE) {
       $this->index();
			
		}
    else {
      $name = $this->input->post("email");
      $pwd = $this->input->post("password");
			
      $data = array(
        "name" => $name
      );
      if($name =="admin" && $pwd == "admin") {
        $this->session->set_userdata('user', -1);
        redirect('admin'); 
      }
			else {
				$email = $this->input->post('email');
        $password = $this->input->post('password');
        $data = array(
          'email' => $email,
          'motdepasse' => $password
        );
        $id = $this->clientModel->auth($data);
        if($id > 0) {
          $this->session->set_userdata('user', $id);
          redirect('site/');
        }
        else {
          $this->session->set_flashdata("email", $email);
          $data = array(
            'styleSheets' => ['login.css'],
            'title' => 'Login',
            'component' => 'login',
            'email' => $email,
            'password' => '',
            'error' => 'Email ou mot de passe incorrect'
          );
          $this->load->view('login', $data);
        }
			}
    }
	}

  public function logout() {
    $idSession = $this->session->user; 
    $this->session->unset_userdata('user');
    if($idSession > 0) {
      redirect('login/utilisateur');
    }
    else {
      redirect('login/admin');
    }
  }
}	

/* End of file Login.php */
/* Location: ./application/controllers/Login.php */

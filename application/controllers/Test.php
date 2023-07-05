<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Test
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller TEST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Test extends CI_Controller
{
    
  public function __construct()
  {
    parent::__construct();
  }

  public function index()
  {
    $this->load->model("Fonction_model","fonction",true);
		
		$data['nom'] =$this->fonction->getNom();
		$this->load->view("index",$data);

  }
	public function testDatabaseConnection()
	{
    $this->load->database(); // Charger la bibliothèque de base de données

    // Vérifier la connexion à la base de données
    if ($this->db->conn_id) {
        echo "Connexion à la base de données établie avec succès.";
    } else {
        echo "Échec de la connexion à la base de données.";
    }
	}
	public function testfonction() 
	{
		
	}


}


/* End of file Test.php */
/* Location: ./application/controllers/Test.php */

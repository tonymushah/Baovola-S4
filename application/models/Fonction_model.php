<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model Fonction_model
 *
 * This Model for ...
 * 
 * @package		CodeIgniter
 * @category	Model
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Fonction_model extends CI_Model {

  // ------------------------------------------------------------------------

  public function __construct()
  {
    parent::__construct();
  }

  // ------------------------------------------------------------------------


  // ------------------------------------------------------------------------
  public function index()
  {
		
  }
	//test base 
	// public function getNom()
	// {
	// 	$sql = "select nom from test";
	// 	$query = $this->db->query($sql);
	// 	$result = $query->result(); 

	// 	return $result;
	// }

	public function getAllCategories() {
		$query = $this->db->get("categorie");
		return $query->result();
	}
	
	public function getAllProduits() {
		$sql = "SELECT a.idarticle, a.titre, a.description, a.prix_unitaire, a.quantite, a.DateAjout, p.nom, p.numero_tel
				FROM article AS a
				JOIN personne AS p ON a.idproprietaire = p.idPersonne";
		$query = $this->db->query($sql);
		$result = $query->result(); 
	
		return $result;
	}
	
	public function getAllProduitsByCategorie($idcategorie) {
		$sql = "SELECT da.*
				FROM detailarticle AS da
				JOIN articlecategorie AS ac ON da.idarticle = ac.idarticle
				WHERE ac.idcategorie = ".$idcategorie;
		$query = $this->db->query($sql);
		$result = $query->result(); 
	
		return $result;
	}
	
	public function rechercheProduit($produit) {
		$sql = "SELECT *
				FROM detailarticle
				WHERE titre = '".$produit."'";
		$query = $this->db->query($sql);
		$result = $query->result(); 
	
		return $result;
	}
	
	public function rechercheMultiCategorie($categorie1, $categorie2) {
		$sql = "SELECT da.*
				FROM detailarticle AS da
				JOIN articlecategorie AS ac ON da.idarticle = ac.idarticle
				WHERE ac.idcategorie = ".$categorie1." OR ac.idcategorie = ".$categorie2;
		$query = $this->db->query($sql);
		$result = $query->result(); 
	
		return $result;
	}
	
	// $condition = array('email' => ?, 'password' => ?)
	public function auth($condition) {
		$query = $this->db->get_where('Personne', $condition);
		$auth = $query->result();
	
		if(count($auth) == 0) {
		  return -1;
		}
		return $auth[0]->idutilisateur;
	  }
	
	  public function inscrire($data) {
		$query = $this->db->insert('Personne', $data);
		if($this->db->affected_rows() == 1) {
		  return TRUE;
		}
		return FALSE;
	  }
	
  // ------------------------------------------------------------------------

}

/* End of file Fonction_model.php */
/* Location: ./application/models/Fonction_model.php */

<?php
defined('BASEPATH') or exit('No direct script access allowed');


/**
 *
 * Controller ProduitsControllers
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller CI
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class ProduitsControllers extends CI_Controller
{
    
  public function __construct()
  {
    parent::__construct();
		$this->load->model('Fonction_model');
  }

	public function index()
	{
			// Obtenir toutes les catégories
			$data['categories'] = $this->Fonction_model->getAllCategories();

			// Obtenir tous les produits
			$data['produits'] = $this->Fonction_model->getAllProduits();

			// Charger la vue correspondante
			$this->load->view('produits_view', $data);
	}

	public function produitsByCategorie($idcategorie)
	{
			// Obtenir les produits par catégorie
			$data['produits'] = $this->Fonction_model->getAllProduitsByCategorie($idcategorie);

			// Charger la vue correspondante
			$this->load->view('produits_view', $data);
	}

	public function rechercheProduit($produit)
	{
			// Rechercher un produit spécifique
			$data['produits'] = $this->Fonction_model->rechercheProduit($produit);

			// Charger la vue correspondante
			$this->load->view('produits_view', $data);
	}

	public function rechercheMultiCategorie()
	{
			$categories = [1, 2, 3];

			// Rechercher des produits pour plusieurs catégories
			$data['produits'] = $this->Fonction_model->rechercheMultiCategorieTableau($categories);

			// Charger la vue correspondante
			$this->load->view('produits_view', $data);
	}

}


/* End of file ProduitsControllers.php */
/* Location: ./application/controllers/ProduitsControllers.php */

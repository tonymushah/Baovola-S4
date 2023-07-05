<!DOCTYPE html>
<html>
<head>
    <title>Liste des produits</title>
</head>
<body>
    <h1>Liste des produits</h1>

    <!-- Afficher toutes les catégories -->
    <h2>Catégories :</h2>
    <ul>
        <?php foreach ($categories as $categorie) : ?>
            <li><?php echo $categorie->nom; ?></li>
        <?php endforeach; ?>
    </ul>

    <!-- Afficher tous les produits -->
    <h2>Tous les produits :</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Description</th>
                <th>Prix unitaire</th>
                <th>Quantité</th>
				<th>Photos</th>
                <th>Date d'ajout</th>
                <th>Nom du propriétaire</th>
                <th>Numéro de téléphone du propriétaire</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($produits as $produit) : ?>
                <tr>
                    <td><?php echo $produit->idarticle; ?></td>
                    <td><?php echo $produit->titre; ?></td>
                    <td><?php echo $produit->description; ?></td>
                    <td><?php echo $produit->prix_unitaire; ?></td>
                    <td><?php echo $produit->quantite; ?></td>
					<td><img src="<?php echo base_url('assets/image/' . $produit->photo_path); ?>"></td>
                    <td><?php echo date("Y-m-d H:i:s", strtotime($produit->dateajout)); ?></td>
                    <td><?php echo $produit->nom; ?></td>
                    <td><?php echo $produit->numero_tel; ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>

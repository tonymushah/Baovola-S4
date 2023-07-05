CREATE EXTENSION IF NOT EXISTS "uuid-ossp";  

create type ENUM_Sexe as ENUM('Homme', 'Femme');

create table MOD_Personne(
	id varchar(50) primary key default uuid_generate_v4(),
	nom varchar(50) not null,
	prenom varchar(50) not null,
	numero_tel int not null,
	cin varchar(50) not null,
	Domicile varchar(50),
	genre ENUM_Sexe not null,	
	mot_de_passe varchar(256) not null,
	email varchar(256)
);

create table MOD_Categorie(
	id varchar(50) primary key default uuid_generate_v4(),
	nom varchar(50) not null
);

create type ENUM_Status_Article as ENUM ('Dispo', 'Non_dispo');

create table MOD_Article(
	id varchar(50) primary key default uuid_generate_v4(),
	nom varchar(50) not null,
	personne_id varchar(50),
	prix_unitaire int,
	quantite int,
	DateAjout timestamp,
	description text,
	status ENUM_Status_Article,
	id varchar(50),
	foreign key(id) references MOD_Categorie(id)
);

create table MOD_Article_Image(
	id varchar(50) primary key default uuid_generate_v4(),
	path_ varchar(256),
	article_id varchar(50)
);

create type ENUM_Status_Ls_Dem as ENUM ('Confirme', 'Annulee');

create table MOD_Liste_Demande(
	id varchar(50) primary key default uuid_generate_v4(),
	personne_id varchar(50),
	article_id varchar(50),
	status ENUM_Status_Ls_Dem
);

--view maka produits par MOD_Categorie
create database base;
\c base;

create type ENUM_Sexe as ENUM('Homme', 'Femme');

CREATE TABLE personne(
    idPersonne serial primary key, 
    nom VARCHAR(45),
    prenom VARCHAR(45),
    numero_tel int not null,
	cin varchar(50) not null,
	Domicile varchar(50),
	genre ENUM_Sexe not null,	
	mot_de_passe varchar(256) not null,
	email varchar(256)
);

CREATE TABLE categorie(
    idcategorie serial  primary key,
    nom VARCHAR(50)
);

create type ENUM_Status_Article as ENUM ('Dispo', 'Non_dispo');

CREATE TABLE article(
	idarticle serial primary key,
	idproprietaire serial,
	titre VARCHAR(45),
	description text,
	prix_unitaire double precision,
	status ENUM_Status_Article,
	quantite int,
	DateAjout timestamp,
	foreign key(idproprietaire) references personne(idPersonne)
);

CREATE TABLE photoarticle (
	idphoto serial primary key, 
	idarticle serial,
	photo_path VARCHAR(100),
	foreign key(idarticle) references article(idarticle)
);

CREATE TABLE articlecategorie (
	idarticle serial,
	idcategorie serial,
	foreign key(idarticle) references article(idarticle),
	foreign key(idcategorie) references categorie(idcategorie)
);
create type ENUM_Status_Ls_Dem as ENUM ('Confirme', 'Annulee');

create table listeDemande(
	idliste serial primary key,
	idPersonne serial,
	idarticle serial,
	status ENUM_Status_Ls_Dem,
	foreign key(idPersonne) references personne(idPersonne),
	foreign key(idarticle) references article(idarticle)
);
INSERT INTO personne (nom, prenom, numero_tel, cin, Domicile, genre, mot_de_passe, email)
VALUES ('Doe', 'John', 123456789, '1234567890', '123 Street', 'Homme', 'motdepasse123', 'john.doe@example.com');

INSERT INTO personne (nom, prenom, numero_tel, cin, Domicile, genre, mot_de_passe, email)
VALUES ('Smith', 'Jane', 987654321, '0987654321', '456 Avenue', 'Femme', 'password456', 'jane.smith@example.com');

INSERT INTO categorie (nom)
VALUES ('Vêtements');

INSERT INTO categorie (nom)
VALUES ('Electronique');

INSERT INTO article (idproprietaire, titre, description, prix_unitaire, status, quantite, DateAjout)
VALUES (1, 'Chemise', 'Chemise à manches longues', 29.99, 'Dispo', 10, NOW());

INSERT INTO article (idproprietaire, titre, description, prix_unitaire, status, quantite, DateAjout)
VALUES (2, 'Téléphone', 'Smartphone dernier cri', 599.99, 'Dispo', 5, NOW());

INSERT INTO photoarticle (idarticle, photo_path)
VALUES (1, 'chemise.jpg');

INSERT INTO photoarticle (idarticle, photo_path)
VALUES (2, 'telephone.jpg');

INSERT INTO articlecategorie (idarticle, idcategorie)
VALUES (1, 1);

INSERT INTO articlecategorie (idarticle, idcategorie)
VALUES (2, 2);

INSERT INTO listeDemande (idPersonne, idarticle, status)
VALUES (2, 1, 'Confirme');

INSERT INTO listeDemande (idPersonne, idarticle, status)
VALUES (1, 2, 'Annulee');


--getAllproduits
select article.idarticle, titre, description, prix_unitaire, quantite, DateAjout, p.nom, p.numero_tel from article 
join photoarticle as pa on article.idarticle = pa.idarticle;

--getAllProduitsByCategorie
select * from detailarticle join articlecategorie as ac on article.idarticle = ac.idarticle where idcategorie=1;

--view detailarticle
CREATE VIEW detailarticle AS 
SELECT article.idarticle, titre, description, prix_unitaire, quantite, DateAjout, article.idproprietaire, p.nom, p.numero_tel
FROM article
JOIN personne AS p ON article.idproprietaire = p.idPersonne
JOIN photoarticle AS pa ON article.idarticle = pa.idarticle;

--recherche par champ
select * from detailarticle where titre=domino;

--recherche multi categorie 
select * from detailarticle join articlecategorie as ac on article.idarticle = ac.idarticle where idcategorie=1 and idcategorie=2;

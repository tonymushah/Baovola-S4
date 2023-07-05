CREATE DATABASE takalo;
USE takalo;

CREATE TABLE utilisateur(
    idutilisateur INTEGER auto_increment, 
    nom VARCHAR(45),
    prenom VARCHAR(45),
    email VARCHAR(45) ,
    motdepasse VARCHAR(45),
    primary key (idutilisateur)
);

-- insertion utilisateur
INSERT INTO utilisateur VALUES("","ionisoa","ionisoa","ionisoa@gmail.com","1234");
INSERT INTO utilisateur VALUES("","sarobidy","bidy","sarobidy@gmail.com","456");
INSERT INTO utilisateur VALUES("","mialisoa","mu","mialisoa@gmail.com","789");


CREATE TABLE categorie(
    idcategorie INTEGER auto_increment,
    nom VARCHAR(50),
    primary key (idcategorie)
);

-- insertion categorie
INSERT INTO categorie VALUES("","Jeux");
INSERT INTO categorie VALUES("","vetement");
INSERT INTO categorie VALUES("","technologie");
INSERT INTO categorie VALUES("","art");


CREATE TABLE objet(
	idobjet INTEGER auto_increment,
	idproprietaire INTEGER,
	titre VARCHAR(45),
	description VARCHAR(45),
	prix DOUBLE,
	primary key(idobjet),
	foreign key(idproprietaire) references utilisateur(idutilisateur)
);

----insertion objet
insert into objet values("",1,"carte","C'est un jeu qui se joue en societe avec des cartes.",2000.0);
insert into objet values("",2,"domino","C'est un jeu de hasard mais aussi de strategie.",5000.0);
insert into objet values("",3,"Jeu de hasard","C'est un jeu où seul la chance qui compte.",6000.0);
insert into objet values("",1,"echec","C'est un jeu de strategie qui se joue à deux.",15000.0);
insert into objet values("",3,"Jeu de lettre","C'est un jeu de societe dont le but est la composition de mots à partir des lettres.",20000.0);
insert into objet values("",2,"telephone","C'est un appareil electronique permettant specialiement de communiquer.",150000.0);
insert into objet values("",3,"ordinateur","C'est un systeme de traitement d'information programmable.",20000000.0);
insert into objet values("",1,"robot","C'est un dispositif mecatronique conçu poiur accomplir des tâches automatiquements.",20000.0);
insert into objet values("",2,"appareil virtuel","C'est une technologie permettant de plonger dans un monde virtuel.",20000.0);
insert into objet values("",2,"sculpture","C'est un art de creer des formes en trois dimension.",1600000.0);
insert into objet values("",3,"dessin","C'est un art de representer des objets par des moyens graphiques.",10000.0);
insert into objet values("",2,"jeans","C'est un pantalon tres style.",10000.0);
insert into objet values("",3,"veste","C'est un vetements à manche longue.",2000.0);
insert into objet values("",1,"chemise","C'est un vetement qui couvre le buste et les bras .",15000.0);

-- typephoto 0 izy principale de 1 izy tsotra
CREATE TABLE photoobjet (
	idphoto INTEGER auto_increment,
	idobjet INTEGER,
	photo VARCHAR(100),
	typephoto INTEGER,
	primary key(idphoto),
	foreign key(idobjet) references objet(idobjet)
);

---insertion photoobjet
insert into photoobjet values("",1,"carte2.jpg",1);
insert into photoobjet values("",1,"carte1.jpg",0);
insert into photoobjet values("",2,"dee1.jpg",1);
insert into photoobjet values("",2,"dee.jpg",0);
insert into photoobjet values("",3,"hasard.jpg",1);
insert into photoobjet values("",3,"hasard1.jpg",0);
insert into photoobjet values("",4,"echec.jpg",1);
insert into photoobjet values("",4,"echec1.jpg",0);
insert into photoobjet values("",5,"lettre1.jpg",1);
insert into photoobjet values("",5,"lettre2.jpg",0);
insert into photoobjet values("",6,"telephone.jpg",1);
insert into photoobjet values("",6,"telephone1.jpg",0);
insert into photoobjet values("",7,"ordinateur.jpg",1);
insert into photoobjet values("",7,"ordinateur1.jpg",0);
insert into photoobjet values("",8,"robot1.jpg",1);
insert into photoobjet values("",8,"robot.jpg",0);
insert into photoobjet values("",9,"virtuel1.jpg",1);
insert into photoobjet values("",9,"virtuel.jpg",0);
insert into photoobjet values("",10,"sculpture1.jpg",1);
insert into photoobjet values("",10,"sculpture2.jpg",0);
insert into photoobjet values("",11,"dessin2.jpg",1);
insert into photoobjet values("",11,"dessin1.jpg",0);
insert into photoobjet values("",12,"jean.jpg",1);
insert into photoobjet values("",12,"jean1.jpg",0);
insert into photoobjet values("",13,"veste1.jpg",1);
insert into photoobjet values("",13,"veste.jpg",0);
insert into photoobjet values("",14,"chemise.jpg",1);
insert into photoobjet values("",14,"chemise2.jpg",0);



---create table objetcategorie
CREATE TABLE objetcategorie (
	idobjet INTEGER,
	idcategorie INTEGER,
	foreign key(idobjet) references objet(idobjet),
	foreign key(idcategorie) references categorie(idcategorie)
);

----insertion objetcategorie
insert into objetcategorie values(1,1);
insert into objetcategorie values(2,1);
insert into objetcategorie values(3,1);
insert into objetcategorie values(4,1);
insert into objetcategorie values(5,1);
insert into objetcategorie values(6,3);
insert into objetcategorie values(7,3);
insert into objetcategorie values(8,3);
insert into objetcategorie values(9,3);
insert into objetcategorie values(10,4);
insert into objetcategorie values(11,4);
insert into objetcategorie values(12,2);
insert into objetcategorie values(13,2);
insert into objetcategorie values(14,2);

----proposition
CREATE TABLE proposition(
	idproposition INTEGER auto_increment,
	idsender INTEGER,
	idobjetsender INTEGER,
	idreceiver INTEGER,
	idobjetreceiver INTEGER,
	jour TIMESTAMP,
	statut INTEGER,
	primary key(idproposition),
	foreign key(idsender) REFERENCES utilisateur(idUtilisateur),
	foreign key(idobjetsender) REFERENCES objet(idobjet),
	foreign key(idreceiver) REFERENCES utilisateur(idUtilisateur),
	foreign key(idobjetreceiver) REFERENCES objet(idobjet)
);


-- insertion proposition satut 0 raha mbola miandry acceptation, -5 raha mbola tsy misy , 5 ref mis
insert into proposition values("",1,1,2,2,"2023-01-05 22:35:00",0);
insert into proposition values("",1,7,3,9,"2023-02-07 12:20:10",0);
insert into proposition values("",2,14,3,13,"2023-02-04 10:35:00",-5);
insert into proposition values("",1,6,3,7,"2023-10-07 12:20:10",5);
insert into proposition values("",2,10,1,11,"2023-12-07 10:20:10",0);


----Historique
CREATE TABLE historique(
	idhistorique INTEGER auto_increment,
	idobjet INTEGER,
	idproprietaire INTEGER,
	debut TIMESTAMP,
	primary key(idhistorique),
	foreign key(idobjet) references objet(idobjet),
	foreign key(idproprietaire) references utilisateur(idutilisateur)
);

----insertion historique
insert into historique values("",1,1,"2023-01-05 22:35:00");
insert into historique values("",2,2,"2023-02-08 22:35:00");
insert into historique values("",3,3,"2023-02-07 12:20:10");
insert into historique values("",1,1,"2023-01-25 11:30:00");

insert into historique values("",5,3,"2023-02-04 10:35:00");


-----view detailshistorique
CREATE VIEW detailshistorique as
select historique.debut, historique.idhistorique,objet.idobjet ,utilisateur.idutilisateur, utilisateur.nom as proprietere
from historique
join utilisateur on (historique.idproprietaire=utilisateur.idutilisateur)
join objet on (historique.idobjet=objet.idobjet);

--view detailobjet
create view detailobjet as 
select objet.idobjet, titre, description, prix, idproprietaire, u.nom from objet 
join utilisateur as u on idproprietaire=u.idutilisateur 
join photoobjet as p on objet.idobjet=p.idobjet
where p.typephoto = 1;

-- view detailsproposition
create view detailsproposition as
select p.jour, p.idproposition, p.idsender, us.nom as sender, p.idreceiver, ur.nom as receiver, os.titre as objetsender, o2.titre as objetreceiver, p.statut
from proposition as p
join utilisateur as us on idsender=us.idutilisateur  
join utilisateur as ur on idreceiver = ur.idutilisateur 
join objet as os on idobjetsender = os.idobjet
join objet as o2 on idobjetreceiver = o2.idobjet;

-- view details 
create or replace view detailObjetCategorie as
select objetcategorie.idcategorie, objetcategorie.idobjet ,obj.titre from objetcategorie 
join categorie as categ on objetcategorie.idcategorie=categ.idcategorie 
join objet as obj on objetcategorie.idobjet=obj.idobjet;

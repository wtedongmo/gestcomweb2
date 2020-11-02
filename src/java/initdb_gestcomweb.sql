-- insert into sexe values (1, 'MAXCULIN'), (2, 'FEMININ'), (3, 'INCONNU'), (4, 'NON APPLICABLE'); 

-- insert into statutmatrimonial values (1, 'MARIE'), (2, 'CELIBATAIRE'), (3, 'INCONNU'), (4, 'NON APPLICABLE'); 

-- insert into yesno values (1, 'OUI'), (2, 'NON'), (3, 'INCONNU'); 

insert into typeproduit(code,libelle) values (1, 'ARTICLE'), (2, 'SERVICE'), (3, 'INCONNU'); 

insert into etatticket(code,libelle) values(1, 'RDV'), (2, 'CONFIRME'), (3, 'REALISE'); 

insert into categoriefacture(code,libelle) values (1, 'FACTURE'), (2, 'DEVIS'), (3, 'COMMANDE');

insert into typefacture(code,libelle) values (1, 'VENTE'), (2, 'ACHAT'), (3, 'DEPOT'), (4, 'TRANSFERT ENTREE'), (5, 'TRANSFERT SORTIE');

insert into modepaiement(code,libelle) values(1, 'ESPECE'), (2, 'CHEQUE'), (3, 'VIREMENT');

insert into typepaiement(code,libelle) values(1, 'CLIENT'), (2, 'FOURNISSEUR');

insert into categoriepersonne(code,libelle) values(1, 'Technicien'), (2, 'Autres');

insert into categorieproduit(code,libelle, taux_tva, stockable) values(1, 'Article', 0.1925, true), (2, 'Service', 0, false);

insert into servicetravail(code,libelle) values(1, 'Labo'), (2, 'Comptabilité'), (3, 'Administration');

insert into modepriserdv(code,libelle) values(1, 'Appel'), (2, 'SMS'), (3, 'Mail'), (4, 'Presence') ;

insert into typecompte(code,libelle) values(1, 'CLIENT'), (2, 'FOURNISSEUR');

-- ---------------------------------------------------------

DROP TABLE IF EXISTS vuepaiement;
DROP VIEW IF EXISTS vuepaiement;
create VIEW vuepaiement AS select pm.code AS code,p.code AS code_client,p.nom_prenom AS nom_prenom_client,ifnull(pm.reference, concat(pm.code, date_format(pm.date_paiement,'yyyy/MM/dd'))) as reference, pm.objet, pm.entree, pm.sortie, pm.date_paiement AS date_paiement,pm.compte_client AS compte_client,pm.compte_fournisseur AS compte_fournisseur, pm.code_caisse,cpc.libelle AS libelle_client from (((paiement pm join comptepersonne cpc on((pm.compte_client = cpc.code))) join personne p on((p.code = cpc.code_personne))));

DROP TABLE IF EXISTS vueumulpaiementbalance;
DROP VIEW IF EXISTS vueumulpaiementbalance;
create VIEW vueumulpaiementbalance AS select pm.compte_client AS compte_client,p.nom_prenom AS nom_prenom_client,pm.date_paiement,  pm.code_caisse, count(pm.code) AS nombre_paiement,sum(pm.entree) AS cumul_entree,sum(pm.sortie) AS cumul_sortie 
from (((paiement pm join comptepersonne cpc on((pm.compte_client = cpc.code))) join personne p on((p.code = cpc.code_personne)))) group by pm.compte_client,p.nom_prenom, pm.date_paiement, pm.code_caisse;

DROP TABLE IF EXISTS vuedetailfacture;
DROP VIEW IF EXISTS vuedetailfacture;
create VIEW vuedetailfacture AS select f.code,p.code AS code_client,p.nom_prenom AS nom_prenom_client,(concat(f.code,concat(f.rubrique_facture,date_format(f.date_facture,'%m/%Y')))) as reference, f.objet, f.date_facture, f.compte_client, f.compte_fournisseur, cpc.libelle AS libelle_client, df.code as code_detail, df.code_produit, pd.libelle as libelle_produit, df.quantite, df.prix_unitaire, df.montant_ht, df.taux_tva, df.montant_tva, df.montant_total, df.date_debut, df.date_fin_prevu, df.code_facture, df.code as code_detail
from (((facture f 
join detailfacture df on f.code=df.code_facture 
join comptepersonne cpc on((f.compte_client = cpc.code))) 
join personne p on((p.code = cpc.code_personne)))
join produit pd on df.code_produit=pd.code);

DROP TABLE IF EXISTS vuefacture;
DROP VIEW IF EXISTS vuefacture;
create VIEW vuefacture AS select f.code,p.code AS code_client,p.nom_prenom AS nom_prenom_client, (concat(f.code,concat(f.rubrique_facture,date_format(f.date_facture,'%m/%Y')))) as reference, f.objet, f.date_facture, f.compte_client, f.compte_fournisseur, cpc.libelle AS libelle_client, sum(df.montant_ht) as total_ht, sum(df.montant_tva) as total_tva, sum(df.montant_total) as total_ttc 
from (((facture f 
join detailfacture df on f.code=df.code_facture 
join comptepersonne cpc on((f.compte_client = cpc.code))) 
join personne p on((p.code = cpc.code_personne)))) group by f.code,p.code,p.nom_prenom, (concat(f.code,concat(f.rubrique_facture,date_format(f.date_facture,'%m/%Y')))), f.objet, f.date_facture, f.compte_client, f.compte_fournisseur, cpc.libelle;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.ReadOnly;
import com.tsoft.appli.gestcom.paiement.model.Paiementfacture;
import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import com.tsoft.annotations.form.Select;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.appli.gestcom.facture.service.FactureService;
import com.tsoft.dao.Dao;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Formula;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name = "facture")
@Dao(FactureService.class)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "rubrique_facture",
        discriminatorType = DiscriminatorType.STRING
)
public class Facture extends LifeCycleEntity {
    
    @NotNull
    @JoinColumn(name = "compte_client", referencedColumnName = "code")
    @ManyToOne
    @Label("Client")
    private Comptepersonne compte_client;
//    @Size(max = 25)
    @Formula("(concat(code,concat(rubrique_facture,date_format(date_facture,'%m/%Y'))))")
//    @Column(name = "reference")
    private String reference;
    @Size(max = 100)
    @Libelle
    @Column(name = "objet")
    private String objet;
    
    @Column(name = "date_facture")
    @Label("Date")
    @Temporal(TemporalType.DATE)
    private Date date_facture;
    @Select
    @NotNull
    @JoinColumn(name = "categorie_facture", referencedColumnName = "code")
    @ManyToOne
    @Label("Categorie")
    private Categoriefacture categorie_facture;
    
    @Select
    @JoinColumn(name = "code_liste_prix", referencedColumnName = "code")
    @ManyToOne
    private Listeprix code_liste_prix;
    @JoinColumn(name = "compte_fournisseur", referencedColumnName = "code")
    @ManyToOne
    @Label("Fournisseur")
    private Comptepersonne compte_fournisseur;
    @Column(name = "taux_reduction")
    private Double taux_reduction;
    
//    @Column(name = "total_reduction")
    @Label("Total Reduction")
    @Formula("(select sum(df.quantite*df.prix_unitaire) * if(taux_reduction>1, taux_reduction/100, taux_reduction) "
            + "from Facture f join Detailfacture df on f.code=df.code_facture where f.code=code)")
    private Double total_reduction;
    
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
//    @ReadOnly
    @Label("Total HT")
    @Formula("(select sum(df.quantite*df.prix_unitaire) from Facture f join Detailfacture df on f.code=df.code_facture "
            + "  where f.code=code)")
//    @Column(name = "total_ht")
    private Double total_ht;
//    @ReadOnly
    @Label("Total TVA")
    @Formula("(select sum(df.quantite*df.prix_unitaire*df.taux_tva) from Facture f join Detailfacture df on f.code=df.code_facture "
            + "  where f.code=code)")
//    @Column(name = "total_tva")
    private Double total_tva;
//    @ReadOnly
    @Label("Total TTC")
//    @Formula("total_ht+total_tva")
    @Formula("(select sum(df.quantite*df.prix_unitaire*(1+df.taux_tva)) * (1-if(taux_reduction>1, taux_reduction/100, taux_reduction))"
            + "from Facture f join Detailfacture df on f.code=df.code_facture where f.code=code)")
//    @Column(name = "total_ttc")
    private Double total_ttc;
    @ReadOnly
    @Column(name = "total_regler")
    private Double total_regler;
    @ReadOnly
    @Column(name = "reste_a_payer")
    private Double reste_a_payer;
    @ReadOnly
    @SpelValue("compte_client.solde")
    @Column(name = "solde_compte_client")
    private Double solde_compte_client;
    @Column(name = "code_modele_messagerie")
    private Integer code_modele_messagerie;
    @ReadOnly
    @Column(name = "valide")
    private Character valide;
    
//    @OneToMany(mappedBy = "code_facture")
//    @Label("Detail")
//    private List<Detailfacture> detailfactureCollection=new ArrayList();

    @OneToMany(mappedBy = "code_facture")
    @Label("Paiement")
    private List<Paiementfacture> paiementfactureCollection=new ArrayList();


    public Facture() {
    }

    public Facture(Integer code) {
        this.code = code;
    }

    public Comptepersonne getCompte_client() {
        return compte_client;
    }

    public void setCompte_client(Comptepersonne compte_client) {
        this.compte_client = compte_client;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public Date getDate_facture() {
        return date_facture;
    }

    public void setDate_facture(Date date_facture) {
        this.date_facture = date_facture;
    }

    public Categoriefacture getCategorie_facture() {
        return categorie_facture;
    }

    public void setCategorie_facture(Categoriefacture categorie_facture) {
        this.categorie_facture = categorie_facture;
    }
    
    public Listeprix getCode_liste_prix() {
        return code_liste_prix;
    }

    public void setCode_liste_prix(Listeprix code_liste_prix) {
        this.code_liste_prix = code_liste_prix;
    }

    public Comptepersonne getCompte_fournisseur() {
        return compte_fournisseur;
    }

    public void setCompte_fournisseur(Comptepersonne compte_fournisseur) {
        this.compte_fournisseur = compte_fournisseur;
    }

    public Double getTaux_reduction() {
        return taux_reduction;
    }

    public void setTaux_reduction(Double taux_reduction) {
        this.taux_reduction = taux_reduction;
    }

    public Double getTotal_reduction() {
        return total_reduction;
    }

    public void setTotal_reduction(Double total_reduction) {
        this.total_reduction = total_reduction;
    }

    public Double getTotal_ht() {
        return total_ht;
    }

    public void setTotal_ht(Double total_ht) {
        this.total_ht = total_ht;
    }

    public Double getTotal_tva() {
        return total_tva;
    }

    public void setTotal_tva(Double total_tva) {
        this.total_tva = total_tva;
    }

    public Double getTotal_ttc() {
        return total_ttc;
    }

    public void setTotal_ttc(Double total_ttc) {
        this.total_ttc = total_ttc;
    }

    public Double getTotal_regler() {
        return total_regler;
    }

    public void setTotal_regler(Double total_regler) {
        this.total_regler = total_regler;
    }

    public Double getReste_a_payer() {
        return reste_a_payer;
    }

    public void setReste_a_payer(Double reste_a_payer) {
        this.reste_a_payer = reste_a_payer;
    }

    public Double getSolde_compte_client() {
        return solde_compte_client;
    }

    public void setSolde_compte_client(Double solde_compte_client) {
        this.solde_compte_client = solde_compte_client;
    }

    public Integer getCode_modele_messagerie() {
        return code_modele_messagerie;
    }

    public void setCode_modele_messagerie(Integer code_modele_messagerie) {
        this.code_modele_messagerie = code_modele_messagerie;
    }

//    public List<Detailfacture> getDetailfactureCollection() {
//        return detailfactureCollection;
//    }
//
//    public void setDetailfactureCollection(List<Detailfacture> detailfactureCollection) {
//        this.detailfactureCollection = detailfactureCollection;
//    }

    public List<Paiementfacture> getPaiementfactureCollection() {
        return paiementfactureCollection;
    }

    public void setPaiementfactureCollection(List<Paiementfacture> paiementfactureCollection) {
        this.paiementfactureCollection = paiementfactureCollection;
    }

    public Character getValide() {
        return valide;
    }

    public void setValide(Character valide) {
        this.valide = valide;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.facture.model.Facture[ code=" + code + " ]";
    }
    
}

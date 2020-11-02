/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.produit.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.appli.gestcom.facture.model.Detaillisteprix;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "produit")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "type_produit",
        discriminatorType = DiscriminatorType.STRING
)
public class Produit extends LifeCycleEntity {
    
    @NotNull
    @Libelle
    @Size(max = 100)
    @Label("Designation")
    @Column(name = "libelle")
    private String libelle;
//    @Size(max = 10)
//    @Column(name = "libelle_reduit")
//    private String libelle_reduit;
//    @Lob
//    @Size(max = 65535)
//    @Column(name = "description")
//    private String description;
    
    @Label("Prix")
    @Column(name = "prix_vente")
    private Double prix_vente;
//    @Column(name = "est_taxable")
//    private Boolean taxable;
//    @OneToMany(mappedBy = "code_produit")
//    private List<Detailfacture> detailFactureCollection = new ArrayList();

    @Label("Detail listeprix")
    @OneToMany(mappedBy = "code_produit")
    private List<Detaillisteprix> detailListePrixCollection = new ArrayList();

    
    public Produit() {
    }

    public Produit(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        this.description = description;
//    }

//        public Categorieproduit getCategorie_produit() {
//        return categorie_produit;
//    }
//
//    public void setCategorie_produit(Categorieproduit categorieProduit) {
//        this.categorie_produit = categorieProduit;
//    }

    public Double getPrix_vente() {
        return prix_vente;
    }

//    public String getLibelle_reduit() {
//        return libelle_reduit;
//    }
//
//    public void setLibelle_reduit(String libelle_reduit) {
//        this.libelle_reduit = libelle_reduit;
//    }

//    public double getTaux_tva() {
//        return taux_tva;
//    }
//
//    public void setTaux_tva(double taux_tva) {
//        this.taux_tva = taux_tva;
//    }

    public void setPrix_vente(Double prix_vente) {
        this.prix_vente = prix_vente;
    }

//    public Boolean getTaxable() {
//        return taxable;
//    }
//
//    public void setTaxable(Boolean taxable) {
//        this.taxable = taxable;
//    }

//    public List<Detailfacture> getDetailFactureCollection() {
//        return detailFactureCollection;
//    }
//
//    public void setDetailFactureCollection(List<Detailfacture> detailFactureCollection) {
//        this.detailFactureCollection = detailFactureCollection;
//    }

    public List<Detaillisteprix> getDetailListePrixCollection() {
        return detailListePrixCollection;
    }

    public void setDetailListePrixCollection(List<Detaillisteprix> detailListePrixCollection) {
        this.detailListePrixCollection = detailListePrixCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.Produit[ code=" + code + " ]";
    }
    
}

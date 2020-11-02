/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.appli.gestcom.produit.model.Produit;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.NotReadOnly;
import com.tsoft.annotations.form.OnChange;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.appli.gestcom.facture.service.DetailfactureService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name="detailfacture")
@Dao(DetailfactureService.class)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "type_detailf",
        discriminatorType = DiscriminatorType.STRING
)
public class Detailfacture extends LifeCycleEntity {
    
    @NotNull
    @Libelle
    @OnChange
    @JoinColumn(name = "code_produit", referencedColumnName = "code")
    @Label("Produit")
    @ManyToOne
    private Produit code_produit;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "quantite")
    private Double quantite;
    @NotReadOnly
    @SpelValue("code_produit.prix_vente")
    @Column(name = "prix_unitaire")
    private Double prix_unitaire;
    @Column(name = "montant_ht")
    @SpelValue("prix_unitaire*quantite")
    private Double montant_ht;
    @NotReadOnly
    @Column(name = "taux_tva")
    @SpelValue("code_produit.taux_tva")
    private Double taux_tva;
//    @Column(name = "taux_reduction")
//    private Double taux_reduction;
    @Column(name = "montant_tva")
    @SpelValue("montant_ht*taux_tva")
    private Double montant_tva;
    @Column(name = "montant_total")
    @SpelValue("montant_tva+montant_ht")
    private Double montant_total;
    
    public Detailfacture() {
    }

    public Detailfacture(Integer code) {
        this.code = code;
    }

//    public Facture getCode_facture() {
//        return code_facture;
//    }
//
//    public void setCode_facture(Facture facture) {
//        this.code_facture = facture;
//    }

    public Produit getCode_produit() {
        return code_produit;
    }

    public void setCode_produit(Produit produit) {
        this.code_produit = produit;
    }

    public Double getQuantite() {
        return quantite;
    }

    public void setQuantite(Double quantite) {
        this.quantite = quantite;
    }

    public Double getPrix_unitaire() {
        return prix_unitaire;
    }

    public void setPrix_unitaire(Double prix_unitaire) {
        this.prix_unitaire = prix_unitaire;
    }

    public Double getMontant_ht() {
        return montant_ht;
    }

    public void setMontant_ht(Double montant_ht) {
        this.montant_ht = montant_ht;
    }

    public Double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(Double taux_tva) {
        this.taux_tva = taux_tva;
    }

    public Double getMontant_tva() {
        return montant_tva;
    }

    public void setMontant_tva(Double montant_tva) {
        this.montant_tva = montant_tva;
    }

    public Double getMontant_total() {
        return montant_total;
    }

    public void setMontant_total(Double montant_total) {
        this.montant_total = montant_total;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.model.DetailFacture[ code=" + code + " ]";
    }

}

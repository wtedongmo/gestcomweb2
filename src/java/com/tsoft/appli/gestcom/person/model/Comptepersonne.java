/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.appli.gestcom.paiement.model.Paiement;
import com.tsoft.appli.gestcom.facture.model.Facture;
import com.tsoft.appli.gestcom.person.service.ComptepersonneService;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.NotReadOnly;
import com.tsoft.annotations.form.OnChange;
import com.tsoft.annotations.form.ReadOnly;
import com.tsoft.annotations.form.Select;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.dao.Dao;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Formula;

/**
 *
 * @author TEDONGMO
 */
@Entity
@Dao(ComptepersonneService.class)
public class Comptepersonne extends LifeCycleEntity {

    @JoinColumn(name = "code_personne", referencedColumnName = "code")
    @ManyToOne
    //@JsonIgnore
    @OnChange
    @NotNull
    private Personne code_personne;
    
    @Column
    @Libelle
    @SpelValue("code_personne.nom_prenom")
    @NotReadOnly
    private String libelle;
    @Size(max = 20)
    @Column(name = "numero_compte")
    private String numero_compte;
    @Select
    @JoinColumn(name = "type_compte", referencedColumnName = "code")
    @ManyToOne
    private Typecompte type_compte;

//    @Select
//    @JoinColumn(name = "nature_compte", referencedColumnName = "code")
//    @ManyToOne
//    private Naturecompte nature_compte;

    @Column
    @ReadOnly
    private Double credit;
    @Column
    @ReadOnly
    private Double debit;
    @ReadOnly
    @SpelValue("credit-debit")
    private Double solde;

//    @Select
//    @JoinColumn(name = "categorie_personne", referencedColumnName = "code")
//    @ManyToOne
//    @SpelValue("code_personne.categorie_personne")
//    private Categoriepersonne categorie_personne;

    @OneToMany(mappedBy = "compte_client")
    private List<Paiement> paiementCleint = new ArrayList();

    @OneToMany(mappedBy = "compte_fournisseur")
    private List<Paiement> paiementFournis = new ArrayList();

    @OneToMany(mappedBy = "compte_client")
    private List<Facture> factureClient = new ArrayList();

    @OneToMany(mappedBy = "compte_fournisseur")
    private List<Facture> factureFournis = new ArrayList();

    public Personne getCode_personne() {
        return code_personne;
    }

    public void setCode_personne(Personne code_personne) {
        this.code_personne = code_personne;
    }

    public String getNumero_compte() {
        return numero_compte;
    }

    public void setNumero_compte(String numero_compte) {
        this.numero_compte = numero_compte;
    }
    
    public Typecompte getType_compte() {
        return type_compte;
    }

    public void setType_compte(Typecompte type_compte) {
        this.type_compte = type_compte;
    }

//    public Naturecompte getNature_compte() {
//        return nature_compte;
//    }
//
//    public void setNature_compte(Naturecompte nature_compte) {
//        this.nature_compte = nature_compte;
//    }

//    public Categoriepersonne getCategorie_personne() {
//        return categorie_personne;
//    }
//
//    public void setCategorie_personne(Categoriepersonne categorie_personne) {
//        this.categorie_personne = categorie_personne;
//    }
    
    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Double getCredit() {
        return credit;
    }

    public void setCredit(Double credit) {
        this.credit = credit;
    }

    public Double getDebit() {
        return debit;
    }

    public void setDebit(Double debit) {
        this.debit = debit;
    }

    public Double getSolde() {
        return solde;
    }

    public void setSolde(Double solde) {
        this.solde = solde;
    }

    public List<Paiement> getPaiementCleint() {
        return paiementCleint;
    }

    public void setPaiementCleint(List<Paiement> paiementCleint) {
        this.paiementCleint = paiementCleint;
    }

    public List<Paiement> getPaiementFournis() {
        return paiementFournis;
    }

    public void setPaiementFournis(List<Paiement> paiementFournis) {
        this.paiementFournis = paiementFournis;
    }

    public List<Facture> getFactureClient() {
        return factureClient;
    }

    public void setFactureClient(List<Facture> factureClient) {
        this.factureClient = factureClient;
    }

    public List<Facture> getFactureFournis() {
        return factureFournis;
    }

    public void setFactureFournis(List<Facture> factureFournis) {
        this.factureFournis = factureFournis;
    }

    
}

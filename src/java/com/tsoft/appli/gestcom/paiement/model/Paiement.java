/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.paiement.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.ReadOnly;
import com.tsoft.appli.gestcom.facture.model.Facture;
import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.Select;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.appli.gestcom.paiement.service.PaiementService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.Formula;

/**
 *
 * @author User
 */
@Entity
@Table(name = "paiement")
@Dao(PaiementService.class)
public class Paiement extends LifeCycleEntity {
    
    @NotNull
    @JoinColumn(name = "compte_client", referencedColumnName = "code")
    @ManyToOne
    @Label("Client")
    private Comptepersonne compte_client;
    
    @Column(name = "date_paiement")
    @Temporal(TemporalType.DATE)
    private Date date_paiement;

//    @Select
//    @JoinColumn(name = "sens", referencedColumnName = "code")
//    @ManyToOne
//    private Senspaiement sens;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
//    @NotNull
    @Column(name = "entree")
    private Double entree;
//    @NotNull
    @Column(name = "sortie")
    private Double sortie;
    @Select
    @JoinColumn(name = "mode_paiement", referencedColumnName = "code")
    @ManyToOne
    private Modepaiement mode_paiement;
    @Select
    @JoinColumn(name = "type_paiement", referencedColumnName = "code")
    @ManyToOne
    private Typepaiement type_paiement;
    @JoinColumn(name = "compte_fournisseur", referencedColumnName = "code")
    @ManyToOne
    @Label("Fournisseur")
    private Comptepersonne compte_fournisseur;
    @Libelle
    @Column(name = "objet")
    private String objet;
//    @Size(max = 50)
    @SpelValue("concat(code, ' ', date_paiement)")
//    @Formula("(concat(code,date_format(date_paiement,'%m/%Y')))")
    @Column(name = "reference")
    private String reference;
    @ReadOnly
    @Column(name = "solde_compte_client")
    @SpelValue("compte_client.solde")
    private Double solde_compte_client;
    @JoinColumn(name = "code_facture", referencedColumnName = "code")
    @ManyToOne
    private Facture facture;
    @ReadOnly
    @JoinColumn(name = "code_caisse", referencedColumnName = "code")
    @ManyToOne
    private Caisse caisse;
    
    @ReadOnly
    @Column(name = "avoir")
    private Double avoir;
    @ReadOnly
    @Column(name = "valide")
    private Character valide;
    
    @OneToMany(mappedBy = "code_paiement")
    private List<Paiementfacture> paiementFacture=new ArrayList();

    public Paiement() {
    }

    public Comptepersonne getCompte_client() {
        return compte_client;
    }

    public void setCompte_client(Comptepersonne compte_client) {
        this.compte_client = compte_client;
    }

    public Date getDate_paiement() {
        return date_paiement;
    }

    public void setDate_paiement(Date date_paiement) {
        this.date_paiement = date_paiement;
    }

    public Double getEntree() {
        return entree;
    }

    public void setEntree(Double entree) {
        this.entree = entree;
    }
    
    public Double getSortie() {
        return sortie;
    }

    public void setSortie(Double sortie) {
        this.sortie = sortie;
    }
    
    public Comptepersonne getCompte_fournisseur() {
        return compte_fournisseur;
    }

    public void setCompte_fournisseur(Comptepersonne compte_fournisseur) {
        this.compte_fournisseur = compte_fournisseur;
    }

    public String getObjet() {
        return objet;
    }

    public void setObjet(String objet) {
        this.objet = objet;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Double getSolde_compte_client() {
        return solde_compte_client;
    }

    public void setSolde_compte_client(Double solde_compte_client) {
        this.solde_compte_client = solde_compte_client;
    }

//    public Senspaiement getSens() {
//        return sens;
//    }
//
//    public void setSens(Senspaiement sens) {
//        this.sens = sens;
//    }

    public Modepaiement getMode_paiement() {
        return mode_paiement;
    }

    public void setMode_paiement(Modepaiement mode_paiement) {
        this.mode_paiement = mode_paiement;
    }

    public Typepaiement getType_paiement() {
        return type_paiement;
    }

    public void setType_paiement(Typepaiement type_paiement) {
        this.type_paiement = type_paiement;
    }

    public Facture getFacture() {
        return facture;
    }

    public void setFacture(Facture facture) {
        this.facture = facture;
    }

    public Caisse getCaisse() {
        return caisse;
    }

    public void setCaisse(Caisse caisse) {
        this.caisse = caisse;
    }

    public Double getAvoir() {
        return avoir;
    }

    public void setAvoir(Double avoir) {
        this.avoir = avoir;
    }
    
    public Character getValide() {
        return valide;
    }

    public void setValide(Character valide) {
        this.valide = valide;
    }

    public List<Paiementfacture> getPaiementFacture() {
        return paiementFacture;
    }

    public void setPaiementFacture(List<Paiementfacture> paiementFacture) {
        this.paiementFacture = paiementFacture;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Paiement[ code=" + code + " ]";
    }
    
}

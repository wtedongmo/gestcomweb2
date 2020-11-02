/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.paiement.model;

import com.tsoft.appli.gestcom.facture.model.Facture;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "paiementfacture")
public class Paiementfacture extends LifeCycleEntity  {
   
    @JoinColumn(name = "code_paiement", referencedColumnName = "code")
    @ManyToOne
    private Paiement code_paiement;
    @JoinColumn(name = "code_facture", referencedColumnName = "code")
    @ManyToOne
    private Facture code_facture;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "montant_ttc_facture")
    private Double montant_ttc_facture;
    @Column(name = "montant_paiement")
    private Double montant_paiement;
    @Column(name = "montant_paiement_facture")
    private Double montant_paiement_facture;
    @Column(name = "reste_a_payer")
    private Double reste_a_payer;

    public Paiementfacture() {
    }

    public Paiementfacture(Integer code) {
        this.code = code;
    }

    public Paiement getCode_paiement() {
        return code_paiement;
    }

    public void setCode_paiement(Paiement code_paiement) {
        this.code_paiement = code_paiement;
    }

    public Facture getCode_facture() {
        return code_facture;
    }

    public void setCode_facture(Facture code_facture) {
        this.code_facture = code_facture;
    }
    
    public Double getMontant_ttc_facture() {
        return montant_ttc_facture;
    }

    public void setMontant_ttc_facture(Double montant_ttc_facture) {
        this.montant_ttc_facture = montant_ttc_facture;
    }

    public Double getMontant_paiement() {
        return montant_paiement;
    }

    public void setMontant_paiement(Double montant_paiement) {
        this.montant_paiement = montant_paiement;
    }

    public Double getMontant_paiement_facture() {
        return montant_paiement_facture;
    }

    public void setMontant_paiement_facture(Double montant_paiement_facture) {
        this.montant_paiement_facture = montant_paiement_facture;
    }

    public Double getReste_a_payer() {
        return reste_a_payer;
    }

    public void setReste_a_payer(Double reste_a_payer) {
        this.reste_a_payer = reste_a_payer;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Paiementfacture[ code=" + code + " ]";
    }
    
}

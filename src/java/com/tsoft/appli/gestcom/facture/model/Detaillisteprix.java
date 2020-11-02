/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.Select;
import com.tsoft.appli.gestcom.produit.model.Produit;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "detaillisteprix")
public class Detaillisteprix  extends LifeCycleEntity  {
    
    @Select
    @NotNull
    @JoinColumn(name = "code_liste_prix", referencedColumnName = "code")
    @ManyToOne
    private Listeprix code_liste_prix;
    @Libelle
    @NotNull
    @JoinColumn(name = "code_produit", referencedColumnName = "code")
    @ManyToOne
    private Produit code_produit;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "prix_achat")
    private Double prix_achat;
    @Column(name = "prix_vente")
    private Double prix_vente;

    
    public Detaillisteprix() {
    }

    public Detaillisteprix(Integer code) {
        this.code = code;
    }

    public Listeprix getCode_liste_prix() {
        return code_liste_prix;
    }

    public void setCode_liste_prix(Listeprix code_liste_prix) {
        this.code_liste_prix = code_liste_prix;
    }

    public Produit getCode_produit() {
        return code_produit;
    }

    public void setCode_produit(Produit code_produit) {
        this.code_produit = code_produit;
    }

    public Double getPrix_achat() {
        return prix_achat;
    }

    public void setPrix_achat(Double prix_achat) {
        this.prix_achat = prix_achat;
    }

    public Double getPrix_vente() {
        return prix_vente;
    }

    public void setPrix_vente(Double prix_vente) {
        this.prix_vente = prix_vente;
    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Detaillisteprix[ code=" + code + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.produit.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.NotReadOnly;
import com.tsoft.annotations.form.OnChange;
import com.tsoft.annotations.form.Select;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("ART")
public class Article extends Produit {
    
    @Column(name = "prix_achat")
    private Double prix_achat;
    @Column(name = "quantite")
    private Double quantite;
    
    @Select
    @OnChange
    @JoinColumn(name = "categorie_produit", referencedColumnName = "code")
    @ManyToOne
    @Label("Categorie")
    private CategorieArticle categorie_produit;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "taux_tva")
    @SpelValue("categorie_produit.taux_tva")
    @NotReadOnly
    private double taux_tva;
    
    public Article() {
    }

    public Article(Integer code) {
        this.code = code;
    }

    public Double getPrix_achat() {
        return prix_achat;
    }

    public void setPrix_achat(Double prix_achat) {
        this.prix_achat = prix_achat;
    }

    public Double getQuantite() {
        return quantite;
    }

    public void setQuantite(Double quantite) {
        this.quantite = quantite;
    }

    public CategorieArticle getCategorie_produit() {
        return categorie_produit;
    }

    public void setCategorie_produit(CategorieArticle categorie_produit) {
        this.categorie_produit = categorie_produit;
    }

    public double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(double taux_tva) {
        this.taux_tva = taux_tva;
    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.Produit[ code=" + code + " ]";
    }
    
}

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
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("SERV")
public class ProduitService extends Produit {
    
    @Column(name = "duree_realisation")
    @Label("Duree")
    private Integer duree_realisation;
    
    @Select
    @OnChange
    @JoinColumn(name = "categorie_produit", referencedColumnName = "code")
    @ManyToOne
    @Label("Categorie")
    private Categorieproduit categorie_produit;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "taux_tva")
    @SpelValue("categorie_produit.taux_tva")
    @NotReadOnly
    private double taux_tva;
    
        public ProduitService() {
    }

    public ProduitService(Integer code) {
        this.code = code;
    }

    public Integer getDuree_realisation() {
        return duree_realisation;
    }

    public void setDuree_realisation(Integer duree_realisation) {
        this.duree_realisation = duree_realisation;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.Produit[ code=" + code + " ]";
    }

    public Categorieproduit getCategorie_produit() {
        return categorie_produit;
    }

    public void setCategorie_produit(Categorieproduit categorie_produit) {
        this.categorie_produit = categorie_produit;
    }

    public double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(double taux_tva) {
        this.taux_tva = taux_tva;
    }
    
}

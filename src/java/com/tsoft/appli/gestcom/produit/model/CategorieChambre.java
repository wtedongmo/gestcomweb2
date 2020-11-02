/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.produit.model;

import com.tsoft.annotations.form.Label;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("CATCHAMB")
public class CategorieChambre extends Categorieproduit {
    
    @Label("Chambre")
    @OneToMany(mappedBy = "categorie_produit")
    private List<Chambre> produitCollection = new ArrayList();

    public CategorieChambre() {
    }

    public CategorieChambre(Integer code) {
        this.code = code;
    }

    public List<Chambre> getProduitCollection() {
        return produitCollection;
    }

    public void setProduitCollection(List<Chambre> produitCollection) {
        this.produitCollection = produitCollection;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.CatgChambre[ code=" + code + " ]";
    }
    
}

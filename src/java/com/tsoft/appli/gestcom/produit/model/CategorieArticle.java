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
@DiscriminatorValue("CATART")
public class CategorieArticle extends Categorieproduit {
    
    @Label("Article")
    @OneToMany(mappedBy = "categorie_produit")
    private List<Article> produitCollection = new ArrayList();

    public CategorieArticle() {
    }

    public CategorieArticle(Integer code) {
        this.code = code;
    }

    public List<Article> getProduitCollection() {
        return produitCollection;
    }

    public void setProduitCollection(List<Article> produitCollection) {
        this.produitCollection = produitCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.Catgorie[ code=" + code + " ]";
    }
    
}

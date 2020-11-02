/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.produit.model;

import com.tsoft.annotations.form.Label;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("CATSERV")
public class CategorieProduitService extends Categorieproduit {
    
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    
    @Label("Service")
    @OneToMany(mappedBy = "categorie_produit")
    private List<ProduitService> produitCollection = new ArrayList();

    public CategorieProduitService() {
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<ProduitService> getProduitCollection() {
        return produitCollection;
    }

    public void setProduitCollection(List<ProduitService> produitCollection) {
        this.produitCollection = produitCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.CategorieServ[ code=" + code + " ]";
    }
    
}

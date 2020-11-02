/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.produit.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "typeproduit")
public class Typeproduit  extends SimpleEntity  {
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;

//    @OneToMany(mappedBy = "type_produit")
//    private List<Produit> produitCollection = new ArrayList();

    public Typeproduit() {
    }

    public Typeproduit(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

//    public List<Produit> getProduitCollection() {
//        return produitCollection;
//    }
//
//    public void setProduitCollection(List<Produit> produitCollection) {
//        this.produitCollection = produitCollection;
//    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Typeproduit[ code=" + code + " ]";
    }
    
}

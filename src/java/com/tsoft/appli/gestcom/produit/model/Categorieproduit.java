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
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author User
 */
@Entity
@Table(name = "categorieproduit")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "type_caateg_produit",
        discriminatorType = DiscriminatorType.STRING
)
public class Categorieproduit  extends SimpleEntity  {
    
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;
    @Column(name = "stockable")
    private Boolean stockable;
    @Column(name = "taux_tva")
    private double taux_tva;
    
    public Categorieproduit() {
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Boolean isStockable() {
        return stockable;
    }

    public void setStockable(Boolean stockable) {
        this.stockable = stockable;
    }

    public double getTaux_tva() {
        return taux_tva;
    }

    public void setTaux_tva(double taux_tva) {
        this.taux_tva = taux_tva;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.produit.model.Categorieproduit[ code=" + code + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.appli.gestcom.facture.service.CategoriefactureService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.SimpleEntity;
import java.util.ArrayList;
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
@Table(name = "categoriefacture")
@Dao(CategoriefactureService.class)
public class Categoriefacture extends SimpleEntity {
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;

    @OneToMany(mappedBy = "categorie_facture")
    @Label("Facture")
    private List<Facture> factureCollection = new ArrayList();

    public Categoriefacture() {
    }

    public Categoriefacture(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<Facture> getFactureCollection() {
        return factureCollection;
    }

    public void setFactureCollection(List<Facture> factureCollection) {
        this.factureCollection = factureCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.facture.model.Categoriefacture[ code=" + code + " ]";
    }
    
}

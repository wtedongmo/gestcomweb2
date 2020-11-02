/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
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
@Table(name = "modepriserdv")
public class Modepriserdv  extends SimpleEntity  {
    
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;

    @OneToMany(mappedBy = "mode_prise_rdv")
    @Label("Ticket")
    private List<Ticket> factureCollection=new ArrayList();

    public Modepriserdv() {
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    
    public String getLibelle() {
        return libelle;
    }

    public List<Ticket> getFactureCollection() {
        return factureCollection;
    }

    public void setFactureCollection(List<Ticket> factureCollection) {
        this.factureCollection = factureCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Etatfacture[ code=" + code + " ]";
    }
    
}

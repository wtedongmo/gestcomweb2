/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.appli.gestcom.paiement.model.Paiementfacture;
import com.tsoft.annotations.form.Select;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name = "facture")
@DiscriminatorValue("FACT")
public class Factures extends Facture {
    
    @Select
    @JoinColumn(name = "type_facture", referencedColumnName = "code")
    @ManyToOne
    @Label("Type")
    private Typefacture type_facture;
    @OneToMany(mappedBy = "code_facture")
    @Label("Detail Facture")
    private List<Detailfactures> detailfactureCollection=new ArrayList();
//
//    @OneToMany(mappedBy = "code_facture")
//    @Label("Paiement Facture")
//    private List<Paiementfacture> paiementfactureCollection=new ArrayList();


    public Factures() {
    }

    public Factures(Integer code) {
        this.code = code;
    }

    public Typefacture getType_facture() {
        return type_facture;
    }

    public List<Detailfactures> getDetailfactureCollection() {
        return detailfactureCollection;
    }

    public void setDetailfactureCollection(List<Detailfactures> detailfactureCollection) {
        this.detailfactureCollection = detailfactureCollection;
    }
//
//    public List<Paiementfacture> getPaiementfactureCollection() {
//        return paiementfactureCollection;
//    }
//
//    public void setPaiementfactureCollection(List<Paiementfacture> paiementfactureCollection) {
//        this.paiementfactureCollection = paiementfactureCollection;
//    }
    
    public void setType_facture(Typefacture type_facture) {
        this.type_facture = type_facture;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.facture.model.Factures[ code=" + code + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

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
//@Table(name = "facture")
@DiscriminatorValue("FACT_Chambr")
public class Facturechambre extends Facture {
    
    
    @OneToMany(mappedBy = "code_facture")
    @Label("Detail")
    private List<Detailfacturechambre> detailfactureCollection=new ArrayList();
//
//    @OneToMany(mappedBy = "code_facture")
//    @Label("Paiement Facture")
//    private List<Paiementfacture> paiementfactureCollection=new ArrayList();


    public Facturechambre() {
    }

    public Facturechambre(Integer code) {
        this.code = code;
    }

    
    public List<Detailfacturechambre> getDetailfactureCollection() {
        return detailfactureCollection;
    }

    public void setDetailfactureCollection(List<Detailfacturechambre> detailfactureCollection) {
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
    
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.facture.model.Factures[ code=" + code + " ]";
    }
    
}

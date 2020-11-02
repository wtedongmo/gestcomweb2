/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name="detailfacture")
@DiscriminatorValue("DFACT")
public class Detailfactures extends Detailfacture {
    
    @NotNull
    @JoinColumn(name = "code_facture", referencedColumnName = "code")
    @ManyToOne
    private Factures code_facture;
    
    public Detailfactures() {
    }

    public Detailfactures(Integer code) {
        this.code = code;
    }

    public Factures getCode_facture() {
        return code_facture;
    }

    public void setCode_facture(Factures code_facture) {
        this.code_facture = code_facture;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.model.DetailFactures[ code=" + code + " ]";
    }

}

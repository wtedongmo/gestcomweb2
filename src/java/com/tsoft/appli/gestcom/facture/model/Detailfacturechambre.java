/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.SpelValue;
import com.tsoft.appli.gestcom.person.model.Employe;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name="detailfacture")
@DiscriminatorValue("DF_Chambr")
public class Detailfacturechambre extends Detailfacture {
    
    @Column(name = "date_debut")
    @Temporal(TemporalType.DATE)
    private Date date_debut;
//    @Formula("(select date_add(heure_debut, interval duree MINUTE)")
    @Column(name = "date_fin_prevu")
    @Temporal(TemporalType.DATE)
    private Date date_fin_prevu;

    @NotNull
    @JoinColumn(name = "code_facture", referencedColumnName = "code") //, insertable = false, updatable = false
    @ManyToOne
    @Label("Facture Chambres")
    private Facturechambre code_facture;
    
    public Detailfacturechambre() {
    }

    public Detailfacturechambre(Integer code) {
        this.code = code;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin_prevu() {
        return date_fin_prevu;
    }

    public void setDate_fin_prevu(Date date_fin_prevu) {
        this.date_fin_prevu = date_fin_prevu;
    }

    public Facturechambre getCode_facture() {
        return code_facture;
    }

    public void setCode_facture(Facturechambre code_facture) {
        this.code_facture = code_facture;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.model.Detailticket[ code=" + code + " ]";
    }

}

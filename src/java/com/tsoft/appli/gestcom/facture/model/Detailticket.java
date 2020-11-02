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
@DiscriminatorValue("DTICKET")
public class Detailticket extends Detailfacture {
    
    @JoinColumn(name = "code_technicien", referencedColumnName = "code")
    @ManyToOne
    @Label("Technicien")
    private Employe code_technicien;
    
    @Column(name = "duree")
    @SpelValue("code_produit.duree_realisation")
    private Integer duree;
    @Column(name = "heure_debut")
    @Temporal(TemporalType.TIME)
    private Date heure_debut;
//    @Formula("(select date_add(heure_debut, interval duree MINUTE)")
    @Column(name = "heure_fin_prevu")
    @Temporal(TemporalType.TIME)
    private Date heure_fin_prevu;

    @NotNull
    @JoinColumn(name = "code_facture", referencedColumnName = "code") //, insertable = false, updatable = false
    @ManyToOne
    @Label("Ticket")
    private Ticket code_facture;
    
    public Detailticket() {
    }

    public Detailticket(Integer code) {
        this.code = code;
    }

    public Integer getDuree() {
        return duree;
    }

    public void setDuree(Integer duree) {
        this.duree = duree;
    }

    public Employe getCode_technicien() {
        return code_technicien;
    }

    public void setCode_technicien(Employe code_technicien) {
        this.code_technicien = code_technicien;
    }

    public Date getHeure_debut() {
        return heure_debut;
    }

    public void setHeure_debut(Date heure_debut) {
        this.heure_debut = heure_debut;
    }

    public Date getHeure_fin_prevu() {
        return heure_fin_prevu;
    }

    public void setHeure_fin_prevu(Date heure_fin_prevu) {
        this.heure_fin_prevu = heure_fin_prevu;
    }

    public Ticket getCode_facture() {
        return code_facture;
    }

    public void setCode_facture(Ticket code_facture) {
        this.code_facture = code_facture;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.model.Detailticket[ code=" + code + " ]";
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.annotations.form.ReadOnly;
import com.tsoft.annotations.form.Select;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.annotations.Formula;

/**
 *
 * @author Tedongmo
 */
@Entity
//@Table(name = "facture")
@DiscriminatorValue("TICK")
public class Ticket extends Facture {
    
    @Column(name = "date_debut")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_debut;
    
    @Select
    @JoinColumn(name = "mode_prise_rdv", referencedColumnName = "code")
    @ManyToOne
    private Modepriserdv mode_prise_rdv;
    
    @Select
    @NotNull
    @JoinColumn(name = "etat_ticket", referencedColumnName = "code")
    @ManyToOne
    private Etatticket etat_ticket;
    @Label("Duree Total")
    @Formula("(select sum(df.duree) from Facture f join Detailfacture df on f.code=df.code_facture "
            + "  where f.code=code)")
//    @Column(name = "duree_total")
    private Integer duree_total;
//    @Formula("(select date_add(date_debut, INTERVAL duree_total MINUTE)")
    @ReadOnly
    @Column(name = "date_fin_prevu")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date_fin_prevu;
    
    @OneToMany(mappedBy = "code_facture")
    @Label("Detail Ticket")
    private List<Detailticket> detailfactureCollection=new ArrayList();

//    @OneToMany(mappedBy = "code_facture")
//    @Label("Paiement Ticket")
//    private List<Paiementfacture> paiementfactureCollection=new ArrayList();


    public Ticket() {
    }

    public Ticket(Integer code) {
        this.code = code;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Modepriserdv getMode_prise_rdv() {
        return mode_prise_rdv;
    }

    public void setMode_prise_rdv(Modepriserdv mode_prise_rdv) {
        this.mode_prise_rdv = mode_prise_rdv;
    }

    public Integer getDuree_total() {
        return duree_total;
    }

    public void setDuree_total(Integer duree_total) {
        this.duree_total = duree_total;
    }

    public Date getDate_fin_prevu() {
        return date_fin_prevu;
    }

    public void setDate_fin_prevu(Date date_fin_prevu) {
        this.date_fin_prevu = date_fin_prevu;
    }

    public Etatticket getEtat_ticket() {
        return etat_ticket;
    }

    public void setEtat_ticket(Etatticket etat_ticket) {
        this.etat_ticket = etat_ticket;
    }

    public List<Detailticket> getDetailfactureCollection() {
        return detailfactureCollection;
    }

    public void setDetailfactureCollection(List<Detailticket> detailfactureCollection) {
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
        return "com.tsoft.appli.gestcom.facture.model.Ticket[ code=" + code + " ]";
    }
    
}

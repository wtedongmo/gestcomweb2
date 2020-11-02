/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.security.model;

import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.ReadOnly;
import com.tsoft.annotations.form.Select;
import com.tsoft.appli.gestcom.paiement.model.Caisse;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.AuditEntity;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author User
 */
@Entity
@Table(name = "clotureperiode")
@Dao()
public class Clotureperiode  extends AuditEntity  {
//    @Size(max = 100)
//    @Libelle
//    @Column(name = "libelle")
//    private String libelle;
    @Libelle
    @Column(name = "date_debut")
    @Temporal(TemporalType.DATE)
    private Date date_debut;
    @Column(name = "date_fin")
    @Temporal(TemporalType.DATE)
    private Date date_fin;
    @Select
    @Enumerated(EnumType.STRING)
    private Etatperiode etat_periode;
    @Size(max = 30)
    @Column(name = "entite_concernee")
    private String entite_concernee;
    @Size(max = 50)
    @Column(name = "filtre")
    private String filtre;
//    @ReadOnly
    @JoinColumn(name = "code_caisse", referencedColumnName = "code")
    @ManyToOne
    private Caisse caisse;
    @Column(name = "nombre_transaction")
    private Integer nombre_transaction;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "total_entree")
    private Double total_entree;
    @Column(name = "total_sortie")
    private Double totalSortie;

    public Clotureperiode() {
    }

    public Clotureperiode(Integer code) {
        this.code = code;
    }

//    public String getLibelle() {
//        return libelle;
//    }
//
//    public void setLibelle(String libelle) {
//        this.libelle = libelle;
//    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public Etatperiode getEtat_periode() {
        return etat_periode;
    }

    public void setEtat_periode(Etatperiode etat_periode) {
        this.etat_periode = etat_periode;
    }

    public String getEntite_concernee() {
        return entite_concernee;
    }

    public void setEntite_concernee(String entite_concernee) {
        this.entite_concernee = entite_concernee;
    }

    public String getFiltre() {
        return filtre;
    }

    public void setFiltre(String filtre) {
        this.filtre = filtre;
    }

    public Caisse getCaisse() {
        return caisse;
    }

    public void setCaisse(Caisse caisse) {
        this.caisse = caisse;
    }

    public Integer getNombre_transaction() {
        return nombre_transaction;
    }

    public void setNombre_transaction(Integer nombre_transaction) {
        this.nombre_transaction = nombre_transaction;
    }

    public Double getTotal_entree() {
        return total_entree;
    }

    public void setTotal_entree(Double total_entree) {
        this.total_entree = total_entree;
    }

    public Double getTotalSortie() {
        return totalSortie;
    }

    public void setTotalSortie(Double totalSortie) {
        this.totalSortie = totalSortie;
    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Clotureperiode[ code=" + code + " ]";
    }
    
}

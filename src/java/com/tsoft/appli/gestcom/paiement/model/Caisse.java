/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.paiement.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.appli.gestcom.paiement.service.CaisseService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.User;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "caisse")
@Dao(CaisseService.class)
public class Caisse extends LifeCycleEntity {
    
    @Libelle
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;
    @NotNull
    @JoinColumn(name = "code_gerant", referencedColumnName = "code")
    @ManyToOne
    private User gerant;

//    @OneToMany(mappedBy = "code_caisse")
//    private List<Paiement> paiement_list=new ArrayList();

    public Caisse() {
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public User getGerant() {
        return gerant;
    }

    public void setGerant(User code_gerant) {
        this.gerant = code_gerant;
    }

//    public List<Paiement> getPaiement_list() {
//        return paiement_list;
//    }
//
//    public void setPaiement_list(List<Paiement> paiementCollection) {
//        this.paiement_list = paiementCollection;
//    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Caisse[ code=" + code + " ]";
    }
    
}

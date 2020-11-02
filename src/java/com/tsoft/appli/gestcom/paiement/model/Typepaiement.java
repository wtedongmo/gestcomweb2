/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.paiement.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.appli.gestcom.paiement.service.TypepaiementService;
import com.tsoft.dao.Dao;
import com.tsoft.security.model.superclass.AuditEntity;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author TEDONGMO
 */
@Entity
@Table(name="typepaiement")
@Dao(TypepaiementService.class)
public class Typepaiement extends SimpleEntity {

     @Size(max = 20)
    @Column 
    @Libelle
    private String libelle;
     
    @OneToMany(mappedBy = "type_paiement")
    private List<Paiement> paiementCollection=new ArrayList();

    
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    public String getLibelle() {
        return libelle;
    }

    public List<Paiement> getPaiementCollection() {
        return paiementCollection;
    }

    public void setPaiementCollection(List<Paiement> paiementCollection) {
        this.paiementCollection = paiementCollection;
    }

    
}


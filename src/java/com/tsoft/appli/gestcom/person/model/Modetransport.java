/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import com.tsoft.annotations.form.Libelle;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author TEDONGMO
 */
@Entity
@Table(name="naturecompte")
public class Modetransport extends SimpleEntity {

     @Size(max = 50)
    @Column 
    @Libelle
    private String libelle;
     
//    @OneToMany(mappedBy = "nature_compte")
//    private List<Comptepersonne> comptepersonneCollection = new ArrayList();

    
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    public String getLibelle() {
        return libelle;
    }

//    public List<Comptepersonne> getComptepersonneCollection() {
//        return comptepersonneCollection;
//    }
//
//    public void setComptepersonneCollection(List<Comptepersonne> comptepersonneCollection) {
//        this.comptepersonneCollection = comptepersonneCollection;
//    }
    
}

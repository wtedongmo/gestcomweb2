/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import java.util.ArrayList;
import java.util.Collection;
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
@Table(name = "typecompte")
public class Typecompte  extends SimpleEntity  {
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;

    @OneToMany(mappedBy = "type_compte")
    private List<Comptepersonne> comptepersonneCollection  = new ArrayList();

    public Typecompte() {
    }

    public Typecompte(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<Comptepersonne> getComptepersonneCollection() {
        return comptepersonneCollection;
    }

    public void setComptepersonneCollection(List<Comptepersonne> comptepersonneCollection) {
        this.comptepersonneCollection = comptepersonneCollection;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Typefacture[ code=" + code + " ]";
    }
    
}

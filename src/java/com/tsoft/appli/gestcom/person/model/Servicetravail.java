/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.annotations.form.Label;
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
 * @author Tedongmo
 */
@Entity
@Table(name = "servicetravail")
public class Servicetravail  extends SimpleEntity  {
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;

    @OneToMany(mappedBy = "service_travail")
    @Label("Employe")
    private List<Employe> personneCollection =new ArrayList();

    public Servicetravail() {
    }

    public Servicetravail(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public List<Employe> getPersonneCollection() {
        return personneCollection;
    }

    public void setPersonneCollection(List<Employe> personneCollection) {
        this.personneCollection = personneCollection;
    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Typefacture[ code=" + code + " ]";
    }
    
}

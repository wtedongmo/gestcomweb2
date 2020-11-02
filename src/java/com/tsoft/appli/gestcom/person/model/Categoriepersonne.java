/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.security.model.superclass.SimpleEntity;
import com.tsoft.annotations.form.Libelle;
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
@Table(name="categoriepersonne")
public class Categoriepersonne extends SimpleEntity {
    
    @Size(max = 50)
    @Column(name = "libelle")
    @Libelle
    private String libelle;
    
    @OneToMany(mappedBy = "categorie_personne")
    @Label("Employe")
    private List<Employe> personneCollection=new ArrayList();

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
    
    public String getLibelle() {
        return libelle;
    }

    public Categoriepersonne() {
    }

    public Categoriepersonne(Integer code) {
        this.code = code;
    }

    public List<Employe> getPersonneCollection() {
        return personneCollection;
    }

    public void setPersonneCollection(List<Employe> personneCollection) {
        this.personneCollection = personneCollection;
    }
    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.model.Categoriepersonne[ code=" + code + " ]";
    }

}


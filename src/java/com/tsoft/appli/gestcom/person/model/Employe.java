/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import com.tsoft.annotations.form.Select;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("EMP")
public class Employe extends Personne {
    
    @Size(max = 100)
    @Column(name = "email_professionnel")
    private String email_professionnel;
    
    @Select
    @ManyToOne
    @JoinColumn(name = "categorie_personne", referencedColumnName = "code")
    @Label("Categorie")
    private Categoriepersonne categorie_personne;
    @Size(max = 100)
    @Column(name = "lieu_naissance")
    private String lieu_naissance;
    
    @Select
    @JoinColumn(name = "service_travail", referencedColumnName = "code")
    @ManyToOne
    private Servicetravail service_travail;
    @Select
    @Enumerated(EnumType.STRING)
    @Label("Statut civile")
    private Statutmatrimonial statut_matrimonial;
    
    
    public Employe() {
    }

    public Employe(Integer code) {
        this.code = code;
    }

    public String getEmail_professionnel() {
        return email_professionnel;
    }

    public void setEmail_professionnel(String email_professionnel) {
        this.email_professionnel = email_professionnel;
    }
    
    public Categoriepersonne getCategorie_personne() {
        return categorie_personne;
    }

    public void setCategorie_personne(Categoriepersonne categorie) {
        this.categorie_personne = categorie;
    }

    public String getLieu_naissance() {
        return lieu_naissance;
    }

    public void setLieu_naissance(String lieu_naissance) {
        this.lieu_naissance = lieu_naissance;
    }

    public Servicetravail getService_travail() {
        return service_travail;
    }

    public void setService_travail(Servicetravail service_travail) {
        this.service_travail = service_travail;
    }

    public Statutmatrimonial getStatut_matrimonial() {
        return statut_matrimonial;
    }

    public void setStatut_matrimonial(Statutmatrimonial statut_matrimonial) {
        this.statut_matrimonial = statut_matrimonial;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Employe[ code=" + code + " ]";
    }
    
}

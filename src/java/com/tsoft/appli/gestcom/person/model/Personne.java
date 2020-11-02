/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.annotations.form.Label;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import com.tsoft.annotations.form.Libelle;
import com.tsoft.annotations.form.Select;
import com.tsoft.appli.gestcom.person.service.PersonneService;
import com.tsoft.dao.Dao;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@Table(name = "personne")
@Dao(PersonneService.class)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
        name = "type_personne",
        discriminatorType = DiscriminatorType.STRING
)
public class Personne extends LifeCycleEntity {
    
    @Libelle
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "nom_prenom")
    private String nom_prenom;
    
//    @JoinColumn(name = "sexe", referencedColumnName = "code")
//    @ManyToOne
    @Enumerated(EnumType.STRING)
    @Select
    private Sexe sexe;
    @Size(max = 100)
    @Column(name = "numeroCNI")
    @Label("N° Carte d'identite ou Passeport")
    private String numeroCNI;
    @Size(max = 100)
    @Column(name = "email_adresse")
    private String email_adresse;
    
    @Size(max = 25)
    @Column(name = "telephone")
    private String telephone;
    @Size(max = 25)
    @Column(name = "telephone_mobile")
    private String telephone_mobile;
    @Column(name = "date_naissance")
    @Temporal(TemporalType.DATE)
    private Date date_naissance;
    @Size(max = 30)
    @Column(name = "boite_postale")
    private String boite_postale;
    @Size(max = 100)
    @Column(name = "quartier")
    private String quartier;
    
    @Label("Compte")
    @OneToMany(mappedBy = "code_personne")
    private List<Comptepersonne> comptepersonneCollection = new ArrayList();
    
    public Personne() {
    }

    public Personne(Integer code) {
        this.code = code;
    }

    public Personne(Integer code, String nomPrenom) {
        this.code = code;
        this.nom_prenom = nomPrenom;
    }

    public String getNom_prenom() {
        return nom_prenom;
    }

    public void setNom_prenom(String nom_prenom) {
        this.nom_prenom = nom_prenom;
    }

    public Sexe getSexe() {
        return sexe;
    }

    public void setSexe(Sexe sexe) {
        this.sexe = sexe;
    }

    public String getNumeroCNI() {
        return numeroCNI;
    }

    public void setNumeroCNI(String numeroCNI) {
        this.numeroCNI = numeroCNI;
    }

    public String getEmail_adresse() {
        return email_adresse;
    }

    public void setEmail_adresse(String email_adresse) {
        this.email_adresse = email_adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTelephone_mobile() {
        return telephone_mobile;
    }

    public void setTelephone_mobile(String telephone_mobile) {
        this.telephone_mobile = telephone_mobile;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getBoite_postale() {
        return boite_postale;
    }

    public void setBoite_postale(String boite_postale) {
        this.boite_postale = boite_postale;
    }

    public String getQuartier() {
        return quartier;
    }

    public void setQuartier(String quartier) {
        this.quartier = quartier;
    }

    public List<Comptepersonne> getComptepersonneCollection() {
        return comptepersonneCollection;
    }

    public void setComptepersonneCollection(List<Comptepersonne> comptepersonneCollection) {
        this.comptepersonneCollection = comptepersonneCollection;
    }

     
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Personne[ code=" + code + " ]";
    }
    
}

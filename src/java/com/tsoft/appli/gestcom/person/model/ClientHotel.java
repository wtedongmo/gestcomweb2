/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import com.tsoft.annotations.form.Label;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("CLTHT")
public class ClientHotel extends Personne {
    
    @Size(max = 100)
    @Column(name = "lieu_naissance")
    private String lieu_naissance;
    
    @Size(max = 50)
    @Column(name = "nationalite")
    private String nationalite;
    
    @Size(max = 50)
    @Column(name = "pays_de_residence")
    private String pays_de_residence;
    
    @Size(max = 100)
    @Column(name = "adresse")
    private String adresse;
    
    @Size(max = 50)
    @Column(name = "profession")
    private String profession;
    
    @Size(max = 50)
    @Column(name = "venant_de")
    private String venant_de;
    
    @Size(max = 50)
    @Column(name = "se_rendant_a")
    private String se_rendant_a;
    
    @Column(name = "nombre_hommes")
    private Integer nombre_hommes;
    
    @Column(name = "nombre_femmes")
    private Integer nombre_femmes;
    
    @Label("Delivre le")
    @Column(name = "date_delivrance")
    @Temporal(TemporalType.DATE)
    private Date date_delivrance;
    
    @Size(max = 100)
    @Column(name = "lieu_delivrance")
    private String lieu_delivrance;
    
    @Column(name = "mode_transport")
    private String mode_transport;
    
    @Size(max = 100)
    @Column(name = "numero_vehicule")
    private String numero_vehicule;
    
    @Column(name = "date_de_depart")
    @Temporal(TemporalType.DATE)
    private Date date_de_depart;
    
    public ClientHotel() {
    }

    public String getLieu_naissance() {
        return lieu_naissance;
    }

    public void setLieu_naissance(String lieu_naissance) {
        this.lieu_naissance = lieu_naissance;
    }

    public String getNationalite() {
        return nationalite;
    }

    public void setNationalite(String nationalite) {
        this.nationalite = nationalite;
    }

    public String getPays_de_residence() {
        return pays_de_residence;
    }

    public void setPays_de_residence(String pays_de_residence) {
        this.pays_de_residence = pays_de_residence;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getVenant_de() {
        return venant_de;
    }

    public void setVenant_de(String venant_de) {
        this.venant_de = venant_de;
    }

    public String getSe_rendant_a() {
        return se_rendant_a;
    }

    public void setSe_rendant_a(String se_rendant_a) {
        this.se_rendant_a = se_rendant_a;
    }

    public Integer getNombre_hommes() {
        return nombre_hommes;
    }

    public void setNombre_hommes(Integer nombre_hommes) {
        this.nombre_hommes = nombre_hommes;
    }

    public Integer getNombre_femmes() {
        return nombre_femmes;
    }

    public void setNombre_femmes(Integer nombre_femmes) {
        this.nombre_femmes = nombre_femmes;
    }

    public Date getDate_delivrance() {
        return date_delivrance;
    }

    public void setDate_delivrance(Date date_delivrance) {
        this.date_delivrance = date_delivrance;
    }

    public String getLieu_delivrance() {
        return lieu_delivrance;
    }

    public void setLieu_delivrance(String lieu_delivrance) {
        this.lieu_delivrance = lieu_delivrance;
    }

    public String getMode_transport() {
        return mode_transport;
    }

    public void setMode_transport(String mode_transport) {
        this.mode_transport = mode_transport;
    }

    public String getNumero_vehicule() {
        return numero_vehicule;
    }

    public void setNumero_vehicule(String numero_vehicule) {
        this.numero_vehicule = numero_vehicule;
    }

    public Date getDate_de_depart() {
        return date_de_depart;
    }

    public void setDate_de_depart(Date date_de_depart) {
        this.date_de_depart = date_de_depart;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.person.model.CleintHotel[ code=" + code + " ]";
    }
    
}

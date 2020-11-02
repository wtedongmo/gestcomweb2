/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.security.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "parametre")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Parametre.findAll", query = "SELECT p FROM Parametre p"),
    @NamedQuery(name = "Parametre.findByCodeparams", query = "SELECT p FROM Parametre p WHERE p.codeparams = :codeparams"),
    @NamedQuery(name = "Parametre.findByLibelle", query = "SELECT p FROM Parametre p WHERE p.libelle = :libelle"),
    @NamedQuery(name = "Parametre.findByCode", query = "SELECT p FROM Parametre p WHERE p.code = :code")})
public class Parametre implements Serializable {
    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "codeparams")
    private String codeparams;
    @Size(max = 100)
    @Column(name = "libelle")
    private String libelle;
    @Lob
    @Size(max = 65535)
    @Column(name = "valeur")
    private String valeur;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "code")
    private Integer code;

    public Parametre() {
    }

    public Parametre(Integer code) {
        this.code = code;
    }

    public Parametre(Integer code, String codeparams) {
        this.code = code;
        this.codeparams = codeparams;
    }

    public String getCodeparams() {
        return codeparams;
    }

    public void setCodeparams(String codeparams) {
        this.codeparams = codeparams;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parametre)) {
            return false;
        }
        Parametre other = (Parametre) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Parametre[ code=" + code + " ]";
    }
    
}

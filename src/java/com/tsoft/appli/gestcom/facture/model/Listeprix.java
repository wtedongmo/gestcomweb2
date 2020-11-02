/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.model;

import com.tsoft.annotations.form.Libelle;
import com.tsoft.security.model.superclass.LifeCycleEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author User
 */
@Entity
@Table(name = "listeprix")
//@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Listeprix.findAll", query = "SELECT l FROM Listeprix l"),
//    @NamedQuery(name = "Listeprix.findByCode", query = "SELECT l FROM Listeprix l WHERE l.code = :code"),
//    @NamedQuery(name = "Listeprix.findByLibelle", query = "SELECT l FROM Listeprix l WHERE l.libelle = :libelle")})
public class Listeprix extends LifeCycleEntity {
    
    @Libelle
    @Size(max = 50)
    @Column(name = "libelle")
    private String libelle;
    @Lob
    @Size(max = 65535)
    @Column(name = "formule_prix")
    private String formule_prix;

    @OneToMany(mappedBy = "code_liste_prix")
    private List<Facture> factureCollection=new ArrayList();

    @OneToMany(mappedBy = "code_liste_prix")
    private List<Detaillisteprix> detaillisteprix=new ArrayList();

    public Listeprix() {
    }

    public Listeprix(Integer code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getFormule_prix() {
        return formule_prix;
    }

    public void setFormule_prix(String formule_prix) {
        this.formule_prix = formule_prix;
    }

    public List<Facture> getFactureCollection() {
        return factureCollection;
    }

    public void setFactureCollection(List<Facture> factureCollection) {
        this.factureCollection = factureCollection;
    }

    public List<Detaillisteprix> getDetaillisteprix() {
        return detaillisteprix;
    }

    public void setDetaillisteprix(List<Detaillisteprix> detaillisteprix) {
        this.detaillisteprix = detaillisteprix;
    }

    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.dao.model.Listeprix[ code=" + code + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.security.model;

import com.tsoft.security.model.superclass.SimpleEntity;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
//@Entity
//@Table(name = "yesno")
//@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Yesno.findAll", query = "SELECT y FROM Yesno y"),
//    @NamedQuery(name = "Yesno.findByCode", query = "SELECT y FROM Yesno y WHERE y.code = :code"),
//    @NamedQuery(name = "Yesno.findByLibelle", query = "SELECT y FROM Yesno y WHERE y.libelle = :libelle")})
public enum Yesno  {
    OUI, NON, INCONNU;    
}

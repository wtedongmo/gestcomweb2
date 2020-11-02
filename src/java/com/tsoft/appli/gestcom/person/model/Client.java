/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 *
 * @author Tedongmo
 */
@Entity
@DiscriminatorValue("CLT")
public class Client extends Personne {
    
    
    
    public Client() {
    }

    
    @Override
    public String toString() {
        return "com.tsoft.appli.gestcom.person.model.Cleint[ code=" + code + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.person.service;

import com.tsoft.appli.gestcom.paiement.model.Paiement;
import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.dao.hibernate.service.HibernateService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class ComptepersonneService   extends HibernateService<Comptepersonne> {
    
    @Autowired
    TypecompteService type_compt;
    
    @Override
    public Comptepersonne addDefaultsValues(Comptepersonne pm) throws Exception{
        pm.setType_compte(type_compt.getTypecompte(1));
        return pm;
    }
    
    @Override
//    @Transactional
    public Comptepersonne create(Comptepersonne cp) throws Exception{
        if(cp.getLibelle()==null || cp.getLibelle().trim().length()==0)
            cp.setLibelle(cp.getCode_personne().getNom_prenom());
//        if(cp.getCategorie_personne()==null) cp.setCategorie_personne(cp.getCode_personne().getCategorie_personne());
        //if(cp.getType_compte()==null) cp.setType_compte(TypeCompte.class);
        super.create(cp);
        return cp;
    }
    
}

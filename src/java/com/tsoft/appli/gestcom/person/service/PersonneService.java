/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.person.service;

import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.appli.gestcom.person.model.Employe;
import com.tsoft.appli.gestcom.person.model.Personne;
import com.tsoft.dao.hibernate.service.HibernateService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author tchipi
 */
@Service
public class PersonneService  extends HibernateService<Personne> {

       
    @Override
//    @Transactional
    public Personne create(final Personne p ) throws Exception {
        List tosave=new ArrayList();
        tosave.add(p);
        Comptepersonne cps = new Comptepersonne();
        cps.setCode_personne(p);
        cps.setCredit(new Double(0));
        cps.setDebit(new Double(0));
        cps.setLibelle(p.getNom_prenom());
//        if(p instanceof Employe)
//            cps.setCategorie_personne(((Employe) p).getCategorie_personne());
//        cps.setType_compte(TypeCompte.PINCIAPAL);
        tosave.add(cps);
        
//        if(p.getCategorie().equals(TypePersonne.DELEGATE)){
//            ComptePersonne cpa = new ComptePersonne();
//            cpa.setCode_personne(p);
//            cpa.setCredit(new Double(0));
//            cpa.setDebit(new Double(0));
//            cpa.setLibelle(p.getNom_prenom()+" CP Auxiliaire");
//            cpa.setCategorie_personne(p.getCategorie());
//            cpa.setType_compte(TypeCompte.AUXILIAIRE);
//            tosave.add(cpa);
//        }
        super.saveAll(tosave);
       return p;
   }

}

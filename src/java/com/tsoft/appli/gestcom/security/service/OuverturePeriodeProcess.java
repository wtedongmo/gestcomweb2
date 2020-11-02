/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.security.service;

import com.tsoft.appli.gestcom.paiement.service.CaisseService;
import com.tsoft.appli.gestcom.paiement.model.Caisse;
import com.tsoft.appli.gestcom.security.model.Clotureperiode;
import com.tsoft.appli.gestcom.security.model.Etatperiode;
import com.tsoft.exceptions.BusinessException;
import com.tsoft.service.process.EmptyActionProcess;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Temporal;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
@Scope("session")
public class OuverturePeriodeProcess extends EmptyActionProcess{

    @NotNull
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date_debut;
    
    @NotNull
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date_fin;

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }
    
    @Override
    public String libelle() {
        return "Ouverture caisse";
    }

    @Autowired
    CaisseService caisserv;
    @Autowired
    ClotureperiodeService cps;
    
    @Override
    public Object run(HttpSession hs, HttpServletRequest hsr) throws Exception {
        
        List<Criterion> criteres = new ArrayList();
//        criteres.add(Restrictions.eq("eleve", getEleve()));
//        criteres.add(Restrictions.eq("annee", as.getAnneeCourante()));
        Caisse caisse =  caisserv.getCaisse();
        Clotureperiode cp;
        try{
            cp = cps.getClotureperiode(getDate_debut(), caisse);
            if(cp!=null) 
                throw new BusinessException("Periode deja ouverte");
        }catch(Exception ex){}
        
        cp = new Clotureperiode();
        cp.setCaisse(caisse);
        cp.setDate_debut(getDate_debut());
        cp.setDate_fin(getDate_fin());
        cp.setEtat_periode(Etatperiode.OUVERT);
        cp.setFiltre("*");
        cp.setEntite_concernee("paiement");
        cp = (Clotureperiode) hibernateService.create(cp);
        return cp;
    }

    @Override
    public Class rubrique() throws Exception {
        return Clotureperiode.class;
    }
    

}

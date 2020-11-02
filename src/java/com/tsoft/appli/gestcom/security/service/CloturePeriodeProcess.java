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
public class CloturePeriodeProcess extends EmptyActionProcess{

    @NotNull
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date_debut;
    
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
        return "Cloture caisse";
    }

    @Autowired
    CaisseService caisserv;
    @Autowired
    ClotureperiodeService cps;
    @Override
    public Object run(HttpSession hs, HttpServletRequest hsr) throws Exception {
        
        Caisse caisse =  caisserv.getCaisse();
        Clotureperiode cp = cps.getClotureperiode(getDate_debut(), caisse);
        if(cp==null) 
            throw new BusinessException("Periode non ouverte");
        cp.setEtat_periode(Etatperiode.FERME);
        cp = (Clotureperiode) hibernateService.update(cp);
        return cp;
    }

    @Override
    public Class rubrique() throws Exception {
        return Clotureperiode.class;
    }
    

}

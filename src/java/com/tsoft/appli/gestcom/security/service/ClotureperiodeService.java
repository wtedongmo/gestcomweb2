/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.security.service;

import com.tsoft.appli.gestcom.paiement.model.Caisse;
import com.tsoft.appli.gestcom.paiement.service.CaisseService;
import com.tsoft.appli.gestcom.security.model.Clotureperiode;
import com.tsoft.appli.gestcom.security.model.Etatperiode;
import com.tsoft.dao.hibernate.service.HibernateService;
import com.tsoft.exceptions.BusinessException;
import com.tsoft.security.model.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class ClotureperiodeService extends HibernateService<Clotureperiode>{
    
    public Clotureperiode getClotureperiode(Date date, Caisse caisse) throws Exception {
//        User u=((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        List<Criterion> criteres = new ArrayList();
//        criteres.add(Restrictions.gt("date_fin", date));
        criteres.add(Restrictions.le("date_debut", date));
        criteres.add(Restrictions.eq("caisse", caisse));
        
//        DateFormat datf = new SimpleDateFormat("yyyy/MM/dd");
        Clotureperiode c = getOne(Clotureperiode.class, criteres, null);
        if (c == null) {
//            criteres.remove(2);
//            
//            c = getOne(Clotureperiode.class, "select c from Clotureperiode c  where caisse.code= "+
//                0+ " and c.date_debut<='"+datf.format(date)+"' and c.date_fin>'"+datf.format(date)+"'");
//            if (c == null)
                throw new BusinessException("Aucune Periode Ouverte pour cette periode de ce gerant");
        }
        return c;
    }
    
    public Clotureperiode getClotureperiode(Date date_debut, Date date_fin, Caisse caisse) throws Exception {
//        User u=((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        List<Criterion> criteres = new ArrayList();
        criteres.add(Restrictions.eq("date_fin", date_fin));
        criteres.add(Restrictions.eq("date_debut", date_debut));
        criteres.add(Restrictions.eq("caisse", caisse));
        
//        DateFormat datf = new SimpleDateFormat("yyyy/MM/dd");
        Clotureperiode c = getOne(Clotureperiode.class, criteres, null);
        if (c == null) {
//            criteres.remove(2);
//            
//            c = getOne(Clotureperiode.class, "select c from Clotureperiode c  where caisse.code= "+
//                0+ " and c.date_debut<='"+datf.format(date)+"' and c.date_fin>'"+datf.format(date)+"'");
//            if (c == null)
                throw new BusinessException("Aucune Periode Ouverte pour cette periode de ce gerant");
        }
        return c;
    }
    
    public Clotureperiode create(Clotureperiode cp) throws Exception{
        CaisseService caisserv = new CaisseService();
        Caisse caisse =  caisserv.getCaisse();
        Clotureperiode cpm = getClotureperiode(cp.getDate_debut(), caisse);
        if(cpm!=null) 
            throw new BusinessException("Periode deja ouverte");
        cp.setCaisse(caisse);
        cp = super.create(cp);
        return cp;
    }

}

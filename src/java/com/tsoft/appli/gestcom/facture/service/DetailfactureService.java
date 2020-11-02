/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.service;

import com.tsoft.appli.gestcom.facture.model.Detailfacture;
import com.tsoft.appli.gestcom.facture.model.Detailfacturechambre;
import com.tsoft.appli.gestcom.facture.model.Detailticket;
import com.tsoft.appli.gestcom.produit.model.ProduitService;
import com.tsoft.dao.hibernate.service.HibernateService;
import java.util.Calendar;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class DetailfactureService extends HibernateService<Detailfacture> {

//    @Autowired
//    CaisseService caisserv;
//
//    @Autowired
//    ClotureperiodeService cps;
    
    Calendar cal;
    
    @Override
    public Detailfacture addDefaultsValues(Detailfacture df) throws Exception{
        df.setQuantite(1.0);
//        if((df instanceof Detailticket)) {
//            Detailticket dt = (Detailticket) df;
//            if(cal==null) cal = Calendar.getInstance();
//            cal.setTime(dt.getCode_facture().getDate_fin_prevu());
//            dt.setHeure_debut(cal.getTime());
//        }
        return df;
    }
    @Override
    public Detailfacture create(Detailfacture df) throws Exception {

        //Calcul de l'heure de fin prevu
        if((df instanceof Detailticket)) {
            if(df.getCode_produit() instanceof ProduitService){
                Detailticket dt = (Detailticket) df;
                if(cal==null) cal = Calendar.getInstance();
                cal.setTime(dt.getCode_facture().getDate_fin_prevu());
                dt.setHeure_debut(cal.getTime());
//                cal.setTime(dt.getHeure_debut());
                cal.add(Calendar.MINUTE, dt.getDuree());
                dt.setHeure_fin_prevu(cal.getTime());
            }
        }
        if((df instanceof Detailfacturechambre)) {
            Detailfacturechambre dt = (Detailfacturechambre) df;
            if(cal==null) cal = Calendar.getInstance();
            cal.setTime(dt.getDate_debut());
            cal.add(Calendar.DAY_OF_YEAR, dt.getQuantite().intValue());
            dt.setDate_fin_prevu(cal.getTime());
        }
        df = super.create(df);
        return df;
    }

    @Override
    public Detailfacture update(Detailfacture df) throws Exception {

        //Il faut controler si la peiement n'était pas déjà valide
        return super.update(df);
    }

//    @Autowired
//    TypepaiementService tps;

}

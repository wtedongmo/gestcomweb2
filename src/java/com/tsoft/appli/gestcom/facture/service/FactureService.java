/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.service;

import com.tsoft.appli.gestcom.facture.model.Facture;
import com.tsoft.appli.gestcom.facture.model.Factures;
import com.tsoft.appli.gestcom.facture.model.Ticket;
import com.tsoft.appli.gestcom.facture.utils.ValeurCategoriefacture;
import com.tsoft.appli.gestcom.facture.utils.ValeurEtatticket;
import com.tsoft.appli.gestcom.facture.utils.ValeurTypefacture;
import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.appli.gestcom.utils.DefaultParams;
import com.tsoft.dao.hibernate.service.HibernateService;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class FactureService extends HibernateService<Facture> {

//    @Autowired
//    CaisseService caisserv;
//
//    @Autowired
//    ClotureperiodeService cps;
    
    @Autowired
    TypefactureService typef;
    @Autowired
    CategoriefactureService catf;
    @Autowired
    EtatticketService etatt;
    
    @Autowired
    DefaultParams defparams;

    @Override
    public Facture addDefaultsValues(Facture ft) throws Exception{
        if(defparams!=null) {
            Comptepersonne cpf = defparams.getDefaultCompteFournisseur();
            if(cpf != null) ft.setCompte_fournisseur(cpf);
        }
        ft.setDate_facture(new Date());
        if(ft instanceof Factures) ((Factures)ft).setType_facture(typef.getTypefacture(1));
        if(ft instanceof Ticket) ((Ticket)ft).setDuree_total(0);
        ft.setCategorie_facture(catf.getCategoriefacture(1));
        return ft;
    }

    @Override
    public Facture create(Facture ft) throws Exception {

        //copie de la methode prepersist
        //Fixer la date a la date du jour
        Date date_fact = ft.getDate_facture();
        if (date_fact == null) {
            ft.setDate_facture(new Date());
        }

        //On controle si la periode est ouverte
//        CaisseService caisserv = new CaisseService();
//        Caisse caisse =  caisserv.getCaisse();
//        ClotureperiodeService cps = new ClotureperiodeService();
//        Clotureperiode cper = cps.getClotureperiode(ft.getDate_paiement(), caisse);
//        if (cper == null) {
//            throw new BusinessException("Periode non ouverte");
//        }
        Comptepersonne cpc = ft.getCompte_client();
        if (cpc == null) {
            throw new HibernateException("Le compte client ne doit pas etre vide");
        }

        //On fixe le compte fournisseur
        Comptepersonne cpf = ft.getCompte_fournisseur();
        if (cpf == null) {
            if(defparams!=null) 
                cpf = defparams.getDefaultCompteFournisseur();
            if (cpf == null) {
                throw new HibernateException("Le compte fournisseur ne doit pas etre vide");
            }
            ft.setCompte_fournisseur(cpf);
        }
        if (cpc.getCode() == cpf.getCode()) {
            throw new HibernateException("Le compte client " + cpc.getLibelle() + " ne doit pas etre le meme que "
                    + "le compte fournisseur " + cpf.getLibelle());
        }
        if((ft instanceof Ticket)) {
            Ticket tick = (Ticket) ft;
            if(tick.getDate_fin_prevu()==null) tick.setDate_fin_prevu(tick.getDate_debut());
        }
        List list = majCompteFacture(ft);
        if(list==null)
            ft = super.create(ft);
        else super.saveAll(list);
        return ft;
    }

    Calendar cal;
    @Override
    public Facture update(Facture ft) throws Exception {

        //Il faut controler si la peiement n'était pas déjà valide
        
//        ft =  super.update(ft);
        //Calcul de l'heure de fin prevu
        if((ft instanceof Ticket)) {
            Ticket tick = (Ticket) ft;
            if(cal==null) cal = Calendar.getInstance();
            cal.setTime(tick.getDate_debut());
            cal.add(Calendar.MINUTE, tick.getDuree_total());
            tick.setDate_fin_prevu(cal.getTime());
        }
        ft =  super.update(ft);
        return ft;
    }

//    @Autowired
//    TypepaiementService tps;

    private List majCompteFacture(Facture ft) throws Exception {

        Double montant = ft.getTotal_ttc();
        List tosave = new ArrayList();
        tosave.add(ft);
        if(montant==null) return null;
        if(!(ft.getCategorie_facture().getCode() == ValeurCategoriefacture.FACTURE))
            return null;
        Comptepersonne cpc = ft.getCompte_client();
        Comptepersonne cpf = ft.getCompte_fournisseur();

        boolean bool = ((ft instanceof Ticket) && ((Ticket)ft).getEtat_ticket().getCode()==ValeurEtatticket.REALISE) 
                || ((ft instanceof Factures) && ((Factures)ft).getType_facture().getCode()==ValeurTypefacture.VENTE);
        
        Double credit, debit;
        if(bool){
            credit = cpc.getCredit();
            if (credit == null) {
                credit = 0.0;
            }
            debit = cpf.getDebit();
            if (debit == null) {
                debit = 0.0;
            }
            cpc.setCredit(credit + montant);
            cpf.setDebit(debit + montant);
        }
//        else if((ft instanceof Factures) && ((Factures)ft).getType_facture().getCode()==ValeurTypefacture.VENTE){
//            credit = cpf.getCredit();
//            if (credit == null) {
//                credit = 0.0;
//            }
//            debit = cpc.getDebit();
//            if (debit == null) {
//                debit = 0.0;
//            }
//            cpc.setDebit(debit + montant);
//            cpf.setCredit(credit + montant);
//        } 
            
        tosave.add(ft);
        tosave.add(cpc);
        tosave.add(cpf);
        return tosave;

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.paiement.service;

import com.tsoft.appli.gestcom.paiement.model.Caisse;
import com.tsoft.appli.gestcom.paiement.model.Paiement;
import com.tsoft.appli.gestcom.paiement.utils.ValeurValide;
import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.appli.gestcom.security.model.Clotureperiode;
import com.tsoft.appli.gestcom.security.service.ClotureperiodeService;
import com.tsoft.appli.gestcom.utils.DefaultParams;
import com.tsoft.dao.hibernate.service.HibernateService;
import com.tsoft.exceptions.BusinessException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
public class PaiementService extends HibernateService<Paiement> {

//    @Autowired
//    DefaultService service;
//    @Autowired
//    SessionFactory sessionFactory;
//    @Autowired
//    DefaultParams defparams;
//    
    @Autowired
    CaisseService caisserv;

    @Autowired
    ClotureperiodeService cps;
    
    @Autowired
    TypepaiementService typepaie;
    @Autowired
    ModepaiementService modepaie;
    
    @Autowired
    DefaultParams defparams;

    @Override
    public Paiement addDefaultsValues(Paiement pm) throws Exception{
        if(defparams!=null) {
            Comptepersonne cpf = defparams.getDefaultCompteFournisseur();
            if(cpf != null) pm.setCompte_fournisseur(cpf);
        }
        pm.setDate_paiement(new Date());
        pm.setType_paiement(typepaie.getTypepaiement(1));
        pm.setMode_paiement(modepaie.getModepaiement(1));
        return pm;
    }
            
    @Override
    public Paiement create(Paiement pm) throws Exception {

        //copie de la methode prepersist
        //Fixer la date a la date du jour
        Date date_paie = pm.getDate_paiement();
        if (date_paie == null) {
            pm.setDate_paiement(new Date());
        }

        //On controle si la periode est ouverte
//        CaisseService caisserv = new CaisseService();
        Caisse caisse =  caisserv.getCaisse();
//        ClotureperiodeService cps = new ClotureperiodeService();
        Clotureperiode cper = cps.getClotureperiode(pm.getDate_paiement(), caisse);
        if (cper == null) {
            throw new BusinessException("Periode non ouverte");
        }

        if ((pm.getEntree() == null && pm.getSortie() == null)
                || (pm.getEntree() != null && pm.getEntree() == 0 && pm.getSortie() == null)
                || (pm.getEntree() == null && pm.getSortie() != null && pm.getSortie() == 0)
                || (pm.getEntree() != null && pm.getEntree() == 0 && pm.getSortie() != null && pm.getSortie() == 0)) {
            throw new HibernateException("Aucun montant pécise");
        }

//        Senspaiement sp = pmut.getSenspaiement(ValeurSenspaiement.ENTREE);
//        if (pm.getSens() == null) {
//            pm.setSens(new Senspaiement(1));
//        }
//        Double montant = pm.getMontant();
//        if (montant == null || montant.doubleValue() == 0) {
//            throw new HibernateException("Le Montant ne doit pas etre vide");
//        }
        Comptepersonne cpc = pm.getCompte_client();
        if (cpc == null) {
            throw new HibernateException("Le compte client ne doit pas etre vide");
        }

        //On fixe le compte fournisseur
        Comptepersonne cpf = pm.getCompte_fournisseur();
        if (cpf == null) {
//            int compt_fourn_default =2;
//            cpf = (ComptePersonne) dao.getById(compt_fourn_default, ComptePersonne.class);
//            cpf = defparams.getDefaultCompteFournisseur();
            if (cpf == null) {
                throw new HibernateException("Le compte fournisseur ne doit pas etre vide");
            }
        }
        if (cpc.getCode() == cpf.getCode()) {
            throw new HibernateException("Le compte client " + cpc.getLibelle() + " ne doit pas etre le meme que "
                    + "le compte fournisseur " + cpf.getLibelle());
        }
        pm.setCompte_fournisseur(cpf);

        //MAJ des compte personnes
//        Double debit, credit;// = cps.getDebit();
        
        pm.setCaisse(caisse);

        if (pm.getValide() != null && pm.getValide() != ValeurValide.VALIDE) {
            pm = (Paiement) super.create(pm);
            if (pm.getReference() != null) {
                return pm;
            }
            Date date = pm.getDate_paiement();
            DateFormat datf = new SimpleDateFormat("yyyy/MM/dd");
            int code = pm.getCode();
            String ref = code + "/" + datf.format(date);
            pm.setReference(ref);
            super.update(pm);
            return pm;
        }
        List tosave = majComptePaiement(pm);

        //Ceci doit etre une operation transactionnelle
//        List tosave = new ArrayList();
//         tosave.add(pm);
//         tosave.add(cpc);
//         tosave.add(cpf);
        // updateComptes(cpc, cpf);
        super.saveAll(tosave);
//        pm = (Paiement) dao.create(pm);
//        dao.update(cpf);
//        dao.update(cpc);

        //Fixation de la reference
        if (pm.getReference() != null) {
            return pm;
        }
        Date date = pm.getDate_paiement();
        DateFormat datf = new SimpleDateFormat("yyyy/MM/dd");
        int code = pm.getCode();
        String ref = code + "/" + datf.format(date);
        pm.setReference(ref);
        super.update(pm);
        return pm;
    }

    @Override
    public Paiement update(Paiement pm) throws Exception {

        //Il faut controler si la peiement n'était pas déjà valide
        return super.update(pm);
    }

//    @Autowired
//    TypepaiementService tps;

    private List majComptePaiement(Paiement pm) throws Exception {

        Double entree = pm.getEntree();
        Double sortie = pm.getSortie();
        double montant = 0;
//        if(entree!=null && sortie==null)
//            montant = entree;
//        else if(entree==null && sortie!=null)
//        - (sortie==null ? 0:sortie);

        Comptepersonne cpc = pm.getCompte_client();
        Comptepersonne cpf = pm.getCompte_fournisseur();

        Double credit, debit;
//        TypepaiementService tps = new TypepaiementService();
//        if(((pm.getType_paiement().getCode() == tps.getTypepaiement(ValeurTypepaiement.CLIENT).getCode()) 
//                && ((entree!=null && sortie==null) || ((entree!=null && sortie!=null) && (entree>sortie)))) 
//            || ((pm.getType_paiement().getCode() == tps.getTypepaiement(ValeurTypepaiement.FOURNISSEUR).getCode()) 
//                && ((entree==null && sortie!=null) || ((entree!=null && sortie!=null) && (entree<sortie))))){ 
        if ((entree != null && sortie == null) || ((entree != null && sortie != null) && (entree > sortie))) {
            if (entree != null && sortie == null) {
                montant = entree;
            } else {
                montant = entree - sortie;
            }
//            else if(entree==null && sortie!=null)
//                montant = sortie;
//            else
//                montant = -entree +sortie;
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
        } else {
            if (entree == null && sortie != null) {
                montant = sortie;
            } else {
                montant = -entree + sortie;
            }

            credit = cpf.getCredit();
            if (credit == null) {
                credit = 0.0;
            }
            debit = cpc.getDebit();
            if (debit == null) {
                debit = 0.0;
            }
            cpc.setDebit(debit + montant);
            cpf.setCredit(credit + montant);
        }

        List tosave = new ArrayList();
        tosave.add(pm);
        tosave.add(cpc);
        tosave.add(cpf);
        return tosave;

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.utils;

import com.tsoft.appli.gestcom.person.model.Comptepersonne;
import com.tsoft.appli.gestcom.security.model.Parametre;
import com.tsoft.appli.gestcom.person.model.Personne;
import com.tsoft.dao.hibernate.service.HibernateService;
import com.tsoft.dao.hibernate.service.HibernateServiceWrapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author Tedongmo
 */
@Service
public class DefaultParams {
    
    @Autowired
    HibernateServiceWrapper service;

    private Personne Default_Person=null;
    private Comptepersonne Default_Compte=null;
    private boolean recherche_cp_def=false;
    private Personne Default_Fournisseur=null;
    private Personne Default_Client=null;
    private Comptepersonne Default_Compte_Fournisseur=null;
    private boolean recherche_cp_fournis=false;
    private Comptepersonne Default_Compte_Client=null;
    private boolean recherche_cp_client=false;
    
    private static DefaultParams instance;
    
    private DefaultParams (){}
    
    public DefaultParams getInstance(){
        if(instance == null) {
            try {
                instance = new DefaultParams(); 
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return instance;
    }
        
    public Comptepersonne getDefaultComptePersonne() throws Exception{
//        if(Default_Compte!=null) return Default_Compte;
//        List<ComptePersonne> list_p = service.getAll(ComptePersonne.class,
//                "select p from ComptePersonne p where p.libelle ='Default Compte Person'");
//        if(list_p==null) 
//            Default_Compte = (ComptePersonne) service.getById("4", ComptePersonne.class);
//        else Default_Compte = list_p.get(0);
//        return Default_Compte;
        if(recherche_cp_def==true) return Default_Compte;
        List<Parametre> list_p = service.getAll(Parametre.class,
                "select p from Parametre p where p.codeparams ='default.compte'");
        recherche_cp_def = true;
        if(CollectionUtils.isEmpty(list_p)) 
            return null;
        String code_comptepers = list_p.get(0).getValeur();
        Default_Compte = (Comptepersonne) service.getById(Integer.parseInt(code_comptepers), Comptepersonne.class);
        return Default_Compte;
    }
    
    public Comptepersonne getDefaultCompteFournisseur() throws Exception{
        
        if(recherche_cp_fournis==true) return Default_Compte_Fournisseur;
        List<Parametre> list_p = service.getAll(Parametre.class,
                "select p from Parametre p where p.codeparams ='default.compte.fournisseur'");
        recherche_cp_fournis = true;
        if(CollectionUtils.isEmpty(list_p)) 
            return null;
        String code_comptepers = list_p.get(0).getValeur();
        Default_Compte_Fournisseur = (Comptepersonne) service.getById(Integer.parseInt(code_comptepers), Comptepersonne.class);
        return Default_Compte_Fournisseur;
    }
    
    public Comptepersonne getDefaultCompteClient() throws Exception{
        if(recherche_cp_client==true) return Default_Compte_Client;
        List<Parametre> list_p = service.getAll(Parametre.class,
                "select p from Parametre p where p.codeparams ='default.compte.cleint'");
        recherche_cp_client = true;
        if(CollectionUtils.isEmpty(list_p)) 
            return null;
        String code_comptepers = list_p.get(0).getValeur();
        Default_Compte_Client = (Comptepersonne) service.getById(Integer.parseInt(code_comptepers), Comptepersonne.class);
        return Default_Compte_Client;
    }
    
    private String CheminImageEntete=null;
    public String getCheminImageEntete(){
        return null ; 
//        if(CheminImageEntete != null) {
//            if(CheminImageEntete.equals("")) return null;
//            return CheminImageEntete;
//        }
//        List<Parametre> list_p = service.getAll(Parametre.class,
//                "select p from Parametre p where p.codeparams ='mtn.chemin.image.entete'");
//        if(!CollectionUtils.isEmpty(list_p)) {
//            Parametre par = list_p.get(0);
//            CheminImageEntete = par.getValeur();
//        } else CheminImageEntete="";
//        return CheminImageEntete;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.facture.service;

import com.tsoft.appli.gestcom.facture.model.Typefacture;
import com.tsoft.appli.gestcom.paiement.service.*;
import com.tsoft.appli.gestcom.paiement.model.Typepaiement;
import com.tsoft.dao.hibernate.service.HibernateService;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class EtatticketService extends HibernateService<Typefacture> {

    public Typefacture getTypefacture(int code) throws Exception{
        Typefacture tp = getById(code, Typefacture.class);
        return tp;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.paiement.service;

import com.tsoft.appli.gestcom.paiement.model.Modepaiement;
import com.tsoft.dao.hibernate.service.HibernateService;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class ModepaiementService extends HibernateService<Modepaiement> {

    public Modepaiement getModepaiement(int code) throws Exception{
        Modepaiement tp = getById(code, Modepaiement.class);
        return tp;
    }
}

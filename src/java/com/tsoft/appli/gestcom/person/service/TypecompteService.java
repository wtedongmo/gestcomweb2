/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.person.service;

import com.tsoft.appli.gestcom.paiement.service.*;
import com.tsoft.appli.gestcom.paiement.model.Typepaiement;
import com.tsoft.appli.gestcom.person.model.Typecompte;
import com.tsoft.dao.hibernate.service.HibernateService;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class TypecompteService extends HibernateService<Typecompte> {

    public Typecompte getTypecompte(int code) throws Exception{
        Typecompte tp = getById(code, Typecompte.class);
        return tp;
    }
}

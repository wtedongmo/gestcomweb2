/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.paiement.service;

import com.tsoft.appli.gestcom.paiement.model.Caisse;
import com.tsoft.dao.hibernate.service.HibernateService;
import com.tsoft.exceptions.BusinessException;
import com.tsoft.security.model.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class CaisseService extends HibernateService<Caisse> {

    public Caisse getCaisse() throws Exception {
        User u=((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        Caisse c = getOne(Caisse.class, "select c from Caisse c  where c.gerant.code= "+u.getCode());
        if (c == null) {
            throw new BusinessException("Aucune Caisse associé à ce gerant");
        }
        return c;
    }
}

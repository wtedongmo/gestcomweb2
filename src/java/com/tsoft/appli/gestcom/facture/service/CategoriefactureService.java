/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tsoft.appli.gestcom.facture.service;

import com.tsoft.appli.gestcom.facture.model.Categoriefacture;
import com.tsoft.dao.hibernate.service.HibernateService;
import org.springframework.stereotype.Service;

/**
 *
 * @author Tedongmo
 */
@Service
public class CategoriefactureService extends HibernateService<Categoriefacture> {

    public Categoriefacture getCategoriefacture(int code) throws Exception{
        Categoriefacture tp = getById(code, Categoriefacture.class);
        return tp;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.facture.utils;

import com.tsoft.appli.gestcom.paiement.utils.*;

/**
 *
 * @author Tedongmo
 */
public enum ValeurTypefacture1 {

    INCONNUE(6),
    VENTE(1), ACHAT(2), DEPOT(3), TRANSFERT_ENTREE(4), TRANSFERT_SORTIE(5);
//    public final static int VENTE=1;
//    public final static int ACHAT=2;
//    public final static int DEPOT=3;
//    public final static int TRANSFERT_ENTREE=4;
//    public final static int TRANSFERT_SORTIE=5;
//    public final static int INCONNU=6;
    private final int valeur;

    private ValeurTypefacture1(int valeur) {
        this.valeur = valeur;
    }

    public int getValue() {
        return this.valeur;
    }
}

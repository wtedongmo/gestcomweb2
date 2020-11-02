/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcommtn.reports.utils;

import com.lowagie.text.*;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author User
 */
public class ConstruireTableImpl {
    
    public void construireTablePDF(List<Object[]> listobjtab, Table gr, int[] cols, String[] champs, String[] capts) 
            throws Exception{
        
        for(String st : capts){
            Cell cell = new Cell(new Chunk(st, FontFactory.getFont(FontFactory.TIMES, 12, Font.BOLD, null)));
               gr.addCell(cell);      
        }
        gr.endHeaders();
        
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat decf = new DecimalFormat("#,##0");
        for(Object[] objtab : listobjtab){
            for(int i : cols){
                String st= "";
                if(objtab[i] instanceof Date){
                    st = dateFormat.format((Date)objtab[i]);
                }else if(objtab[i] instanceof Double){
                    st = decf.format(objtab[i]);
                } else                 
                    st= objtab[i].toString();
                Cell cell = new Cell(new Chunk(st, FontFactory.getFont(FontFactory.TIMES, 12, Font.NORMAL, null)));
                gr.addCell(cell);
            }       
        }
    }
    
}

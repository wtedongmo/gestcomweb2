/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcommtn.reports.utils;

import com.lowagie.text.BadElementException;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import java.util.*;
import java.awt.event.*;
import java.awt.*;

/**
 *
 * @author KameniJaures
 */
public class EnteteImage {

    public EnteteImage() {
    }

    
    
    public static void invisible(com.lowagie.text.Cell cell) {
        cell.setBorder(1);
        cell.setBorderColor(java.awt.Color.WHITE);
    }
    
    static String imgEntete;

    public static void setEntetePDF(Document document, String imgEntete) throws Exception {
        if (imgEntete!=null) {
            com.lowagie.text.Image image3 = com.lowagie.text.Image.getInstance(imgEntete);
            com.lowagie.text.Table image = new com.lowagie.text.Table(1);

            image.setBorderWidth(0);
            image.setBorder(0);
            image.setWidth(80);
            image.setPadding(0);
            image.setSpacing(0);

            Cell img = new com.lowagie.text.Cell();
            img.add(image3);
            invisible(img);
            image.addCell(img);
            com.lowagie.text.Paragraph paragraph2 = new com.lowagie.text.Paragraph();
            paragraph2.add(image);

            document.add(image);
        }
    }

    public static void addImagePDF(Document document, String chemin_image,
            int width) throws Exception {
        if (chemin_image!=null) {
            com.lowagie.text.Image image3 = com.lowagie.text.Image.getInstance(chemin_image);
            com.lowagie.text.Table image = new com.lowagie.text.Table(1);

            image.setBorderWidth(0);
            image.setBorder(0);
            image.setWidth(width);
            image.setPadding(0);
            image.setSpacing(0);
            Cell img = new com.lowagie.text.Cell();
            img.add(image3);
            invisible(img);
            image.addCell(img);
            com.lowagie.text.Paragraph paragraph2 = new com.lowagie.text.Paragraph();
            paragraph2.add(image);
            document.add(image);
        }
    }
}

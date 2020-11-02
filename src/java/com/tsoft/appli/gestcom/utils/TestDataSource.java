/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsoft.appli.gestcom.utils;

import java.sql.Connection;
import java.sql.SQLException;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import com.tsoft.appli.gestcom.paiement.reports.JournalCaisseReport;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TestDataSource {

    static Connection connection=null;
    public static Connection getConnection() {

        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("cimi-pc");
//    dataSource.setPort(3307);

        dataSource.setServerName("localhost");
        dataSource.setPort(3307);
        dataSource.setDatabaseName("gestcomweb");

        try {
            connection = dataSource.getConnection();

            // utilisation de la connexion
            System.out.println("Connexion reussie");
            return connection;
//            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void getCloseConnection() throws SQLException {
        connection.close();
    }
    public static void main(String[] args) {
        try {
            JournalCaisseReport pmpr = new JournalCaisseReport();
            Map map = new HashMap();
//            map.put("msisdn", "237670005708");
//            map.put("date_debut", "2015/05/20");
            map.put("date_jour", "2015/09/26");
            
            String destfile = "."+File.separator + "Journal Caisse"
                    + System.currentTimeMillis() + ".pdf";
            
            pmpr.buildReport(map, destfile, getConnection());
            System.out.println(destfile);
            getCloseConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}

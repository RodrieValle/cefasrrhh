/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Rodrigo
 */
public class ConexionDB {
    private static Connection conexion;
    private static final String url = "jdbc:mysql://www.db4free.net:3306/cefasrrhhdb";
    private static final String usuario = "cefasusuariodb";
    private static final String password = "we7854*/++";
    
    
    public static synchronized Connection getConexion(){
        if(conexion == null)
        {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conexion = DriverManager.getConnection(url, usuario, password);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            } 
        }
        return conexion;
    }
    
    public static synchronized void cerrarConexion(){
        conexion = null;
    } 
    
}

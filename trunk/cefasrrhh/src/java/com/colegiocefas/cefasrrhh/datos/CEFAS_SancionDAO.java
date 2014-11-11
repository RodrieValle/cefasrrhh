/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_SancionDAO {
    private final String SQL_INSERT = "INSERT INTO CEFAS_SANCION (EMPCODIGO,SCNCODIGO,SCNFECHA,SCNMOTIVO,SCNSANCION) VALUES (?, ?, ?, ?, ?)";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public void almacenarSancion(CEFAS_Sancion sancion){
         try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1,sancion.getEmpCodigo());
            ps.setString(2,sancion.getScnCodigo());
            ps.setDate(3, new Date(sancion.getScnFecha().getTime()));
            ps.setString(4,sancion.getScnMotivo());
            ps.setString(5,sancion.getScnSancion());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_SancionDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
    }
    
}

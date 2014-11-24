/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;


import com.colegiocefas.cefasrrhh.dominio.CEFAS_Bitacora;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_BitacoraDAO {
    private final String SQL_INSERT = "INSERT INTO CEFAS_BITACORA (USRCODIGO, BTCFECHAHORA, BTCDESCRIPCION) VALUES (?, ?, ?)";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    
    public void guardarAccion(CEFAS_Bitacora bitacora) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, bitacora.getUserCodigo());
            ps.setDate(2, new Date(bitacora.getBtcFechaHora().getTime()));
            ps.setString(3, bitacora.getBtcDescripcion());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_BitacoraDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
    
}

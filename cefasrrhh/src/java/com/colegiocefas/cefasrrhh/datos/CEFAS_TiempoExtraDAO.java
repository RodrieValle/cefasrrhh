/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_TiempoExtra;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_TiempoExtraDAO {
      private final String SQL_INSERT = "INSERT INTO CEFAS_TIEMPOEXTRA (EMPCODIGO,EMPSUSTITUTO,TEXFECHA,TEXHORAINICIO,TEXHORAFIN,TEXDELTATIEMPO,TEXVALORDINERO) VALUES (?,?,?,?,?,?,?)";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    public void guardaHorasExtras(CEFAS_TiempoExtra textra){
    
     try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            
            ps.setInt(1, textra.getEmpCodigo());
            ps.setInt(2, textra.getTexCodigo2());
            ps.setDate(3, new Date(textra.getTexFecha().getTime()));
            ps.setString(4, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(textra.getTexHoraInicio()));
            ps.setString(5, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(textra.getTexHoraFin()));
            ps.setDate(6, null);
            ps.setFloat(7,textra.getTexValorDinero());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_TiempoExtra.class.getName()).log(Level.SEVERE, null, ex);
    
    }
    
}
}

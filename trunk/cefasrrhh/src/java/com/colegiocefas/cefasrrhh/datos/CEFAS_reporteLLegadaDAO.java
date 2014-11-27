/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_TiempoExtra;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_reporteLLegada;
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
 * @author ANIBAL
 */
public class CEFAS_reporteLLegadaDAO {
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_REPORTELLEGADA (EMPCODIGO, REPFECHA, REPENTRADA, REPHORALLEGADA, REPMINUTOS, REPVALORDINERO) VALUES (?,?,?,?,?,?)";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
  public void guardarReporteLLegada(CEFAS_reporteLLegada report){
    
     try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            
            ps.setInt(1, report.getEmpCodigo());
            ps.setDate(2, new Date(report.getRepFecha().getTime()));
            ps.setString(3, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(report.getRepHoraEntrada()));
            ps.setString(4, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(report.getRepHorallegada()));
            ps.setDate(5, null);
            ps.setFloat(6,report.getRepValorDinero());
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

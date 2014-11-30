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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ANIBAL
 */
public class CEFAS_reporteLLegadaDAO {
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_REPORTELLEGADA (EMPCODIGO, REPFECHA, REPENTRADA, REPHORALLEGADA, REPMINUTOS, REPVALORDINERO) VALUES (?,?,?,?,?,?)";
    private final String SQL_SELECT_DATE = "SELECT * FROM CEFAS_REPORTELLEGADA WHERE EMPCODIGO= ? and REPFECHA>= ?";
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
  
  
  
   
    //>>>>>>>>>>>>>>>>>>>>>CALCULO DE LAS LLEGADAS TARDE DESDE EL ULTIMO CORTE DE PLANILLA<<<<<<<<<<<<<<<<<<<<<
     
    public List<CEFAS_reporteLLegada> getllegadasEmpleadoFecha(int codigo, java.util.Date fecha)
    {
         //retorna todos los anticipos de un empleado
     
        List<CEFAS_reporteLLegada> listLlegadas = new ArrayList<CEFAS_reporteLLegada>();
        CEFAS_reporteLLegada llegada;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_DATE);
            ps.setInt(1, codigo);
            ps.setDate(2, new Date(fecha.getTime()));
            rs = ps.executeQuery();
            while(rs.next())
            {
    // EMPCODIGO, REPFECHA, REPENTRADA, REPHORALLEGADA, REPMINUTOS, REPVALORDINERO
                llegada = new CEFAS_reporteLLegada();
                llegada.setRepCodigo(rs.getInt("repCodigo"));
                llegada.setEmpCodigo(rs.getInt("empCodigo"));
                llegada.setRepFecha(rs.getDate("repFecha"));
                llegada.setRepHoraEntrada(rs.getDate("repEntrada"));
                llegada.setRepHorallegada(rs.getDate("repHoraLlegada"));
                llegada.setRepMinutos(rs.getDate("repMinutos"));
                llegada.setRepValorDinero(rs.getFloat("repValorDinero"));
                listLlegadas.add(llegada);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_reporteLLegadaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listLlegadas;
    }
  
}

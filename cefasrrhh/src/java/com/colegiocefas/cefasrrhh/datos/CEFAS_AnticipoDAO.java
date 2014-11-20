/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

/**
 *
 * @author 
 */

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo;
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


public class CEFAS_AnticipoDAO {
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_ANTICIPO (EMPCODIGO, ATPFECHA, ATPCANTIDAD) VALUES (?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_ANTICIPO WHERE EMPCODIGO LIKE ?";
     private final String SQL_SELECT_DATE = "";
    private final String SQL_SELECTBYID = "SELECT * FROM CEFAS_ANTICIPO WHERE ATPCODIGO LIKE ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_ANTICIPO SET EMPCODIGO = ?, ATPFECHA = ?,"
            + " ATPCANTIDAD = ?, WHERE ATPCODIGO = ?";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    
    /*      RETORNA ANTICIPOS DE EMPLEADO A UNA FECHA DADA
    public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo, String fecha)
    {
       //retorna todos los anticipos de un empleado
     
        List<CEFAS_Anticipo> listAnticipos = new ArrayList<CEFAS_Anticipo>();
        CEFAS_Anticipo anticipo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                anticipo = new CEFAS_Anticipo();
                anticipo.setAtpCodigo(rs.getInt("atpCodigo"));
                anticipo.setEmpCodigo(rs.getInt("empCodigo"));
                anticipo.setAtpFecha(rs.getDate("atpFecha"));
                anticipo.setAtpCantidad(rs.getFloat("atpCantidad"));
                listAnticipos.add(anticipo);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAnticipos;
    }
    */
    
    
    public CEFAS_Anticipo getAnticipo(int codigo)
    {
       //retorna todos los anticipos de un empleado
     
        
        CEFAS_Anticipo anticipo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTBYID);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                anticipo = new CEFAS_Anticipo();
                anticipo.setAtpCodigo(rs.getInt("atpCodigo"));
                anticipo.setEmpCodigo(rs.getInt("empCodigo"));
                anticipo.setAtpFecha(rs.getDate("atpFecha"));
                anticipo.setAtpCantidad(rs.getFloat("atpCantidad"));
                
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return anticipo;
    }
    
    
    
    //Retorna todos los anticipos del empleado
     public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo)
    {
       //retorna todos los anticipos de un empleado
     
        List<CEFAS_Anticipo> listAnticipos = new ArrayList<CEFAS_Anticipo>();
        CEFAS_Anticipo anticipo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                anticipo = new CEFAS_Anticipo();
                anticipo.setAtpCodigo(rs.getInt("atpCodigo"));
                anticipo.setEmpCodigo(rs.getInt("empCodigo"));
                anticipo.setAtpFecha(rs.getDate("atpFecha"));
                anticipo.setAtpCantidad(rs.getFloat("atpCantidad"));
                listAnticipos.add(anticipo);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAnticipos;
    }
    
     
     
     
    
     public void almacenarAnticipo(CEFAS_Anticipo anticipo) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, anticipo.getEmpCodigo());
            ps.setDate(2, new Date(anticipo.getAtpFecha().getTime()));
            ps.setDouble(3, anticipo.getAtpCantidad());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
     
     public void actualizarAnticipo(CEFAS_Anticipo anticipo) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_UPDATE);
            ps.setInt(1, anticipo.getEmpCodigo());
            ps.setDate(2, new Date(anticipo.getAtpFecha().getTime()));
            ps.setDouble(3, anticipo.getAtpCantidad());
            ps.setInt(4, anticipo.getAtpCodigo());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
     
     
     
     //>>>>>>>>>>>>>>>>>>>>>CALCULO DE LOS ANTICIPOS DESDE EL ULTIMO CORTE DE PLANILLA<<<<<<<<<<<<<<<<<<<<<
     
    public List<CEFAS_Anticipo> getAnticiposEmpleadoFecha(int codigo, Date fecha)
    {
        //retorna todos los anticipos de un empleado dentro de la planilla
     
        List<CEFAS_Anticipo> listAnticipos = new ArrayList<CEFAS_Anticipo>();
        CEFAS_Anticipo anticipo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_DATE);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                anticipo = new CEFAS_Anticipo();
                anticipo.setAtpCodigo(rs.getInt("atpCodigo"));
                anticipo.setEmpCodigo(rs.getInt("empCodigo"));
                anticipo.setAtpFecha(rs.getDate("atpFecha"));
                anticipo.setAtpCantidad(rs.getFloat("atpCantidad"));
                listAnticipos.add(anticipo);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AnticipoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAnticipos;
    }
      
      
     
    
}

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


import com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento;
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



public class CEFAS_OrdenDeDescuentoDAO {
    
    
    
    
       private final String SQL_INSERT = "INSERT INTO CEFAS_ORDENDEDESCUENTO (EMPCODIGO, ODDFECHA, ODDMONTO, ODDPLAZO, ODDSALDO, ODDCUOTA) VALUES (?, ?, ?, ?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_ORDENDEDESCUENTO WHERE EMPCODIGO LIKE ?";
    private final String SQL_SELECTBYID = "SELECT * FROM CEFAS_ORDENDEDESCUENTO WHERE ODDCODIGO LIKE ?";
    private final String SQL_SELECTALL = "SELECT * FROM CEFAS_ORDENDEDESCUENTO";
    private final String SQL_UPDATE = "UPDATE CEFAS_ORDENDEDESCUENTO SET EMPCODIGO = ?, ODDFECHA = ?,"
            + " ODDMONTO = ?, ODDPLAZO = ?, ODDSALDO = ?, ODDCUOTA = ?,WHERE ODDCODIGO = ?";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    
  
    
    public CEFAS_OrdenDeDescuento getOrdenDescuento(int codigo)
    {
       //retorna todos los anticipos de un empleado
     
        
        CEFAS_OrdenDeDescuento orden = null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTBYID);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                orden = new CEFAS_OrdenDeDescuento();
                orden.setOddCodigo(rs.getInt("oddCodigo"));
               orden.setEmpCodigo(rs.getInt("empCodigo"));
                orden.setOddFecha(rs.getDate("oddFecha"));
                orden.setOddMonto(rs.getFloat("oddMonto"));
                orden.setOddPlazo(rs.getInt("oddPlazo"));
                orden.setOddSaldo(rs.getFloat("oddSaldo"));
                orden.setOddCuota(rs.getFloat("oddCuota"));
                
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_OrdenDeDescuentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orden;
    }
    

    //Retorna todos las ordenes del sistema
     public List<CEFAS_OrdenDeDescuento> getOrdenDeDescuentos()
    {
       //retorna todos los anticipos de un empleado
     
        List<CEFAS_OrdenDeDescuento> listOrdenes = new ArrayList<CEFAS_OrdenDeDescuento>();
        CEFAS_OrdenDeDescuento orden= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTALL);
            //ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
               orden = new CEFAS_OrdenDeDescuento();
                orden.setOddCodigo(rs.getInt("oddCodigo"));
               orden.setEmpCodigo(rs.getInt("empCodigo"));
                orden.setOddFecha(rs.getDate("oddFecha"));
                orden.setOddMonto(rs.getFloat("oddMonto"));
                orden.setOddPlazo(rs.getInt("oddPlazo"));
                orden.setOddSaldo(rs.getFloat("oddSaldo"));
                orden.setOddCuota(rs.getFloat("oddCuota"));
                listOrdenes.add(orden);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_OrdenDeDescuentoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listOrdenes;
    }
    
   
     public void almacenarOrdenDeDescuento(CEFAS_OrdenDeDescuento orden) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, orden.getEmpCodigo());
            ps.setDate(2, new Date(orden.getOddFecha().getTime()));
            ps.setDouble(3, orden.getOddMonto());
            ps.setDouble(4, orden.getOddPlazo());
            ps.setDouble(5, orden.getOddSaldo());
            ps.setDouble(6, orden.getOddCuota());
            int n=ps.executeUpdate();            

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_OrdenDeDescuentoDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
     
     
     
     public void actualizarOrdenDeDescuento(CEFAS_OrdenDeDescuento orden) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_UPDATE);
            ps.setInt(1, orden.getEmpCodigo());
            ps.setDate(2, new Date(orden.getOddFecha().getTime()));
            ps.setDouble(3, orden.getOddMonto());
            ps.setDouble(4, orden.getOddPlazo());
            ps.setDouble(5, orden.getOddSaldo());
            ps.setDouble(6, orden.getOddCuota());
           
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_OrdenDeDescuentoDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
     
    
    
    
    
}

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

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo;
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

public class CEFAS_PrestamoDAO {
    
    
    
    
       private final String SQL_INSERT = "INSERT INTO CEFAS_PRESTAMO (EMPCODIGO, PRMFECHA, PRMMONTO, PRMPLAZO, PRMSALDO, PRMCUOTA) VALUES (?, ?, ?, ?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_PRESTAMO WHERE EMPCODIGO LIKE ?";
    private final String SQL_SELECTBYID = "SELECT * FROM CEFAS_PRESTAMO WHERE PRMCODIGO LIKE ?";
    private final String SQL_SELECTBYEMP = "SELECT * FROM CEFAS_PRESTAMO WHERE EMPCODIGO LIKE ?";
    private final String SQL_SELECTALL = "SELECT * FROM CEFAS_PRESTAMO";
    private final String SQL_SELECT_ACTIVOS = "SELECT * FROM CEFAS_PRESTAMO WHERE PRMSALDO > 0";
    private final String SQL_UPDATE = "UPDATE CEFAS_PRESTAMO SET EMPCODIGO = ?, PRMFECHA = ?,"
            + " PRMMONTO = ?, PRMPLAZO = ?, PRMSALDO = ?, PRMCUOTA = ? WHERE PRMCODIGO = ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_PRESTAMO WHERE PRMCODIGO = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    
  
    
    public CEFAS_Prestamo getPrestamo(int codigo)
    {
        //da prestamo por id
        CEFAS_Prestamo prestamo=null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTBYID);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                prestamo= new CEFAS_Prestamo();
                prestamo.setPrmCodigo(rs.getInt("prmCodigo"));
               prestamo.setEmpCodigo(rs.getInt("empCodigo"));
                prestamo.setPrmFecha(rs.getDate("prmFecha"));
                prestamo.setPrmMonto(rs.getFloat("prmMonto"));
                prestamo.setPrmPlazo(rs.getInt("prmPlazo"));
                prestamo.setPrmSaldo(rs.getFloat("prmSaldo"));
                prestamo.setPrmCuota(rs.getFloat("prmCuota"));             
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prestamo;
    }
    

    //Retorna todos los prestamos del sistema
     public List<CEFAS_Prestamo> getPrestamos()
    {
        List<CEFAS_Prestamo> listPrestamos = new ArrayList<CEFAS_Prestamo>();
        CEFAS_Prestamo prestamo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTALL);
            //ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
               prestamo= new CEFAS_Prestamo();
                prestamo.setPrmCodigo(rs.getInt("prmCodigo"));
               prestamo.setEmpCodigo(rs.getInt("empCodigo"));
                prestamo.setPrmFecha(rs.getDate("prmFecha"));
                prestamo.setPrmMonto(rs.getFloat("prmMonto"));
                prestamo.setPrmPlazo(rs.getInt("prmPlazo"));
                prestamo.setPrmSaldo(rs.getFloat("prmSaldo"));
                prestamo.setPrmCuota(rs.getFloat("prmCuota"));
                listPrestamos.add(prestamo); 
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listPrestamos;
    }
    
   
     public int almacenarPrestamos(CEFAS_Prestamo prestamo) {
     //almacena un prestamo leido desde el navegador
         int n=0;
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, prestamo.getEmpCodigo());
            ps.setDate(2, new Date(prestamo.getPrmFecha().getTime()));
            ps.setDouble(3, prestamo.getPrmMonto());
            ps.setDouble(4, prestamo.getPrmPlazo());
            ps.setDouble(5, prestamo.getPrmSaldo());
            ps.setDouble(6, prestamo.getPrmCuota());
           n=ps.executeUpdate();            

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_Prestamo.class.getName()).log(Level.SEVERE, null, ex);         
        }
        return n;
     }
     
     
     
     public int actualizarPrestamo(CEFAS_Prestamo prestamo) {
     int n=0;
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_UPDATE);
            ps.setInt(1, prestamo.getEmpCodigo());
            ps.setDate(2, new Date(prestamo.getPrmFecha().getTime()));
            ps.setDouble(3, prestamo.getPrmMonto());
            ps.setDouble(4, prestamo.getPrmPlazo());
            ps.setDouble(5, prestamo.getPrmSaldo());
            ps.setDouble(6, prestamo.getPrmCuota());
            ps.setInt(7, prestamo.getPrmCodigo());
            n=ps.executeUpdate();
            
            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);   
        }
        return n;
     }
     
     
     //prestamo de un empleado
        public CEFAS_Prestamo obtenerPrestamoEmpleado(int codigo)
    {
        CEFAS_Prestamo prestamo=null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECTBYEMP);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                prestamo= new CEFAS_Prestamo();
                prestamo.setPrmCodigo(rs.getInt("prmCodigo"));
               prestamo.setEmpCodigo(rs.getInt("empCodigo"));
                prestamo.setPrmFecha(rs.getDate("prmFecha"));
                prestamo.setPrmMonto(rs.getFloat("prmMonto"));
                prestamo.setPrmPlazo(rs.getInt("prmPlazo"));
                prestamo.setPrmSaldo(rs.getFloat("prmSaldo"));
                prestamo.setPrmCuota(rs.getFloat("prmCuota"));             
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return prestamo;
    }
    
        public void actualizarSaldo()
        {
            List<CEFAS_Prestamo> prestamosActivos = new ArrayList<CEFAS_Prestamo>();
            CEFAS_Prestamo prestamo;
            try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_ACTIVOS);
            while(rs.next())
            {
                prestamo= new CEFAS_Prestamo();
                prestamo.setPrmCodigo(rs.getInt("prmCodigo"));
                prestamo.setEmpCodigo(rs.getInt("empCodigo"));
                prestamo.setPrmFecha(rs.getDate("prmFecha"));
                prestamo.setPrmMonto(rs.getFloat("prmMonto"));
                prestamo.setPrmPlazo(rs.getInt("prmPlazo"));
                prestamo.setPrmSaldo(rs.getFloat("prmSaldo"));
                prestamo.setPrmCuota(rs.getFloat("prmCuota"));  
                prestamosActivos.add(prestamo);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            for(CEFAS_Prestamo p : prestamosActivos)
            {
                float nuevoSaldo = p.getPrmSaldo() - p.getPrmCuota();
                p.setPrmSaldo(nuevoSaldo);
                //Se pronostica una afectación en el rendimiento, pero es bueno reutilizar código ;)
                actualizarPrestamo(p);
            }
        }
        

     
     //eliminar Prestamo
       public int eliminarPrestamo(int codigo){
          int resultado=0;
            try {
            conexiondb = ConexionDB.getConexion();
            //Borrado de títulos
            ps = conexiondb.prepareStatement(SQL_DELETE);
            ps.setInt(1, codigo);
            resultado=ps.executeUpdate();
           
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PrestamoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return resultado; 
    }
        
     
    
        
        
}

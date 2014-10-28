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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CEFAS_AnticipoDAO {
    
    private final String SQL_INSERT = "INSERT INTO tabla (columnas) VALUES (?, ?, ?, ?, ?...)";
    private final String SQL_SELECT = "";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo, String fecha)
    {
       //retorna todos los anticipos de un empleado
        List<CEFAS_Anticipo> listAnticipos = new ArrayList<CEFAS_Anticipo>();
        CEFAS_Anticipo anticipo= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
            ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                anticipo = new CEFAS_Anticipo();
                anticipo.setAtpCodigo(rs.getString("columna"));
                anticipo.setEmpCodigo(rs.getString("columna"));
                anticipo.setAtpFecha(rs.getDate("columna"));
                anticipo.setAtpCantidad(rs.getFloat("columna"));
                listAnticipos.add(anticipo);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAnticipos;
    }
    
    
    
     public void almacenarAnticipo(CEFAS_Anticipo anticipo) {
     //almacena un anticipo leido desde el navegador
     try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, anticipo.getEmpCodigo());
           // ps.setDate(2, anticipo.getAtpFecha());
            ps.setDouble(3, anticipo.getAtpCantidad());
         
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     
     }
     
      public void almacenarAnticipoQuincena() {
     //almacena un anticipo a todos los empleados
     
     
     }
     
     
    
}

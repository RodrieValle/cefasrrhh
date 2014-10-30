/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;


import com.colegiocefas.cefasrrhh.dominio.CEFAS_Viatico;
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
public class CEFAS_ViaticoDAO {
    
    
      
    private final String SQL_INSERT = "INSERT INTO CEFAS_VIATICO (EMPCODIGO, VIAFECHA, VIACANTIDAD, VIADESCRIPCION) VALUES (?, ?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_VIATICO WHERE EMPCODIGO LIKE ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_VIATICO SET EMPCODIGO = ?, VIAFECHA = ?,"
            + " VIACANTIDAD = ?, VIADESCRIPCION = ?, WHERE ATPCODIGO = ?";
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
    
    
    //Retorna todos los anticipos del empleado
     public List<CEFAS_Viatico> getViaticosEmpleado(int codigo)
    {
       //retorna todos los anticipos de un empleado
     
        List<CEFAS_Viatico> listViaticos = new ArrayList<CEFAS_Viatico>();
        CEFAS_Viatico viatico= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
           // ps.setString(2, fecha);
            rs = ps.executeQuery();
            while(rs.next())
            {
                viatico = new CEFAS_Viatico();
                viatico.setViaCodigo(rs.getInt("viaCodigo"));
                viatico.setEmpCodigo(rs.getInt("empCodigo"));
                viatico.setViaFecha(rs.getDate("viaFecha"));
                viatico.setViaCantidad(rs.getFloat("viaCantidad"));
                viatico.setViaDescripcion(rs.getString("viaDescripcion"));
                listViaticos.add(viatico);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ViaticoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listViaticos;
    }
    
    
     public void almacenarViatico(CEFAS_Viatico viatico) {
     //almacena un anticipo leido desde el navegador
    
        try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, viatico.getEmpCodigo());
            ps.setDate(2, new Date(viatico.getViaFecha().getTime()));
            ps.setDouble(3, viatico.getViaCantidad());
            ps.setString(4, viatico.getViaDescripcion());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ViaticoDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     
     
     }
     
     
     
     
     
    
    
    
}

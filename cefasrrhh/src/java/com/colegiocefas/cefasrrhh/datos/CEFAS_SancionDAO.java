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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_SancionDAO {
    private final String SQL_INSERT = "INSERT INTO CEFAS_SANCION (EMPCODIGO,SCNFECHA,SCNSANCION,SCNMOTIVO) VALUES (?, ?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_SANCION WHERE EMPCODIGO LIKE ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_SANCION WHERE SCNCODIGO = ?";

    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public void almacenarSancion(CEFAS_Sancion sancion){
         try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1,sancion.getEmpCodigo());
            ps.setDate(2, new Date(sancion.getScnFecha().getTime()));
            ps.setString(3,sancion.getScnSancion());
            ps.setString(4,sancion.getScnMotivo());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_SancionDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
    }
   public List<CEFAS_Sancion> getSancion(int codigo)
    {
     
        List<CEFAS_Sancion> listSancion = new ArrayList<CEFAS_Sancion>();
        CEFAS_Sancion scn= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
           
            rs = ps.executeQuery();
            while(rs.next())
            {
                scn= new CEFAS_Sancion();
                scn.setScnCodigo(rs.getInt("scnCodigo"));
                scn.setEmpCodigo(rs.getInt("empCodigo"));
                scn.setScnFecha(rs.getDate("scnFecha"));
                scn.setScnSancion(rs.getString("scnSancion"));
                scn.setScnMotivo(rs.getString("scnMotivo"));
                listSancion.add(scn);
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_SancionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSancion;
    }
   public int eliminarSancion(int codigo){
          int resultado=0;
            try {
            conexiondb = ConexionDB.getConexion();
            //Borrado de títulos
            ps = conexiondb.prepareStatement(SQL_DELETE);
            ps.setInt(1, codigo);
            resultado=ps.executeUpdate();
           
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_SancionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return resultado; 
    }
    
    
}

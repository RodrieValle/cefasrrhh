/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Actividad;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_ActividadDAO {
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_ACTIVIDAD (ACTCODIGO, ACTFECHA, ACTDESCRIPCION)"
            + " VALUES (NULL, ?, ?);";
    private final String SQL_SELECT_ALL = "SELECT * FROM CEFAS_ACTIVIDAD ORDER BY ACTFECHA DESC";
     private final String SQL_SELECT_QUINCENA = "SELECT * FROM CEFAS_ACTIVIDAD WHERE ACTFECHA >= ? AND ACTFECHA <= ? ORDER BY ACTFECHA";
    private final String SQL_SELECT_ID = "SELECT * FROM CEFAS_ACTIVIDAD WHERE ACTCODIGO = ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_ACTIVIDAD SET ACTFECHA = ?, ACTDESCRIPCION = ? WHERE ACTCODIGO = ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_ACTIVIDAD WHERE ACTCODIGO = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public boolean guardar(CEFAS_Actividad actividad)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setDate(1, new Date(actividad.getActFecha().getTime()));
            ps.setString(2, actividad.getActDescripcion());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
    
    public List<CEFAS_Actividad> obtenerActividades()
    {
        List<CEFAS_Actividad> listaActividades = new ArrayList<CEFAS_Actividad>();
        CEFAS_Actividad actividad;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_ALL);
            while(rs.next())
            {
                actividad = new CEFAS_Actividad();
                actividad.setActCodigo(rs.getString("actCodigo"));
                actividad.setActFecha(rs.getDate("actFecha"));
                actividad.setActDescripcion(rs.getString("actDescripcion"));
                listaActividades.add(actividad);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaActividades;
    }
    
    public CEFAS_Actividad obtenerActividadbyId(String id)
    {
        CEFAS_Actividad actividad = null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_ID);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                actividad = new CEFAS_Actividad();
                actividad.setActCodigo(rs.getString("actCodigo"));
                actividad.setActFecha(rs.getDate("actFecha"));
                actividad.setActDescripcion(rs.getString("actDescripcion"));
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return actividad;
    }
    
    public boolean actualizar(CEFAS_Actividad actividad)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setDate(1, new Date(actividad.getActFecha().getTime()));
            ps.setString(2, actividad.getActDescripcion());
            ps.setString(3, actividad.getActCodigo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
    
    public boolean eliminarById(String id)
    {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_DELETE);
            ps.setString(1, id);
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
    
    public List<CEFAS_Actividad> obtenerActividadesQuincena()
    {
        List<CEFAS_Actividad> listaActividades = new ArrayList<CEFAS_Actividad>();
        CEFAS_Actividad actividad;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_QUINCENA);
            Calendar c1 = Calendar.getInstance();
            Calendar c2 = Calendar.getInstance();
            c2.add(Calendar.DATE, 15);
            ps.setDate(1, new Date(c1.getTimeInMillis()));
            ps.setDate(2, new Date(c2.getTimeInMillis()));
            rs = ps.executeQuery();
            while(rs.next())
            {
                actividad = new CEFAS_Actividad();
                actividad.setActCodigo(rs.getString("actCodigo"));
                actividad.setActFecha(rs.getDate("actFecha"));
                actividad.setActDescripcion(rs.getString("actDescripcion"));
                listaActividades.add(actividad);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ActividadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaActividades;
    }
}

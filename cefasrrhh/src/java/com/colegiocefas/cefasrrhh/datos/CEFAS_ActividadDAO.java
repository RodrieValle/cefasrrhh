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
    private final String SQL_SELECT_ALL = "SELECT * FROM CEFAS_ACTIVIDAD";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
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
}

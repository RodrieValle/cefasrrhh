/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionDeClases;

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
public class CEFAS_EvaluacionDeClasesDAO {
    

	private final String SQL_INSERT = "INSERT INTO CEFAS_EVALUACIONDECLASES (eclCodigo, empCodigo, eclFecha, eclRutaArchivo )"
           							  + " VALUES (NULL, ?, ?,?);";
    private final String SQL_SELECT_ALL = "SELECT * FROM CEFAS_EVALUACIONDECLASES ORDER BY ECLFECHA DESC";
    private final String SQL_SELECT_ID = "SELECT * FROM CEFAS_EVALUACIONDECLASES WHERE ECLCODIGO = ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_EVALUACIONDECLASES SET ECLFECHA = ?, ECLFECHA = ? WHERE ECLCODIGO = ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_EVALUACIONDECLASES WHERE ECLCODIGO = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;


    public boolean guardar(CEFAS_EvaluacionDeClases evalcl)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, evalcl.getEmpCodigo());
            ps.setDate(2, new Date(evalcl.getEclFecha().getTime()));
            ps.setString(3, evalcl.getEclRutaArchivo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionDeClasesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }


    public List<CEFAS_EvaluacionDeClases> obtenerEvaluacionDeClasesById()
    {
        List<CEFAS_EvaluacionDeClases> listaEvalcl = new ArrayList<CEFAS_EvaluacionDeClases>();
        CEFAS_EvaluacionDeClases evalcl;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_ALL);
            while(rs.next())
            {
                evalcl = new CEFAS_EvaluacionDeClases();
                evalcl.setEclCodigo(rs.getString("eclCodigo"));
                evalcl.setEclFecha(rs.getDate("eclFecha"));
                evalcl.setEclRutaArchivo(rs.getString("eclRutaArchivo"));
                listaEvalcl.add(evalcl);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionDeClases.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaEvalcl;
    }

    public boolean actualizar(CEFAS_EvaluacionDeClases evalcl)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setDate(1, new Date(evalcl.getEclFecha().getTime()));
            ps.setString(2, evalcl.getEclCodigo());
            ps.setString(3, evalcl.getEclRutaArchivo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionDeClasesDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CEFAS_EvaluacionDeClasesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
}
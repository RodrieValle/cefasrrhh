/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorCompetencias;
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
public class CEFAS_EvaluacionPorCompetenciasDAO {
    

	private final String SQL_INSERT = "INSERT INTO CEFAS_EVALUACIONPORCOMPETENCIAS (ECOCODIGO, EMPCODIGO, ECOFECHA, ECORUTAARCHIVO )"
           							  + " VALUES (NULL, ?, ?,?);";
    private final String SQL_SELECT_ALL = "SELECT * FROM CEFAS_EVALUACIONPORCOMPETENCIAS ORDER BY ECOFECHA DESC";
    private final String SQL_SELECT_ID = "SELECT * FROM CEFAS_EVALUACIONPORCOMPETENCIAS WHERE EMPCODIGO = ? ORDER BY ECOFECHA";
    private final String SQL_UPDATE = "UPDATE CEFAS_EVALUACIONPORCOMPETENCIAS SET ACTFECHA = ?, ECOFECHA = ? WHERE ECOCODIGO = ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_EVALUACIONPORCOMPETENCIAS WHERE ECOCODIGO = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;


    public boolean guardar(CEFAS_EvaluacionPorCompetencias eval)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, eval.getEmpCodigo());
            ps.setDate(2, new Date(eval.getEcoFecha().getTime()));
            ps.setString(3, eval.getEcoRutaArchivo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionPorCompetenciasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }


    public List<CEFAS_EvaluacionPorCompetencias> obtenerEvaluacionPorcompetenciasById(int codigoEmpleado)
    {
        List<CEFAS_EvaluacionPorCompetencias> listaEval = new ArrayList<CEFAS_EvaluacionPorCompetencias>();
        CEFAS_EvaluacionPorCompetencias eval;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_ID);
            ps.setInt(1, codigoEmpleado);
            rs = ps.executeQuery();
            while(rs.next())
            {
                eval = new CEFAS_EvaluacionPorCompetencias();
                eval.setEcoCodigo(rs.getString("ecoCodigo"));
                eval.setEcoFecha(rs.getDate("ecoFecha"));
                eval.setEcoRutaArchivo(rs.getString("ecoRutaArchivo"));
                listaEval.add(eval);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionPorCompetenciasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaEval;
    }

    public boolean actualizar(CEFAS_EvaluacionPorCompetencias eval)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setDate(1, new Date(eval.getEcoFecha().getTime()));
            ps.setString(2, eval.getEcoCodigo());
            ps.setString(3, eval.getEcoRutaArchivo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionPorCompetenciasDAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CEFAS_EvaluacionPorCompetenciasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
}
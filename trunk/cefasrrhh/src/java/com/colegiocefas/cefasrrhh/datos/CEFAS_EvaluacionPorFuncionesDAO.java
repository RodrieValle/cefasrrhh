/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorFunciones;
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
public class CEFAS_EvaluacionPorFuncionesDAO {
    

	private final String SQL_INSERT = "INSERT INTO CEFAS_EvaluacionPorFunciones (efuCodigo, empCodigo, efuFecha, efuRutaArchivo )"
           							  + " VALUES (NULL, ?, ?,?);";
    private final String SQL_SELECT_ALL = "SELECT * FROM CEFAS_EVALUACIONPORFUNCIONES ORDER BY ECOFECHA DESC";
    private final String SQL_SELECT_ID = "SELECT * FROM CEFAS_EVALUACIONPORFUNCIONES WHERE EMPCODIGO = ? ORDER BY EFUFECHA";
    private final String SQL_UPDATE = "UPDATE CEFAS_EVALUACIONPORFUNCIONES SET ACTFECHA = ?, ECOFECHA = ? WHERE ECOCODIGO = ?";
    private final String SQL_DELETE = "DELETE FROM CEFAS_EVALUACIONPORFUNCIONES WHERE ECOCODIGO = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;


    public boolean guardar(CEFAS_EvaluacionPorFunciones evalf)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setDate(1, new Date(evalf.getEfuFecha().getTime()));
            ps.setString(2, evalf.getEfuRutaArchivo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionPorFuncionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }


    public List<CEFAS_EvaluacionPorFunciones> obtenerEvaluacionPorFuncionesById(int codigoEmpleado)
    {
        List<CEFAS_EvaluacionPorFunciones> listaEval = new ArrayList<CEFAS_EvaluacionPorFunciones>();
        CEFAS_EvaluacionPorFunciones evalf;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_ID);
            ps.setInt(1, codigoEmpleado);
            rs = ps.executeQuery();
            while(rs.next())
            {
                evalf = new CEFAS_EvaluacionPorFunciones();
                evalf.setEfuCodigo(rs.getString("efuCodigo"));
                evalf.setEfuFecha(rs.getDate("efuFecha"));
                evalf.setEfuRutaArchivo(rs.getString("efuRutaArchivo"));
                listaEval.add(evalf);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionPorFuncionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaEval;
    }

    public boolean actualizar(CEFAS_EvaluacionPorFunciones evalf)
    {
       try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setDate(1, new Date(evalf.getEfuFecha().getTime()));
            ps.setString(2, evalf.getEfuCodigo());
            ps.setString(3, evalf.getEfuRutaArchivo());
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
            Logger.getLogger(CEFAS_EvaluacionPorFuncionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
}

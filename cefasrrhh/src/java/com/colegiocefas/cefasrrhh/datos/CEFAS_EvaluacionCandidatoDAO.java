/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionCandidato;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CEFAS_EvaluacionCandidatoDAO {

    private final String SQL_INSERT = "INSERT INTO CEFAS_EVALUACIONCANDIDATO (CDTDUI,EVCOBSERVACIONREFERENCIAS,EVCFECHAENTREVISTA,EVCCOMENTARIOENTREVISTA,EVCFECHAEXAMENAPTITUD,EVCNOTAEXAMENAPTITUD,EVCCOMENTARIOEXAMENAPTITUD,EVCFECHAEXAMENPSICO,EVCNOTAEXAMENPSICO,EVCCOMENTARIOEXAMENPSICO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    public boolean almacenarEvaluacion(CEFAS_EvaluacionCandidato evccan) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, evccan.getCdtDUI());
            ps.setString(2, evccan.getEvcObservacionesReferencias());
            ps.setDate(3, new Date(evccan.getEvcFechaEntrevista().getTime()));
            ps.setString(4, evccan.getEvcComentarioEntrevista());
            ps.setDate(5, new Date(evccan.getEvcFechaExamenAptitud().getTime()));
            ps.setString(6, evccan.getEvcNotaExamenAptitud());
            ps.setString(7, evccan.getEvcComentarioExamenAptitud());
            ps.setDate(8, new Date(evccan.getEvcFechaExamenPsico().getTime()));
            ps.setString(9, evccan.getEvcNotaExamenPsico());
            ps.setString(10, evccan.getEvcCometarioExamenPsico());

            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionCandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return false;
    }

}

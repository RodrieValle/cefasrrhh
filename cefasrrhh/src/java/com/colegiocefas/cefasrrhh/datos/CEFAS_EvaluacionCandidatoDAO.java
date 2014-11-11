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

    private final String SQL_INSERT = "INSERT INTO CEFAS_EVALUACIONCANDIDATO (CDTDUI,EVCCODIGO,EVCOBSERVACIONESREFERENCIAS,EVCFECHAENTREVISTA,EVCCOMENTARIOENTREVISTA,EVCFECHAEXAMENAPTITUD,EVCNOTAEXAMENAPTITUD,EVCCOMENTARIOEXAMENAPTITUD,EVCFECHAEXAMENPSICO,EVCNOTAEXAMENPSICO,EVCCOMENTARIOEXAMENPSICO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    public void almacenarEvaluacion(CEFAS_EvaluacionCandidato evaluacioncan) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, evaluacioncan.getCdtDUI());
            ps.setString(2, evaluacioncan.getEvcCodigo());
            ps.setString(3, evaluacioncan.getEvcObservacionesReferencias());
            ps.setDate(4, new Date(evaluacioncan.getEvcFechaEntrevista().getTime()));
            ps.setString(5, evaluacioncan.getEvcComentarioEntrevista());
            ps.setDate(6, new Date(evaluacioncan.getEvcFechaExamenAptitud().getTime()));
            ps.setString(7, evaluacioncan.getEvcNotaExamenAptitud());
            ps.setString(8, evaluacioncan.getEvcComentarioExamenAptitud());
            ps.setDate(9, new Date(evaluacioncan.getEvcFechaExamenPsico().getTime()));
            ps.setString(10, evaluacioncan.getEvcNotaExamenPsico());
            ps.setString(11, evaluacioncan.getEvcCometarioExamenPsico());

            int n = ps.executeUpdate();

            if (n > 0) {
                Logger.getLogger("Se guardo correctamente");
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionCandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

}

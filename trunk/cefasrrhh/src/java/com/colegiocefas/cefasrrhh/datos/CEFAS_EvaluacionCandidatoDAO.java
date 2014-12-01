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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CEFAS_EvaluacionCandidatoDAO {

    private final String SQL_INSERT = "INSERT INTO CEFAS_EVALUACIONCANDIDATO (CDTDUI,EVCOBSERVACIONREFERENCIAS,EVCFECHAENTREVISTA,EVCCOMENTARIOENTREVISTA,EVCFECHAEXAMENAPTITUD,EVCNOTAEXAMENAPTITUD,EVCCOMENTARIOEXAMENAPTITUD,EVCFECHAEXAMENPSICO,EVCNOTAEXAMENPSICO,EVCCOMENTARIOEXAMENPSICO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_CANDIDATO INNER JOIN CEFAS_EVALUACIONCANDIDATO ON "
            + "CEFAS_CANDIDATO.CDTDUI = CEFAS_EVALUACIONCANDIDATO.CDTDUI AND CEFAS_CANDIDATO.CDTDUI = ?";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    public void almacenarEvaluacion(CEFAS_EvaluacionCandidato evccan) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1, evccan.getCdtDUI());
            ps.setString(2, evccan.getEvcObservacionesReferencias());
            ps.setDate(3, new Date(evccan.getEvcFechaEntrevista().getTime()));
            ps.setString(4, evccan.getEvcComentarioEntrevista());
            ps.setDate(5, new Date(evccan.getEvcFechaExamenAptitud().getTime()));
            ps.setDouble(6, evccan.getEvcNotaExamenAptitud());
            ps.setString(7, evccan.getEvcComentarioExamenAptitud());
            ps.setDate(8, new Date(evccan.getEvcFechaExamenPsico().getTime()));
            ps.setDouble(9, evccan.getEvcNotaExamenPsico());
            ps.setString(10, evccan.getEvcCometarioExamenPsico());

            int n= ps.executeUpdate();
            if (n > 0) {
                Logger.getLogger("Se guardo correctamente");
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionCandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
    public CEFAS_EvaluacionCandidato obtenerEvaluacion(String duiCdt)
    {
     
        CEFAS_EvaluacionCandidato eval= null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setString(1, duiCdt);
           
            rs = ps.executeQuery();
            while(rs.next())
            {
                eval= new CEFAS_EvaluacionCandidato();
                eval.setEvcCodigo(rs.getInt("evcCodigo"));
                eval.setCdtDUI(rs.getString("cdtDUI"));
                eval.setEvcObservacionesReferencias(rs.getString("evcObservacionReferencias"));
                eval.setEvcFechaEntrevista(rs.getDate("evcFechaEntrevista"));
                eval.setEvcComentarioEntrevista(rs.getString("evcComentarioEntrevista"));
                eval.setEvcFechaExamenAptitud(rs.getDate("evcFechaExamenAptitud"));
                eval.setEvcNotaExamenAptitud(rs.getDouble("evcNotaExamenAptitud"));
                eval.setEvcComentarioExamenAptitud(rs.getString("evcComentarioExamenAptitud"));
                eval.setEvcFechaExamenPsico(rs.getDate("evcFechaExamenPsico"));
                eval.setEvcNotaExamenPsico(rs.getDouble("evcNotaExamenPsico"));
                eval.setEvcCometarioExamenPsico(rs.getString("evcComentarioExamenPsico"));
               
               
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EvaluacionCandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eval;
    }
   

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_CandidatoDAO {

    private final String SQL_INSERT = "INSERT INTO CEFAS_CANDIDATO(CDTDUI,CDTNOMBRE,CDTESPECIALIDAD,CDTCURRICULUM) VALUES (?, ?, ?, ?)";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    public void ingresarCurriculum(CEFAS_Candidato candidato) {

        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setString(1,candidato.getCdtDUI());
            ps.setString(2,candidato.getCdtNombre());
            ps.setString(3,candidato.getCdtEspecialidad());
            ps.setString(4,candidato.getCdtCurriculum());
            int n = ps.executeUpdate();

            if (n > 0) {
                Logger.getLogger("Se guardo correctamente");
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_CandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}

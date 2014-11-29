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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_CandidatoDAO {

    private final String SQL_INSERT = "INSERT INTO CEFAS_CANDIDATO(CDTDUI,CDTNOMBRE,ESPCODIGO,CDTCURRICULO) VALUES (?, ?, ?, ?)";
    private final String SQL_SELECT_ID = "SELECT * FROM CEFAS_CANDIDATO WHERE CDTDUI = ?";
    private final String SQL_SELECT = "SELECT CDTDUI,CDTNOMBRE FROM CEFAS_CANDIDATO ORDER BY CDTNOMBRE";
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
            ps.setInt(3,candidato.getEspCodigo());
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
    


    public CEFAS_Candidato cosultarPorCodigo(int codigo) {
        CEFAS_Candidato candidato = null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_ID);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while(rs.next())
            {
                candidato = new CEFAS_Candidato();
                candidato.setCdtNombre(rs.getString("cdtNombre"));
                        
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_CandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return candidato;
    }
    public List<CEFAS_Candidato> obtenerCandidato()
    {
        List<CEFAS_Candidato> listaCandidato = new ArrayList<CEFAS_Candidato>();
        CEFAS_Candidato cdt;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT);
            while(rs.next())
            {
                cdt = new CEFAS_Candidato();
                cdt.setCdtDUI(rs.getString("cdtDUI"));
                cdt.setCdtNombre(rs.getString("cdtNombre"));
                listaCandidato.add(cdt);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_CandidatoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaCandidato;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso;
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
public class CEFAS_AvisoDAO {
    
    private final String SQL_INSERT = "";
    private final String SQL_BUSCARAVISO = "SELECT * FROM CEFAS_AVISO";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public List<CEFAS_Aviso> consultarAvisos(String usuario) {
        CEFAS_Aviso aviso;
        List<CEFAS_Aviso> listaAvisos = new ArrayList();
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_BUSCARAVISO);
            while(rs.next())
            {
                aviso = new CEFAS_Aviso();
                aviso.setAvsDescripcion(rs.getString("avsDescripcion"));
                aviso.setAvsFecha(rs.getDate("avsFecha"));
                listaAvisos.add(aviso);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAvisos;
    }
    
}

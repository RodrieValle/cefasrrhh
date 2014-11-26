/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Especialidad;
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
 * @author sergio
 */
public class CEFAS_EspecialidadDAO {
    
     private final String SQL_SELECT_ALL = "SELECT ESPCODIGO,ESPNOMBRE FROM CEFAS_ESPECIALIDAD ORDER BY ESPNOMBRE";
    
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    
     public List<CEFAS_Especialidad> obtenerEspecialidad()
    {
        List<CEFAS_Especialidad> listaEspecialidad = new ArrayList<CEFAS_Especialidad>();
        CEFAS_Especialidad esp;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_ALL);
            while(rs.next())
            {
                esp = new CEFAS_Especialidad();
                esp.setEspCodigo(rs.getInt("espCodigo"));
                esp.setEspNombre(rs.getString("espNombre"));
                listaEspecialidad.add(esp);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EspecialidadDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaEspecialidad;
    }
    
}

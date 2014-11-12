/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_ConfiguracionRetenciones;
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

/**
 *
 * @author Portillo
 */
public class CEFAS_ConfiguracionRetencionesDAO {
    
    private final String SQL_INSERT = "";
    private final String SQL_SELECT = "SELECT * FROM CONFIGURACIONRETENCIONES";
    private final String SQL_UPDATE = "";
     private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public List<CEFAS_ConfiguracionRetenciones> obtenerRetenciones()
    {
        List<CEFAS_ConfiguracionRetenciones> retenciones = new ArrayList<CEFAS_ConfiguracionRetenciones>();
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT);
            while(rs.next())
            {
                CEFAS_ConfiguracionRetenciones cfg = new CEFAS_ConfiguracionRetenciones();
                cfg.setCfgCodigo(rs.getString("cfgCodigo"));
                cfg.setCfgTipo(rs.getString("cfgTipo"));
                cfg.setCfgPorcentaje(rs.getFloat("cfgPorcentaje"));
                cfg.setCfgMinimo(rs.getFloat("cfgMinino"));
                cfg.setCfgMaximo(rs.getFloat("cfgMaximo"));
                cfg.setCfgSobreExceso(rs.getFloat("cfgSobreExceso"));
                cfg.setCfgCuotaFija(rs.getFloat("cfgCoutaFija"));
                retenciones.add(cfg);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ConfiguracionRetencionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retenciones;
    }
    
}

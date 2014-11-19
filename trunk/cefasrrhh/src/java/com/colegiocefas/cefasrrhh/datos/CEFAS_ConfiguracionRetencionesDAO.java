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
    private final String SQL_SELECT = "SELECT * FROM CEFAS_CONFIGURACIONRETENCIONES";
    private final String SQL_RENTA = "UPDATE CEFAS_CONFIGURACIONRETENCIONES SET CFGPORCENTAJE = ?, CFGMINIMO = ?,"
            + " CFGMAXIMO = ?, CFGSOBREEXCESO = ?, CFGCUOTAFIJA = ? WHERE CFGCODIGO = ?";
    private final String SQL_BASICOS = "UPDATE CEFAS_CONFIGURACIONRETENCIONES SET CFGPORCENTAJE = ?, CFGMAXIMO = ? WHERE CFGCODIGO = ?";
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
                cfg.setCfgMinimo(rs.getFloat("cfgMinimo"));
                cfg.setCfgMaximo(rs.getFloat("cfgMaximo"));
                cfg.setCfgSobreExceso(rs.getFloat("cfgSobreExceso"));
                cfg.setCfgCuotaFija(rs.getFloat("cfgCuotaFija"));
                retenciones.add(cfg);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ConfiguracionRetencionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return retenciones;
    }
    
    
    
    public void actualizarRENTA(int codigo, float porcentaje, float minimo, float maximo, float exceso, float fija) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_RENTA);
            ps.setFloat(1, porcentaje);
            ps.setFloat(2, minimo);
            ps.setFloat(3, maximo);
            ps.setFloat(4, exceso);
            ps.setFloat(5, fija);
            ps.setFloat(6, codigo);
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ConfiguracionRetencionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
     public void actualizarBasicas(int codigo, float porcentaje, float maximo) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_BASICOS);
            ps.setFloat(1, porcentaje);
            ps.setFloat(2, maximo);
            ps.setFloat(3, codigo);
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_ConfiguracionRetencionesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}

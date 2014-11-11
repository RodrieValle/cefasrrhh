/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_AvisoDAO {
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_AVISO (AVSCODIGO, AVSFECHA, AVSDESCRIPCION, AVSREMITENTE) VALUES (NULL, ?, ?, ?)";
    private final String SQL_INSERT_DEST = "INSERT INTO RECIBE (EMPCODIGO, AVSCODIGO) VALUES (?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_AVISO WHERE AVSFECHA > ?";
    private final String SQL_BUSCAR_CODIGO = "SELECT MAX(AVSCODIGO) AS id FROM CEFAS_AVISO";
    private final String SQL_BUSCARAVISO = "SELECT CEFAS_AVISO.AVSFECHA, CEFAS_AVISO.AVSDESCRIPCION, CEFAS_EMPLEADO.EMPNOMBRE FROM "
            + "RECIBE INNER JOIN (CEFAS_AVISO INNER JOIN CEFAS_EMPLEADO ON CEFAS_AVISO.AVSREMITENTE = CEFAS_EMPLEADO.EMPCODIGO) " 
            + "ON RECIBE.AVSCODIGO = CEFAS_AVISO.AVSCODIGO WHERE RECIBE.EMPCODIGO = ? AND AVSFECHA > ?";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public List<CEFAS_Aviso> consultarAvisos(int usuario) {
        CEFAS_Aviso aviso;
        List<CEFAS_Aviso> listaAvisos = new ArrayList();
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_BUSCARAVISO);
            ps.setInt(1, usuario);
            Calendar c1 = Calendar.getInstance();
            c1.add(Calendar.DATE, -15);
            ps.setDate(2, new Date(c1.getTimeInMillis()));
            rs = ps.executeQuery();
            while(rs.next())
            {
                aviso = new CEFAS_Aviso();
                aviso.setAvsDescripcion(rs.getString("avsDescripcion"));
                aviso.setAvsFecha(rs.getDate("avsFecha"));
                aviso.setAvsRemitente(rs.getString("empNombre"));
                listaAvisos.add(aviso);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaAvisos;
    }
    
    public List<CEFAS_Aviso> consultarAvisos() {
        CEFAS_Aviso aviso;
        List<CEFAS_Aviso> listaAvisos = new ArrayList();
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            Calendar c1 = Calendar.getInstance();
            c1.add(Calendar.DATE, -15);
            ps.setDate(1, new Date(c1.getTimeInMillis()));
            rs = ps.executeQuery();
            while(rs.next())
            {
                aviso = new CEFAS_Aviso();
                aviso.setAvsCodigo(rs.getString("avsCodigo"));
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
    
    public void guardar(CEFAS_Aviso aviso, List<CEFAS_Empleado> destinatarios)
    {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setDate(1, new Date(aviso.getAvsFecha().getTime()));
            ps.setString(2, aviso.getAvsDescripcion());
            ps.setInt(3, Integer.parseInt(aviso.getAvsRemitente()));
            ps.execute();
            
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_BUSCAR_CODIGO);
            while(rs.next()){
                aviso.setAvsCodigo(rs.getString("id"));
            }
            
            ps = conexiondb.prepareStatement(SQL_INSERT_DEST);
            for(CEFAS_Empleado recibe: destinatarios)
            {
                ps.setInt(1, Integer.parseInt(recibe.getEmpCodigo()));
                ps.setInt(2, Integer.parseInt(aviso.getAvsCodigo()));
                ps.execute();
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_AvisoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarById(String id)
    {
        
    }
    
}

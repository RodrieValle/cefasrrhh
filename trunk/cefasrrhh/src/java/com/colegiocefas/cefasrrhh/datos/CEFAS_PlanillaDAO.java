/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
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
 * @author MARIA JUAREZ
 */
public class CEFAS_PlanillaDAO {
     private final String SQL_INSERT = "INSERT INTO CEFAS_ANTICIPO (EMPCODIGO, ATPFECHA, ATPCANTIDAD) VALUES (?, ?, ?)";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_ANTICIPO WHERE EMPCODIGO LIKE ?";
     private final String SQL_SELECT_DATE = "SELECT * from CEFAS_PLANILLA WHERE PLNCODIGO=(SELECT MAX(PLNCODIGO) from CEFAS_PLANILLA)";
    private final String SQL_SELECTBYID = "SELECT * FROM CEFAS_ANTICIPO WHERE ATPCODIGO LIKE ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_ANTICIPO SET EMPCODIGO = ?, ATPFECHA = ?,"
            + " ATPCANTIDAD = ?, WHERE ATPCODIGO = ?";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    
    
     public CEFAS_Planilla getUltimaPlanilla()
    {
        CEFAS_Planilla planilla= null;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_DATE);
            while(rs.next())
            {
                planilla = new CEFAS_Planilla();
                planilla.setPlnCodigo(rs.getInt("plnCodigo"));
                planilla.setPlnTipo(rs.getInt("plnTipo"));
                planilla.setPlnFecha(rs.getDate("plnFecha"));
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_PlanillaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return planilla;
    }
}

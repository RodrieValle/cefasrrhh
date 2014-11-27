/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_LineaDePlanilla;
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
public class CEFAS_LineaDePlanillaDAO {
        private final String SQL_INSERT = "INSERT INTO CEFAS_LINEADEPLANILLA (EMPCODIGO, LDPFECHA, LDPSUELDOBASE, LDPHORASEXTRAS, "
                + "LDPAUSENCIASTARDIAS, LDPSUELDODEVENGADO, LDPAFPCONFIA, LDPAFPCRECER, LDPVALORNETOSUJETORENTA, LDPIMPUESTOSOBRERENTA, "
                + "LDPANTICIPO, LDPABONOPRESTAMO, LDPORDENDEDESCUENTO, LDPISSS, LDPAGUINALDO, LDPVACACION, LDPMONTOVIATICO, LDPLIQUIDOAPAGAR, "
                + "PLNCODIGO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private final String SQL_SELECT = "";
     private final String SQL_SELECT_DATE = "";
    private final String SQL_SELECTBYID = "";
    private final String SQL_UPDATE = "";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    
    
     public int almacenarLineasPlanilla(CEFAS_LineaDePlanilla linea, int codigoPlanilla){
          int n=0;
          
        try {  

            conexiondb = ConexionDB.getConexion(); 
            ps=conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, linea.getEmpCodigo());
            ps.setDate(2, new Date(linea.getLdpFecha().getTime()));
            ps.setDouble(3, linea.getLdpSueldoBase());
            ps.setDouble(4, linea.getLdpHorasExtra());
            ps.setDouble(5, linea.getLdpAusenciasTardias());
            ps.setDouble(6, linea.getLdpSueldoDevengado());
            ps.setDouble(7, linea.getLdpAfpConfia());
            ps.setDouble(8, linea.getLdpAfpCrecer());
            ps.setDouble(9, linea.getLdpValorNetoSujetoRenta());
            ps.setDouble(10, linea.getLdpImpuestoSobreRenta());
            ps.setDouble(11, linea.getLdpAnticipo());
            ps.setDouble(12, linea.getLdpAbonoPrestamo());
            ps.setDouble(13, linea.getLdpOrdenDeDescuento());
            ps.setDouble(14, linea.getLdpIsss());
            ps.setDouble(15, linea.getLdpAguinaldo());
            ps.setDouble(16, linea.getLdpVacacion());
            ps.setDouble(17, linea.getLdpMontoViatico());
            ps.setDouble(18, linea.getLdpLiquidoAPagar());
            ps.setInt(19, codigoPlanilla);
            
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            
n=1;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_LineaDePlanillaDAO.class.getName()).log(Level.SEVERE, null, ex);
             
        }
     return n;
     }
}

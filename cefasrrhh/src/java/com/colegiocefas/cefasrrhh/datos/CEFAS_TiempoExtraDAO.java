/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_TiempoExtra;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_TiempoExtraDAO {
      private final String SQL_INSERT = "INSERT INTO CEFAS_TIEMPOEXTRA (EMPCODIGO,EMPSUSTITUTO,TEXFECHA,TEXHORAINICIO,TEXHORAFIN,TEXDELTATIEMPO,TEXVALORDINERO) VALUES (?,?,?,?,?,?,?)";
    private final String SQL_SELECT_DATE = "SELECT * FROM CEFAS_TIEMPOEXTRA WHERE EMPCODIGO= ? and TEXFECHA>= ?";
      private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    public void guardaHorasExtras(CEFAS_TiempoExtra textra){
    
     try {
            conexiondb = ConexionDB.getConexion();
            ps=conexiondb.prepareStatement(SQL_INSERT);
            
            ps.setInt(1, textra.getEmpCodigo());
            ps.setInt(2, textra.getTexCodigo2());
            ps.setDate(3, new Date(textra.getTexFecha().getTime()));
            ps.setString(4, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(textra.getTexHoraInicio()));
            ps.setString(5, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(textra.getTexHoraFin()));
            ps.setDate(6, null);
            ps.setFloat(7,textra.getTexValorDinero());
            int n=ps.executeUpdate();

            if(n>0){
               Logger.getLogger("Se guardo correctamente");
            }
ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_TiempoExtra.class.getName()).log(Level.SEVERE, null, ex);
    
    }
    
}
    
    
    //>>>>>>>>>>>>>>>>>>>>>CALCULO DE LAS HORAS EXTRAS DESDE EL ULTIMO CORTE DE PLANILLA<<<<<<<<<<<<<<<<<<<<<
     
    public List<CEFAS_TiempoExtra> getHorasExtrasEmpleadoFecha(int codigo, java.util.Date fecha)
    {
         //retorna todos los anticipos de un empleado
     
        List<CEFAS_TiempoExtra> listExtras = new ArrayList<CEFAS_TiempoExtra>();
        CEFAS_TiempoExtra extra;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT_DATE);
            ps.setInt(1, codigo);
            ps.setDate(2, new Date(fecha.getTime()));
            rs = ps.executeQuery();
            while(rs.next())
            {
     
                extra = new CEFAS_TiempoExtra();
               extra.setTexCodigo(rs.getInt("texCodigo"));
                extra.setEmpCodigo(rs.getInt("empCodigo"));
                extra.setTexCodigo2(rs.getInt("empSustituto"));
                 extra.setTexFecha(rs.getDate("texFecha"));
                extra.setTexHoraInicio(rs.getDate("textHoraInicio"));
                extra.setTexHoraFin(rs.getDate("texHoraFin"));
                extra.setTexDeltaTiempo(rs.getDate("texDeltaTiempo"));
                 extra.setTexValorDinero(rs.getFloat("textValorDinero"));
                listExtras.add(extra);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_TiempoExtraDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listExtras;
    }
      
    
    
    
}

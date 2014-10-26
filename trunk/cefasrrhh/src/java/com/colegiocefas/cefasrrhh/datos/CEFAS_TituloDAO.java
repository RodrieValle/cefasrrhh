/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo;
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
 * @author Rodrigo
 */
public class CEFAS_TituloDAO {
    
    private final String SQL_INSERT = "";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_TITULO WHERE EMPCODIGO = ?";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public List<CEFAS_Titulo> getTitulos(int codigoEmpleado)
    {
        CEFAS_Titulo titulo;
        List<CEFAS_Titulo> titulos = new ArrayList();
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigoEmpleado);
            rs = ps.executeQuery();
            while(rs.next())
            {
                titulo = new CEFAS_Titulo();
                titulo.setTtlcodigo(rs.getInt("ttlcodigo"));
                titulo.setEmpcodigo(rs.getInt("empcodigo"));
                titulo.setTtltitulo(rs.getString("ttlnombre"));
                titulo.setTtllugar(rs.getString("ttllugar"));
                titulo.setTtlfecha(rs.getDate("ttlfecha"));
                titulos.add(titulo);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return titulos;
    }
}

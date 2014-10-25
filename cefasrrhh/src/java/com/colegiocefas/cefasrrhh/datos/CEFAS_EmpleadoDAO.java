/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import com.colegiocefas.cefasrrhh.utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Portillo
 */
public class CEFAS_EmpleadoDAO {
    
    private final String SQL_INSERT = "";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_USUARIO INNER JOIN CEFAS_EMPLEADO ON "
            + "CEFAS_USUARIO.EMPCODIGO = CEFAS_EMPLEADO.EMPCODIGO AND CEFAS_USUARIO.EMPCODIGO = ?";
    private final String SQL_UPDATE = " ";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;
      
    public CEFAS_Empleado getEmpleadoPorUsuario(int codigo)
    {
        CEFAS_Empleado empleado = null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_SELECT);
            ps.setInt(1, codigo);
            rs = ps.executeQuery();
            while(rs.next())
            {
                empleado = new CEFAS_Empleado();
                empleado.setEmpNombre(rs.getString("empNombre"));
                empleado.setEmpFechaNacimiento(rs.getDate("empFechaNacimiento"));
                empleado.setEmpDireccion(rs.getString("empDireccion"));
                empleado.setEmpAnioContratacion(rs.getString("empAnioContratacion"));
                empleado.setEmpPlazaActual(rs.getString("empPlazaActual"));
                empleado.setEmpPlazaAnterior(rs.getString("empPlazaAnterior"));
                empleado.setEmpSalario(rs.getFloat("empSalario"));
                empleado.setEmpTipoDeContrato(rs.getString("emptipoDeContrato"));
                empleado.setEmpNUP(rs.getString("empNup"));
                empleado.setEmpDUI(rs.getString("empDui"));
                empleado.setEmpNIT(rs.getString("empNit"));
                empleado.setEmpNIP(rs.getString("empNip"));
                empleado.setEmpTelefono(rs.getString("empTelefono"));
                empleado.setEmpCelular(rs.getString("empCelular"));
                empleado.setEmpCorreo(rs.getString("empCorreo"));
                empleado.setEmpFoto(rs.getString("empFoto"));
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return empleado;
    }
}

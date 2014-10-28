/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
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
public class CEFAS_EmpleadoDAO {
    
    private final String SQL_INSERT = "";
    private final String SQL_SELECT = "SELECT * FROM CEFAS_USUARIO INNER JOIN CEFAS_EMPLEADO ON "
            + "CEFAS_USUARIO.EMPCODIGO = CEFAS_EMPLEADO.EMPCODIGO AND CEFAS_USUARIO.EMPCODIGO = ?";
    private final String SQL_SELECT_ALL = "SELECT EMPCODIGO, EMPNOMBRE, EMPFOTO FROM CEFAS_EMPLEADO";
    private final String SQL_UPDATE = "UPDATE CEFAS_EMPLEADO SET EMPNOMBRE = ?, EMPFECHANACIMIENTO = ?,"
            + " EMPDIRECCION = ?, EMPDUI = ?, EMPNIT = ?, EMPNUP = ?, EMPNIP = ?, EMPTELEFONO = ?, "
            + "EMPCELULAR = ?, EMPCORREO = ?, EMPFOTO = ? WHERE EMPCODIGO = ?";
    private final String SQL_UPDATE_COMPLETO = "UPDATE CEFAS_EMPLEADO SET EMPNOMBRE = ?, EMPFECHANACIMIENTO = ?,"
            + " EMPDIRECCION = ?, EMPDUI = ?, EMPNIT = ?, EMPNUP = ?, EMPNIP = ?, EMPTELEFONO = ?, "
            + "EMPCELULAR = ?, EMPCORREO = ?, EMPFOTO = ?, EMPANIOCONTRATACION = ?, EMPPLAZAACTUAL = ?, "
            + "EMPPLAZAANTERIOR = ?, EMPJEFEINMEDIATO = ?, EMPSALARIO = ?, EMPTIPODECONTRATO = ? WHERE EMPCODIGO = ?";
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
                empleado.setEmpCodigo(rs.getString("empCodigo"));
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

    public void guardarEmpleado(CEFAS_Empleado empleado) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setString(1, empleado.getEmpNombre());
            ps.setDate(2, new Date(empleado.getEmpFechaNacimiento().getTime()));
            ps.setString(3, empleado.getEmpDireccion());
            ps.setString(4, empleado.getEmpDUI());
            ps.setString(5, empleado.getEmpNIT());
            ps.setString(6, empleado.getEmpNUP());
            ps.setString(7, empleado.getEmpNIP());
            ps.setString(8, empleado.getEmpTelefono());
            ps.setString(9, empleado.getEmpCelular());
            ps.setString(10, empleado.getEmpCorreo());
            ps.setString(11, empleado.getEmpFoto());
            ps.setString(12, empleado.getEmpCodigo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void guardarEmpleadoCompleto(CEFAS_Empleado empleado) {
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE_COMPLETO);
            ps.setString(1, empleado.getEmpNombre());
            ps.setDate(2, new Date(empleado.getEmpFechaNacimiento().getTime()));
            ps.setString(3, empleado.getEmpDireccion());
            ps.setString(4, empleado.getEmpDUI());
            ps.setString(5, empleado.getEmpNIT());
            ps.setString(6, empleado.getEmpNUP());
            ps.setString(7, empleado.getEmpNIP());
            ps.setString(8, empleado.getEmpTelefono());
            ps.setString(9, empleado.getEmpCelular());
            ps.setString(10, empleado.getEmpCorreo());
            ps.setString(11, empleado.getEmpFoto());
            ps.setString(12, empleado.getEmpAnioContratacion());
            ps.setString(13, empleado.getEmpPlazaActual());
            ps.setString(14, empleado.getEmpPlazaAnterior());
            ps.setInt(15, empleado.getEmpJefeInmediato());
            ps.setFloat(16, empleado.getEmpSalario());
            ps.setString(17, empleado.getEmpTipoDeContrato());
            ps.setString(18, empleado.getEmpCodigo());
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<CEFAS_Empleado> obtenerEmpleados()
    {
        List<CEFAS_Empleado> listaEmpleados = new ArrayList<CEFAS_Empleado>();
        CEFAS_Empleado emp;
        try {
            conexiondb = ConexionDB.getConexion();
            st = conexiondb.createStatement();
            rs = st.executeQuery(SQL_SELECT_ALL);
            while(rs.next())
            {
                emp = new CEFAS_Empleado();
                emp.setEmpCodigo(rs.getString("empCodigo"));
                emp.setEmpNombre(rs.getString("empNombre"));
                emp.setEmpFoto(rs.getString("empFoto"));
                listaEmpleados.add(emp);
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaEmpleados;
    }
}

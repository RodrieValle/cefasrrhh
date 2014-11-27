/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.datos;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Usuario;
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
public class CEFAS_UsuarioDAO {
    
    //INSERT INTO `CEFAS_USUARIO`(`USRCODIGO`, `EMPCODIGO`, `USRNOMBRE`, `USRPASSWORD`,
    //`USRTIPO`) VALUES (1,1,AES_Encrypt('emp01', 'seguridadCEFAS*'),AES_Encrypt('12345', 'seguridadCEFAS*'),'director')
    //USUARIO : emp01 CONTRASEÑA: 12345
    
    private final String SQL_INSERT = "INSERT INTO CEFAS_USUARIO (USRCODIGO, EMPCODIGO, USRNOMBRE, USRPASSWORD, USRTIPO) "
            + "VALUES(NULL, ?, AES_Encrypt(?, 'seguridadCEFAS*'), AES_Encrypt(?, 'seguridadCEFAS*'), ?)";
    private final String SQL_BUSCARUSUARIO = "SELECT USRCODIGO, EMPCODIGO, AES_DECRYPT(USRNOMBRE,'seguridadCEFAS*'), "
            + "AES_DECRYPT(USRPASSWORD,'seguridadCEFAS*'), USRTIPO FROM CEFAS_USUARIO WHERE AES_DECRYPT(usrnombre,"
            + "'seguridadCEFAS*') = ? and AES_DECRYPT(usrpassword,'seguridadCEFAS*') = ?";
    private final String SQL_UPDATE = "UPDATE CEFAS_USUARIO SET USRPASSWORD = AES_ENCRYPT(?,'seguridadCEFAS*') "
            + "WHERE USRCODIGO = ? AND AES_DECRYPT(USRNOMBRE,'seguridadCEFAS*') = ?";
    private final String SQL_DELETE = "";
    private Connection conexiondb;
    private Statement st;
    private PreparedStatement ps;
    private ResultSet rs;

    public CEFAS_Usuario verificarUsuario(String usuario, String password) {
        CEFAS_Usuario usr = null;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_BUSCARUSUARIO);
            ps.setString(1, usuario);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next())
            {
                usr = new CEFAS_Usuario();
                usr.setUsrCodigo(rs.getInt(1));
                usr.setEmpCodigo(rs.getInt(2));
                usr.setUsrNombre(rs.getString(3));
                usr.setUsrPassword(rs.getString(4));
                usr.setUsrTipo(rs.getString(5));
            }
            ConexionDB.cerrarConexion();
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usr;
    }
    
    public boolean actualizar(int codigoUsuario, String usuario, String password)
    {
        boolean exito = false;
        try {
            conexiondb = ConexionDB.getConexion();
            ps = conexiondb.prepareStatement(SQL_UPDATE);
            ps.setString(1, password);
            ps.setInt(2, codigoUsuario);
            ps.setString(3, usuario);
            ps.executeUpdate();
            ConexionDB.cerrarConexion();
            exito = true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exito;
    }

    public boolean registrar(CEFAS_Usuario usuario) {
        boolean exito = false;
        try {
            int empcodigo = 0;
            conexiondb = ConexionDB.getConexion();
            //ultimo empleado registrado
            rs = conexiondb.createStatement().executeQuery("SELECT MAX(EMPCODIGO) as maximo FROM CEFAS_EMPLEADO");
            while(rs.next())
            {
                empcodigo = rs.getInt("maximo");
            }
            ps = conexiondb.prepareStatement(SQL_INSERT);
            ps.setInt(1, empcodigo);
            ps.setString(2, usuario.getUsrNombre());
            ps.setString(3, usuario.getUsrPassword());
            ps.setString(4, usuario.getUsrTipo());
            ps.execute();
            ConexionDB.cerrarConexion();
            exito = true;
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exito;
    }
}

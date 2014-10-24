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
    
    private final String SQL_INSERT = "";
    private final String SQL_BUSCARUSUARIO = "SELECT USRCODIGO, EMPCODIGO, AES_DECRYPT(USRNOMBRE,'seguridadCEFAS*'), "
            + "AES_DECRYPT(USRPASSWORD,'seguridadCEFAS*'), USRTIPO FROM CEFAS_USUARIO WHERE AES_DECRYPT(usrnombre,"
            + "'seguridadCEFAS*') = ? and AES_DECRYPT(usrpassword,'seguridadCEFAS*') = ?";
    private final String SQL_UPDATE = "";
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
                conexiondb.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CEFAS_UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usr;
    }
}

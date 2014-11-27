/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_UsuarioDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Usuario;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Usuario {
    
    private CEFAS_UsuarioDAO daoUsuario = new CEFAS_UsuarioDAO();
    
    public CEFAS_Usuario verificarUsuario(String usuario, String password){
        return daoUsuario.verificarUsuario(usuario, password);
    }
    
    public boolean actualizar(int codigoUsuario, String usuario, String password)
    {
        return daoUsuario.actualizar(codigoUsuario, usuario, password);
    }
    
    public boolean registrar(String usuarioNombre, String password, String tipo)
    {
        CEFAS_Usuario usuario = new CEFAS_Usuario();
        usuario.setUsrNombre(usuarioNombre);
        usuario.setUsrPassword(password);
        usuario.setUsrTipo(tipo);
        return daoUsuario.registrar(usuario);
    }
}

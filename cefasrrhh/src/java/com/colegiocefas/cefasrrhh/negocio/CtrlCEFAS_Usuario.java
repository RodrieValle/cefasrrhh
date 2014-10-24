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
}

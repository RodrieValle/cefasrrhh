/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_AvisoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Aviso {
    
    private CEFAS_AvisoDAO daoAviso = new CEFAS_AvisoDAO();
    
    public List<CEFAS_Aviso> consultarAvisos(String usuario){
        return daoAviso.consultarAvisos(usuario);
    }
    
}

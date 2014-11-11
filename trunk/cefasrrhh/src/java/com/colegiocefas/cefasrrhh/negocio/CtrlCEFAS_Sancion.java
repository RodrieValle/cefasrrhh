/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

/**
 *
 * @author Portillo
 */
import com.colegiocefas.cefasrrhh.datos.CEFAS_SancionDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Sancion {
    private CEFAS_SancionDAO daoSancion = new CEFAS_SancionDAO();
    
    public void guardarSancion(CEFAS_Sancion sancion){
        daoSancion.almacenarSancion(sancion);
    }
        
    
}

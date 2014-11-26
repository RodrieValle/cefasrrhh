/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EspecialidadDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Especialidad;
import java.util.List;

/**
 *
 * @author Sergio
 */
public class CtrlCEFAS_Especialidad {
    
    private CEFAS_EspecialidadDAO daoEspecialidad = new CEFAS_EspecialidadDAO();
    
   public List<CEFAS_Especialidad> obtenerEspecialidad()
    {
        return daoEspecialidad.obtenerEspecialidad();
    }
}

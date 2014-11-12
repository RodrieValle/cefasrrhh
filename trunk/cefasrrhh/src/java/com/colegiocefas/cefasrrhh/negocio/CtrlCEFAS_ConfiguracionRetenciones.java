/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_ConfiguracionRetenciones;
import com.colegiocefas.cefasrrhh.datos.CEFAS_ConfiguracionRetencionesDAO;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_ConfiguracionRetenciones {
    
    CEFAS_ConfiguracionRetencionesDAO daoretencion = new CEFAS_ConfiguracionRetencionesDAO();
    
    public List<CEFAS_ConfiguracionRetenciones> obtenerRetenciones()
    {
        return daoretencion.obtenerRetenciones();
    }
    
}
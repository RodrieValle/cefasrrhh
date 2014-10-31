/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_ActividadDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Actividad;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Actividad {
    CEFAS_ActividadDAO actividadDao = new CEFAS_ActividadDAO();
    
    public boolean guardar(Date fecha, String descripcion)
    {
        CEFAS_Actividad actividad = new CEFAS_Actividad();
        actividad.setActFecha(fecha);
        actividad.setActDescripcion(descripcion);
        return actividadDao.guardar(actividad);
    }
    
    public List<CEFAS_Actividad> obtenerActividades()
    {
        return actividadDao.obtenerActividades();
    }
}

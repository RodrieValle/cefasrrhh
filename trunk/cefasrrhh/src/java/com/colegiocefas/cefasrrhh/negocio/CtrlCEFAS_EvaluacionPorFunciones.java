/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EvaluacionPorFuncionesDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorFunciones;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_EvaluacionPorFunciones {

	CEFAS_EvaluacionPorFuncionesDAO evalfDao = new CEFAS_EvaluacionPorFuncionesDAO ();
    
     public boolean guardar(Date fecha, String ruta)
    {
        CEFAS_EvaluacionPorFunciones evalf = new CEFAS_EvaluacionPorFunciones();
        evalf.setEfuFecha(fecha);
        evalf.setEfuRutaArchivo(ruta);
        return evalfDao.guardar(evalf);
    }
    
    public List<CEFAS_EvaluacionPorFunciones> obtenerEvaluacionPorFuncionesById(int codigoEmpleado)
    {
        return evalfDao.obtenerEvaluacionPorFuncionesById(codigoEmpleado);
    }
    
   
    /*public void actualizar(Date fecha, String ruta)
    {
        CEFAS_EvaluacionPorFunciones evalf = new CEFAS_EvaluacionPorFunciones(id, fecha, ruta);
        evalfDao.actualizar(evalf);
    }
    */
    public void eliminarActividadById(String id)
    {
        evalfDao.eliminarById(id);
    }
   

}

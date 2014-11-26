/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EvaluacionDeClasesDAO;//CEFAS_EvaluacionDeClases
import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionDeClases;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_EvaluacionDeClases {

	CEFAS_EvaluacionDeClasesDAO evalcDao = new CEFAS_EvaluacionDeClasesDAO ();
    
     public boolean guardar(String codigoEmpleado, Date fecha, String ruta)
    {
        CEFAS_EvaluacionDeClases evalc = new CEFAS_EvaluacionDeClases();
        evalc.setEmpCodigo(codigoEmpleado);
        evalc.setEclFecha(fecha);
        evalc.setEclRutaArchivo(ruta);
        return evalcDao.guardar(evalc);
    }
    
    public List<CEFAS_EvaluacionDeClases> obtenerEvaluacionDeClasesById(int codigoEmpleado)
    {
        return evalcDao.obtenerEvaluacionDeClasesById(codigoEmpleado);
    }
    
   /*
    public void actualizar(Date fecha, String ruta)
    {
        CEFAS_EvaluacionDeClases evalc = new CEFAS_EvaluacionDeClases(id, fecha, ruta);
        evalDao.actualizar(evalc);
    }*/
    
    public void eliminarActividadById(String id)
    {
        evalcDao.eliminarById(id);
    }
   

}
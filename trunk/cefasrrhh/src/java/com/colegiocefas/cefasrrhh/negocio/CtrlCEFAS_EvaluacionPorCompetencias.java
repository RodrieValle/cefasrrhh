/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EvaluacionPorCompetenciasDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorCompetencias;
import java.util.Date;
import java.util.List;


/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_EvaluacionPorCompetencias {
    
        CEFAS_EvaluacionPorCompetenciasDAO evalDao = new CEFAS_EvaluacionPorCompetenciasDAO ();

    
     public boolean guardar(Date fecha, String ruta)
    {
        CEFAS_EvaluacionPorCompetencias eval = new CEFAS_EvaluacionPorCompetencias();
        eval.setEcoFecha(fecha);
        eval.setEcoRutaArchivo(ruta);
        return evalDao.guardar(eval);
    }
    
    public List<CEFAS_EvaluacionPorCompetencias> obtenerEvaluacionPorcompetenciasById()
    {
        return evalDao.obtenerEvaluacionPorcompetenciasById();
    }
    
  
   /* public void actualizar(Date fecha, String ruta)
    {
        CEFAS_EvaluacionPorCompetencias eval = new CEFAS_EvaluacionPorCompetencias(id, fecha, ruta);
        evalDao.actualizar(eval);
    }*/
    
    public void eliminarActividadById(String id)
    {
        evalDao.eliminarById(id);
    }
   

}
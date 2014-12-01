/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EvaluacionCandidatoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionCandidato;
import java.util.Date;
import java.util.List;

public class CtrlCEFAS_EvaluacionCandidato {

    private CEFAS_EvaluacionCandidatoDAO daoEvaluacionCandidato = new CEFAS_EvaluacionCandidatoDAO();

    public void guardarEvaluacion(CEFAS_EvaluacionCandidato evccan) {

        
        daoEvaluacionCandidato.almacenarEvaluacion(evccan);
    }
    public CEFAS_EvaluacionCandidato getEvaluacion(String duiCdt)
    {
        return daoEvaluacionCandidato.obtenerEvaluacion(duiCdt);
    }
    
}

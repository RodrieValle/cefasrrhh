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

    public void guardarEvaluacion(String DUI, String evcObservacionesReferencias, Date evcFechaEntrevista, String evcComentarioEntrevista, Date evcFechaExamenAptitud, Double evcNotaExamenAptitud, String evcComentarioExamenAptitud, Date evcFechaExamenPsico, Double evcNotaExamenPsico, String evcComentarioExamenPsico) {

        CEFAS_EvaluacionCandidato evccan = new CEFAS_EvaluacionCandidato();
        evccan.setCdtDUI(DUI);
        evccan.setEvcObservacionesReferencias(evcObservacionesReferencias);
        evccan.setEvcFechaEntrevista(evcFechaEntrevista);
        evccan.setEvcComentarioEntrevista(evcComentarioEntrevista);
        evccan.setEvcFechaExamenAptitud(evcFechaExamenAptitud);
        evccan.setEvcNotaExamenAptitud(evcNotaExamenAptitud);
        evccan.setEvcComentarioExamenAptitud(evcComentarioExamenAptitud);
        evccan.setEvcFechaExamenPsico(evcFechaExamenPsico);
        evccan.setEvcNotaExamenPsico(evcNotaExamenPsico);
        evccan.setEvcCometarioExamenPsico(evcComentarioExamenPsico);
        daoEvaluacionCandidato.almacenarEvaluacion(evccan);
    }
    public List<CEFAS_EvaluacionCandidato> getEvaluacion(String codigo)
    {
        return daoEvaluacionCandidato.obtenerEvaluacion(codigo);
    }
    
}

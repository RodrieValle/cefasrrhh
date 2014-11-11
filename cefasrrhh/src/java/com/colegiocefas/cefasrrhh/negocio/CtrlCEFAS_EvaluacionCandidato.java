/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EvaluacionCandidatoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionCandidato;
import java.util.Date;

public class CtrlCEFAS_EvaluacionCandidato {

    private CEFAS_EvaluacionCandidatoDAO daoEvaluacionCandidato = new CEFAS_EvaluacionCandidatoDAO();

    public void guardarEvaluacion(String DUI, String ecvCodigo, String evcObservacionesReferencias, Date evcFechaEntrevista, String evcComentarioEntrevista, Date evcFechaExamenAptitud, String evcNotaExamenAptitud, String evcComentarioExamenAptitud, Date evcFechaExamenPsico, String evcNotaExamenPsico, String evcComentarioExamenPsico) {

        CEFAS_EvaluacionCandidato evaluacioncan = new CEFAS_EvaluacionCandidato();

        evaluacioncan.setCdtDUI(DUI);
        evaluacioncan.setEvcCodigo(ecvCodigo);
        evaluacioncan.setEvcObservacionesReferencias(evcObservacionesReferencias);
        evaluacioncan.setEvcFechaEntrevista(evcFechaEntrevista);
        evaluacioncan.setEvcComentarioEntrevista(evcComentarioEntrevista);
        evaluacioncan.setEvcFechaExamenAptitud(evcFechaExamenAptitud);
        evaluacioncan.setEvcNotaExamenAptitud(evcNotaExamenAptitud);
        evaluacioncan.setEvcComentarioExamenAptitud(evcComentarioExamenAptitud);
        evaluacioncan.setEvcFechaExamenPsico(evcFechaExamenPsico);
        evaluacioncan.setEvcFechaExamenPsico(evcFechaExamenPsico);
        evaluacioncan.setEvcCometarioExamenPsico(evcComentarioExamenPsico);
        daoEvaluacionCandidato.almacenarEvaluacion(evaluacioncan);
    }
}

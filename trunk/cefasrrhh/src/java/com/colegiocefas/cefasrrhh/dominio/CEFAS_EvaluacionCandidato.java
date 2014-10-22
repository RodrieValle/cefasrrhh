/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

import java.util.Date;

/**
 *
 * @author Portillo
 */
public class CEFAS_EvaluacionCandidato {
    
    private String cdtDUI;
    private String evcCodigo;
    private String evcObservacionesReferencias;
    private Date   evcFechaEntrevista;
    private String evcComentarioEntrevista;
    private Date   evcFechaExamenAptitud;
    private String evcNotaExamenAptitud;
    private String evcComentarioExamenAptitud;
    private Date   evcFechaExamenPsico;
    private String evcNotaExamenPsico;
    private String evcCometarioExamenPsico;

    public CEFAS_EvaluacionCandidato() {
    }

    public CEFAS_EvaluacionCandidato(String cdtDUI, String evcCodigo, String evcObservacionesReferencias, Date evcFechaEntrevista, String evcComentarioEntrevista, Date evcFechaExamenAptitud, String evcNotaExamenAptitud, String evcComentarioExamenAptitud, Date evcFechaExamenPsico, String evcNotaExamenPsico, String evcCometarioExamenPsico) {
        this.cdtDUI = cdtDUI;
        this.evcCodigo = evcCodigo;
        this.evcObservacionesReferencias = evcObservacionesReferencias;
        this.evcFechaEntrevista = evcFechaEntrevista;
        this.evcComentarioEntrevista = evcComentarioEntrevista;
        this.evcFechaExamenAptitud = evcFechaExamenAptitud;
        this.evcNotaExamenAptitud = evcNotaExamenAptitud;
        this.evcComentarioExamenAptitud = evcComentarioExamenAptitud;
        this.evcFechaExamenPsico = evcFechaExamenPsico;
        this.evcNotaExamenPsico = evcNotaExamenPsico;
        this.evcCometarioExamenPsico = evcCometarioExamenPsico;
    }

    public String getCdtDUI() {
        return cdtDUI;
    }

    public void setCdtDUI(String cdtDUI) {
        this.cdtDUI = cdtDUI;
    }

    public String getEvcCodigo() {
        return evcCodigo;
    }

    public void setEvcCodigo(String evcCodigo) {
        this.evcCodigo = evcCodigo;
    }

    public String getEvcObservacionesReferencias() {
        return evcObservacionesReferencias;
    }

    public void setEvcObservacionesReferencias(String evcObservacionesReferencias) {
        this.evcObservacionesReferencias = evcObservacionesReferencias;
    }

    public Date getEvcFechaEntrevista() {
        return evcFechaEntrevista;
    }

    public void setEvcFechaEntrevista(Date evcFechaEntrevista) {
        this.evcFechaEntrevista = evcFechaEntrevista;
    }

    public String getEvcComentarioEntrevista() {
        return evcComentarioEntrevista;
    }

    public void setEvcComentarioEntrevista(String evcComentarioEntrevista) {
        this.evcComentarioEntrevista = evcComentarioEntrevista;
    }

    public Date getEvcFechaExamenAptitud() {
        return evcFechaExamenAptitud;
    }

    public void setEvcFechaExamenAptitud(Date evcFechaExamenAptitud) {
        this.evcFechaExamenAptitud = evcFechaExamenAptitud;
    }

    public String getEvcNotaExamenAptitud() {
        return evcNotaExamenAptitud;
    }

    public void setEvcNotaExamenAptitud(String evcNotaExamenAptitud) {
        this.evcNotaExamenAptitud = evcNotaExamenAptitud;
    }

    public String getEvcComentarioExamenAptitud() {
        return evcComentarioExamenAptitud;
    }

    public void setEvcComentarioExamenAptitud(String evcComentarioExamenAptitud) {
        this.evcComentarioExamenAptitud = evcComentarioExamenAptitud;
    }

    public Date getEvcFechaExamenPsico() {
        return evcFechaExamenPsico;
    }

    public void setEvcFechaExamenPsico(Date evcFechaExamenPsico) {
        this.evcFechaExamenPsico = evcFechaExamenPsico;
    }

    public String getEvcNotaExamenPsico() {
        return evcNotaExamenPsico;
    }

    public void setEvcNotaExamenPsico(String evcNotaExamenPsico) {
        this.evcNotaExamenPsico = evcNotaExamenPsico;
    }

    public String getEvcCometarioExamenPsico() {
        return evcCometarioExamenPsico;
    }

    public void setEvcCometarioExamenPsico(String evcCometarioExamenPsico) {
        this.evcCometarioExamenPsico = evcCometarioExamenPsico;
    }
    
    

    
}

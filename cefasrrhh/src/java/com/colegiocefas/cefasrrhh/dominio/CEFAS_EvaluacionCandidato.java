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
    private int evcCodigo;
    private String evcObservacionesReferencias;
    private Date   evcFechaEntrevista;
    private String evcComentarioEntrevista;
    private Date   evcFechaExamenAptitud;
    private Double evcNotaExamenAptitud;
    private String evcComentarioExamenAptitud;
    private Date   evcFechaExamenPsico;
    private Double evcNotaExamenPsico;
    private String evcCometarioExamenPsico;
    private CEFAS_Candidato dui;

    public CEFAS_EvaluacionCandidato() {
    }

    public CEFAS_EvaluacionCandidato(String cdtDUI, int evcCodigo, String evcObservacionesReferencias, Date evcFechaEntrevista, String evcComentarioEntrevista, Date evcFechaExamenAptitud, Double evcNotaExamenAptitud, String evcComentarioExamenAptitud, Date evcFechaExamenPsico, Double evcNotaExamenPsico, String evcCometarioExamenPsico,CEFAS_Candidato dui) {
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
        this.dui=dui;
    }

    public String getCdtDUI() {
        return cdtDUI;
    }

    public void setCdtDUI(String cdtDUI) {
        this.cdtDUI = cdtDUI;
    }

    public int getEvcCodigo() {
        return evcCodigo;
    }

    public void setEvcCodigo(int evcCodigo) {
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

    public Double getEvcNotaExamenAptitud() {
        return evcNotaExamenAptitud;
    }

    public void setEvcNotaExamenAptitud(Double evcNotaExamenAptitud) {
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

    public Double getEvcNotaExamenPsico() {
        return evcNotaExamenPsico;
    }

    public void setEvcNotaExamenPsico(Double evcNotaExamenPsico) {
        this.evcNotaExamenPsico = evcNotaExamenPsico;
    }

    public String getEvcCometarioExamenPsico() {
        return evcCometarioExamenPsico;
    }

    public void setEvcCometarioExamenPsico(String evcCometarioExamenPsico) {
        this.evcCometarioExamenPsico = evcCometarioExamenPsico;
    }
    
    public CEFAS_Candidato getDui() {
        return dui;
    }

    public void setDui(CEFAS_Candidato edui) {
        this.dui = dui;
    }
    

    
}

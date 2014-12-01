/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

/**
 *
 * @author Portillo
 */
public class CEFAS_Candidato {
    
    private String cdtDUI;
    private String evcCodigo;
    private String cdtNombre;   
    private int espCodigo;
    private CEFAS_Especialidad especialidad;
    private String cdtCurriculum;

    public CEFAS_Candidato() {
    }

    public CEFAS_Candidato(String cdtDUI, String evcCodigo, String cdtNombre, int espCodigo, String cdtCurriculum) {
        this.cdtDUI = cdtDUI;
        this.evcCodigo = evcCodigo;
        this.cdtNombre = cdtNombre;
        this.espCodigo = espCodigo;
        this.cdtCurriculum = cdtCurriculum;
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

    public String getCdtNombre() {
        return cdtNombre;
    }

    public void setCdtNombre(String cdtNombre) {
        this.cdtNombre = cdtNombre;
    }

    public int getEspCodigo() {
        return espCodigo;
    }

    public void setEspCodigo(int espCodigo) {
        this.espCodigo = espCodigo;
    }

    public String getCdtCurriculum() {
        return cdtCurriculum;
    }

    public void setCdtCurriculum(String cdtCurriculum) {
        this.cdtCurriculum = cdtCurriculum;
    }

    public CEFAS_Especialidad getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(CEFAS_Especialidad especialidad) {
        this.especialidad = especialidad;
    }
    
    
}

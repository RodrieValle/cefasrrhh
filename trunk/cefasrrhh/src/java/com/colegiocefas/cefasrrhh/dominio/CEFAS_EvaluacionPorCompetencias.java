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
public class CEFAS_EvaluacionPorCompetencias {
    
    private String ecoCodigo;
    private String empCodigo;
    private Date ecoFecha;
    private String ecoRutaArchivo;  

    public CEFAS_EvaluacionPorCompetencias() {
    }

    public CEFAS_EvaluacionPorCompetencias(String ecoCodigo, String empCodigo, Date ecoFecha, String ecoRutaArchivo) {
        this.ecoCodigo = ecoCodigo;
        this.empCodigo = empCodigo;
        this.ecoFecha = ecoFecha;
        this.ecoRutaArchivo = ecoRutaArchivo;
    }

    public String getEcoCodigo() {
        return ecoCodigo;
    }

    public void setEcoCodigo(String ecoCodigo) {
        this.ecoCodigo = ecoCodigo;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public Date getEcoFecha() {
        return ecoFecha;
    }

    public void setEcoFecha(Date ecoFecha) {
        this.ecoFecha = ecoFecha;
    }

    public String getEcoRutaArchivo() {
        return ecoRutaArchivo;
    }

    public void setEcoRutaArchivo(String ecoRutaArchivo) {
        this.ecoRutaArchivo = ecoRutaArchivo;
    }
    
    
    
}

    
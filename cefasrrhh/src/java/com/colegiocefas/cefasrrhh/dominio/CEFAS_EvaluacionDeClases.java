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
public class CEFAS_EvaluacionDeClases {
    
    private String empCodigo;
    private String eclCodigo;
    private Date   eclFecha;
    private String eclRutaArchivo;

    public CEFAS_EvaluacionDeClases() {
    }

    public CEFAS_EvaluacionDeClases(String empCodigo, String eclCodigo, Date eclFecha, String eclRutaArchivo) {
        this.empCodigo = empCodigo;
        this.eclCodigo = eclCodigo;
        this.eclFecha = eclFecha;
        this.eclRutaArchivo = eclRutaArchivo;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getEclCodigo() {
        return eclCodigo;
    }

    public void setEclCodigo(String eclCodigo) {
        this.eclCodigo = eclCodigo;
    }

    public Date getEclFecha() {
        return eclFecha;
    }

    public void setEclFecha(Date eclFecha) {
        this.eclFecha = eclFecha;
    }

    public String getEclRutaArchivo() {
        return eclRutaArchivo;
    }

    public void setEclRutaArchivo(String eclRutaArchivo) {
        this.eclRutaArchivo = eclRutaArchivo;
    }
    
    
    
}

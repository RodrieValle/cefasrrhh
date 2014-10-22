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
public class CEFAS_EvaluacionPorFunciones {
   
    private String efuCodigo;
    private String empCodigo;
    private Date efuFecha;
    private String efuRutaArchivo;

    public CEFAS_EvaluacionPorFunciones() {
    }

    public CEFAS_EvaluacionPorFunciones(String efuCodigo, String empCodigo, Date efuFecha, String efuRutaArchivo) {
        this.efuCodigo = efuCodigo;
        this.empCodigo = empCodigo;
        this.efuFecha = efuFecha;
        this.efuRutaArchivo = efuRutaArchivo;
    }

    public String getEfuCodigo() {
        return efuCodigo;
    }

    public void setEfuCodigo(String efuCodigo) {
        this.efuCodigo = efuCodigo;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public Date getEfuFecha() {
        return efuFecha;
    }

    public void setEfuFecha(Date efuFecha) {
        this.efuFecha = efuFecha;
    }

    public String getEfuRutaArchivo() {
        return efuRutaArchivo;
    }

    public void setEfuRutaArchivo(String efuRutaArchivo) {
        this.efuRutaArchivo = efuRutaArchivo;
    }
    
    
    
}

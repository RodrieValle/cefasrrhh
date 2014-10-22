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
public class CEFAS_Actividad {
    
    private String actCodigo;
    private Date   actFecha;
    private String actDescripcion;

    public CEFAS_Actividad() {
    }

    public CEFAS_Actividad(String actCodigo, Date actFecha, String actDescripcion) {
        this.actCodigo = actCodigo;
        this.actFecha = actFecha;
        this.actDescripcion = actDescripcion;
    }

    public String getActCodigo() {
        return actCodigo;
    }

    public void setActCodigo(String actCodigo) {
        this.actCodigo = actCodigo;
    }

    public Date getActFecha() {
        return actFecha;
    }

    public void setActFecha(Date actFecha) {
        this.actFecha = actFecha;
    }

    public String getActDescripcion() {
        return actDescripcion;
    }

    public void setActDescripcion(String actDescripcion) {
        this.actDescripcion = actDescripcion;
    }
    
    
    
}

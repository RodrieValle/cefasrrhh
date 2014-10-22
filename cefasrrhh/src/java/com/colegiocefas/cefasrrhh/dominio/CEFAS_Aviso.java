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
public class CEFAS_Aviso {
 
    private String avsCodigo;
    private Date   avsFecha;
    private String avsDescripcion;

    public CEFAS_Aviso() {
    }

    public CEFAS_Aviso(String avsCodigo, Date avsFecha, String avsDescripcion) {
        this.avsCodigo = avsCodigo;
        this.avsFecha = avsFecha;
        this.avsDescripcion = avsDescripcion;
    }

    public String getAvsCodigo() {
        return avsCodigo;
    }

    public void setAvsCodigo(String avsCodigo) {
        this.avsCodigo = avsCodigo;
    }

    public Date getAvsFecha() {
        return avsFecha;
    }

    public void setAvsFecha(Date avsFecha) {
        this.avsFecha = avsFecha;
    }

    public String getAvsDescripcion() {
        return avsDescripcion;
    }

    public void setAvsDescripcion(String avsDescripcion) {
        this.avsDescripcion = avsDescripcion;
    }
    
    
    
}

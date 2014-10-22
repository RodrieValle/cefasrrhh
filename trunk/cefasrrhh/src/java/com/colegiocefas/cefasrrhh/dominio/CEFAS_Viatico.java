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
public class CEFAS_Viatico {
    
    private String empCodigo;
    private String viaCodigo;
    private Date   viaFecha;
    private Float  viaCantidad;

    public CEFAS_Viatico() {
    }

    public CEFAS_Viatico(String empCodigo, String viaCodigo, Date viaFecha, Float viaCantidad) {
        this.empCodigo = empCodigo;
        this.viaCodigo = viaCodigo;
        this.viaFecha = viaFecha;
        this.viaCantidad = viaCantidad;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getViaCodigo() {
        return viaCodigo;
    }

    public void setViaCodigo(String viaCodigo) {
        this.viaCodigo = viaCodigo;
    }

    public Date getViaFecha() {
        return viaFecha;
    }

    public void setViaFecha(Date viaFecha) {
        this.viaFecha = viaFecha;
    }

    public Float getViaCantidad() {
        return viaCantidad;
    }

    public void setViaCantidad(Float viaCantidad) {
        this.viaCantidad = viaCantidad;
    }

    
    
}

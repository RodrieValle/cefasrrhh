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
    
    private int empCodigo;
    private int viaCodigo;
    private Date   viaFecha;
    private Float  viaCantidad;
    private String viaDescripcion;

    
    
     public CEFAS_Viatico(int empCodigo, int viaCodigo, Date viaFecha, Float viaCantidad, String viaDescripcion) {
        this.empCodigo = empCodigo;
        this.viaCodigo = viaCodigo;
        this.viaFecha = viaFecha;
        this.viaCantidad = viaCantidad;
        this.viaDescripcion = viaDescripcion;
    }
     
    public CEFAS_Viatico() {
    }

    public String getViaDescripcion() {
        return viaDescripcion;
    }

    public void setViaDescripcion(String viaDescripcion) {
        this.viaDescripcion = viaDescripcion;
    }

    

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getViaCodigo() {
        return viaCodigo;
    }

    public void setViaCodigo(int viaCodigo) {
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

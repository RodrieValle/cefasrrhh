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
public class CEFAS_Anticipo {
  
    private String empCodigo;
    private String atpCodigo;
    private Date atpFecha;
    private float atpCantidad;

    public CEFAS_Anticipo() {
    }

    public CEFAS_Anticipo(String empCodigo, String atpCodigo, Date atpFecha, float atpCantidad) {
        this.empCodigo = empCodigo;
        this.atpCodigo = atpCodigo;
        this.atpFecha = atpFecha;
        this.atpCantidad = atpCantidad;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getAtpCodigo() {
        return atpCodigo;
    }

    public void setAtpCodigo(String atpCodigo) {
        this.atpCodigo = atpCodigo;
    }

    public Date getAtpFecha() {
        return atpFecha;
    }

    public void setAtpFecha(Date atpFecha) {
        this.atpFecha = atpFecha;
    }

    public float getAtpCantidad() {
        return atpCantidad;
    }

    public void setAtpCantidad(float atpCantidad) {
        this.atpCantidad = atpCantidad;
    }

    
    
}

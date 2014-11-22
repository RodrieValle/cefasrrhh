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
public class CEFAS_Sancion {
    
    private int empCodigo;
    private int scnCodigo;   
    private Date   scnFecha;
    private String scnMotivo;
    private String scnSancion;

    public CEFAS_Sancion() {
    }

    public CEFAS_Sancion(int empCodigo, int scnCodigo, Date scnFecha, String scnMotivo, String scnSancion) {
        this.empCodigo = empCodigo;
        this.scnCodigo = scnCodigo;
        this.scnFecha = scnFecha;
        this.scnMotivo = scnMotivo;
        this.scnSancion = scnSancion;
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getScnCodigo() {
        return scnCodigo;
    }

    public void setScnCodigo(int scnCodigo) {
        this.scnCodigo = scnCodigo;
    }

    public Date getScnFecha() {
        return scnFecha;
    }

    public void setScnFecha(Date scnFecha) {
        this.scnFecha = scnFecha;
    }

    public String getScnMotivo() {
        return scnMotivo;
    }

    public void setScnMotivo(String scnMotivo) {
        this.scnMotivo = scnMotivo;
    }

    public String getScnSancion() {
        return scnSancion;
    }

    public void setScnSancion(String scnSancion) {
        this.scnSancion = scnSancion;
    }
    
    
    
}

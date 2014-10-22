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
public class CEFAS_TiempoExtra {
    
    private String empCodigo;
    private String texCodigo;   
    private Date texFecha;
    private Date texHoraInicio;
    private Date texHoraFin;
    private Date texDeltaTiempo;
    private float texValorDinero;

    public CEFAS_TiempoExtra() {
    }

    public CEFAS_TiempoExtra(String empCodigo, String texCodigo, Date texFecha, Date texHoraInicio, Date texHoraFin, Date texDeltaTiempo, float texValorDinero) {
        this.empCodigo = empCodigo;
        this.texCodigo = texCodigo;
        this.texFecha = texFecha;
        this.texHoraInicio = texHoraInicio;
        this.texHoraFin = texHoraFin;
        this.texDeltaTiempo = texDeltaTiempo;
        this.texValorDinero = texValorDinero;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getTexCodigo() {
        return texCodigo;
    }

    public void setTexCodigo(String texCodigo) {
        this.texCodigo = texCodigo;
    }

    public Date getTexFecha() {
        return texFecha;
    }

    public void setTexFecha(Date texFecha) {
        this.texFecha = texFecha;
    }

    public Date getTexHoraInicio() {
        return texHoraInicio;
    }

    public void setTexHoraInicio(Date texHoraInicio) {
        this.texHoraInicio = texHoraInicio;
    }

    public Date getTexHoraFin() {
        return texHoraFin;
    }

    public void setTexHoraFin(Date texHoraFin) {
        this.texHoraFin = texHoraFin;
    }

    public Date getTexDeltaTiempo() {
        return texDeltaTiempo;
    }

    public void setTexDeltaTiempo(Date texDeltaTiempo) {
        this.texDeltaTiempo = texDeltaTiempo;
    }

    public float getTexValorDinero() {
        return texValorDinero;
    }

    public void setTexValorDinero(float texValorDinero) {
        this.texValorDinero = texValorDinero;
    }
    
    
    
}

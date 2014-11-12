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
    
    private int empCodigo;
    private int texCodigo; 
    private int texCodigo2;
    private Date texFecha;
    private Date texHoraInicio;
    private Date texHoraFin;
    private Date texDeltaTiempo;
    private float texValorDinero;

    public CEFAS_TiempoExtra() {
    }

    public CEFAS_TiempoExtra(int empCodigo, int texCodigo, int texCodigo2, Date texFecha, Date texHoraInicio, Date texHoraFin, Date texDeltaTiempo) {
        this.empCodigo = empCodigo;
        this.texCodigo = texCodigo;
        this.texCodigo2 = texCodigo2;
        this.texFecha = texFecha;
        this.texHoraInicio = texHoraInicio;
        this.texHoraFin = texHoraFin;
        this.texDeltaTiempo = texDeltaTiempo;
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getTexCodigo() {
        return texCodigo;
    }

    public void setTexCodigo(int texCodigo) {
        this.texCodigo = texCodigo;
    }

    public int getTexCodigo2() {
        return texCodigo2;
    }

    public void setTexCodigo2(int texCodigo2) {
        this.texCodigo2 = texCodigo2;
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

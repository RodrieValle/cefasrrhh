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
public class CEFAS_LineaDePlanilla {
    private int empCodigo;
    private int plnCodigo;
    private int ldpCodigo;
    private Date ldpFecha;
    private float ldpSueldoBase;
    private float ldpHorasExtra;
    private float ldpAusenciasTardias;
    private float ldpSueldoDevengado;
    private float ldpAfpConfia;
    private float ldpAfpCrecer;
    private float ldpValorNetoSujetoRenta;
    private float ldpImpuestoSobreRenta;
    private float ldpAnticipo;
    private float ldpAbonoPrestamo;
    private float ldpOrdenDeDescuento;
    private float ldpIsss;  
    private float ldpMontoViatico;
    private float ldpLiquidoAPagar;

    public CEFAS_LineaDePlanilla(int empCodigo, int plnCodigo, int ldpCodigo, Date ldpFecha, float ldpSueldoBase, float ldpHorasExtra, float ldpAusenciasTardias, float ldpSueldoDevengado, float ldpAfpConfia, float ldpAfpCrecer, float ldpValorNetoSujetoRenta, float ldpImpuestoSobreRenta, float ldpAnticipo, float ldpAbonoPrestamo, float ldpOrdenDeDescuento, float ldpIsss, float ldpMontoViatico, float ldpLiquidoAPagar) {
        this.empCodigo = empCodigo;
        this.plnCodigo = plnCodigo;
        this.ldpCodigo = ldpCodigo;
        this.ldpFecha = ldpFecha;
        this.ldpSueldoBase = ldpSueldoBase;
        this.ldpHorasExtra = ldpHorasExtra;
        this.ldpAusenciasTardias = ldpAusenciasTardias;
        this.ldpSueldoDevengado = ldpSueldoDevengado;
        this.ldpAfpConfia = ldpAfpConfia;
        this.ldpAfpCrecer = ldpAfpCrecer;
        this.ldpValorNetoSujetoRenta = ldpValorNetoSujetoRenta;
        this.ldpImpuestoSobreRenta = ldpImpuestoSobreRenta;
        this.ldpAnticipo = ldpAnticipo;
        this.ldpAbonoPrestamo = ldpAbonoPrestamo;
        this.ldpOrdenDeDescuento = ldpOrdenDeDescuento;
        this.ldpIsss = ldpIsss;
        this.ldpMontoViatico = ldpMontoViatico;
        this.ldpLiquidoAPagar = ldpLiquidoAPagar;
    }

    public CEFAS_LineaDePlanilla() {
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getLdpCodigo() {
        return ldpCodigo;
    }

    public void setLdpCodigo(int ldpCodigo) {
        this.ldpCodigo = ldpCodigo;
    }

    public Date getLdpFecha() {
        return ldpFecha;
    }

    public void setLdpFecha(Date ldpFecha) {
        this.ldpFecha = ldpFecha;
    }

    public float getLdpSueldoBase() {
        return ldpSueldoBase;
    }

    public void setLdpSueldoBase(float ldpSueldoBase) {
        this.ldpSueldoBase = ldpSueldoBase;
    }

    public float getLdpHorasExtra() {
        return ldpHorasExtra;
    }

    public void setLdpHorasExtra(float ldpHorasExtra) {
        this.ldpHorasExtra = ldpHorasExtra;
    }

    public float getLdpAusenciasTardias() {
        return ldpAusenciasTardias;
    }

    public void setLdpAusenciasTardias(int ldpAusenciasTardias) {
        this.ldpAusenciasTardias = ldpAusenciasTardias;
    }

    public float getLdpSueldoDevengado() {
        return ldpSueldoDevengado;
    }

    public void setLdpSueldoDevengado(float ldpSueldoDevengado) {
        this.ldpSueldoDevengado = ldpSueldoDevengado;
    }

    public float getLdpAfpConfia() {
        return ldpAfpConfia;
    }

    public void setLdpAfpConfia(float ldpAfpConfia) {
        this.ldpAfpConfia = ldpAfpConfia;
    }

    public float getLdpAfpCrecer() {
        return ldpAfpCrecer;
    }

    public void setLdpAfpCrecer(float ldpAfpCrecer) {
        this.ldpAfpCrecer = ldpAfpCrecer;
    }

    public float getLdpValorNetoSujetoRenta() {
        return ldpValorNetoSujetoRenta;
    }

    public void setLdpValorNetoSujetoRenta(float ldpValorNetoSujetoRenta) {
        this.ldpValorNetoSujetoRenta = ldpValorNetoSujetoRenta;
    }

    public float getLdpImpuestoSobreRenta() {
        return ldpImpuestoSobreRenta;
    }

    public void setLdpImpuestoSobreRenta(float ldpImpuestoSobreRenta) {
        this.ldpImpuestoSobreRenta = ldpImpuestoSobreRenta;
    }

    public float getLdpAnticipo() {
        return ldpAnticipo;
    }

    public void setLdpAnticipo(float ldpAnticipo) {
        this.ldpAnticipo = ldpAnticipo;
    }

    public float getLdpAbonoPrestamo() {
        return ldpAbonoPrestamo;
    }

    public void setLdpAbonoPrestamo(float ldpAbonoPrestamo) {
        this.ldpAbonoPrestamo = ldpAbonoPrestamo;
    }

    public float getLdpOrdenDeDescuento() {
        return ldpOrdenDeDescuento;
    }

    public void setLdpOrdenDeDescuento(float ldpOrdenDeDescuento) {
        this.ldpOrdenDeDescuento = ldpOrdenDeDescuento;
    }

    public float getLdpIsss() {
        return ldpIsss;
    }

    public void setLdpIsss(float ldpIsss) {
        this.ldpIsss = ldpIsss;
    }

    public float getLdpMontoViatico() {
        return ldpMontoViatico;
    }

    public void setLdpMontoViatico(float ldpMontoViatico) {
        this.ldpMontoViatico = ldpMontoViatico;
    }

    public float getLdpLiquidoAPagar() {
        return ldpLiquidoAPagar;
    }

    public void setLdpLiquidoAPagar(float ldpLiquidoAPagar) {
        this.ldpLiquidoAPagar = ldpLiquidoAPagar;
    }

    public void setLdpAusenciasTardias(float ldpAusenciasTardias) {
        this.ldpAusenciasTardias = ldpAusenciasTardias;
    }

    public int getPlnCodigo() {
        return plnCodigo;
    }

    public void setPlnCodigo(int plnCodigo) {
        this.plnCodigo = plnCodigo;
    }
    
    

}

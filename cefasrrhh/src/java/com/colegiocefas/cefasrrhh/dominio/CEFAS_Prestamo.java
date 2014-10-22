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
public class CEFAS_Prestamo {
    
    private float empCodigo;
    private float prmCodigo;
    private Date prmFecha;
    private float prmMonto;
    private int prmPlazo;
    private float prmSaldo;
    private float prmCuota;   

    public CEFAS_Prestamo() {
    }

    public CEFAS_Prestamo(float empCodigo, float prmCodigo, Date prmFecha, float prmMonto, int prmPlazo, float prmSaldo, float prmCuota) {
        this.empCodigo = empCodigo;
        this.prmCodigo = prmCodigo;
        this.prmFecha = prmFecha;
        this.prmMonto = prmMonto;
        this.prmPlazo = prmPlazo;
        this.prmSaldo = prmSaldo;
        this.prmCuota = prmCuota;
    }

    public float getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(float empCodigo) {
        this.empCodigo = empCodigo;
    }

    public float getPrmCodigo() {
        return prmCodigo;
    }

    public void setPrmCodigo(float prmCodigo) {
        this.prmCodigo = prmCodigo;
    }

    public Date getPrmFecha() {
        return prmFecha;
    }

    public void setPrmFecha(Date prmFecha) {
        this.prmFecha = prmFecha;
    }

    public float getPrmMonto() {
        return prmMonto;
    }

    public void setPrmMonto(float prmMonto) {
        this.prmMonto = prmMonto;
    }

    public int getPrmPlazo() {
        return prmPlazo;
    }

    public void setPrmPlazo(int prmPlazo) {
        this.prmPlazo = prmPlazo;
    }

    public float getPrmSaldo() {
        return prmSaldo;
    }

    public void setPrmSaldo(float prmSaldo) {
        this.prmSaldo = prmSaldo;
    }

    public float getPrmCuota() {
        return prmCuota;
    }

    public void setPrmCuota(float prmCuota) {
        this.prmCuota = prmCuota;
    }
    
    
    
}

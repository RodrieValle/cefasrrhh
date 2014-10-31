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
public class CEFAS_OrdenDeDescuento {
    
    private int empCodigo;
    private int oddCodigo;
    private Date   oddFecha;    
    private float  oddMonto;
    private int    oddPlazo;
    private float  oddSaldo;
    private float  oddCuota;

    public CEFAS_OrdenDeDescuento() {
    }

    public CEFAS_OrdenDeDescuento(int empCodigo, Date oddFecha, float oddMonto, int oddPlazo, float oddSaldo, float oddCuota) {
        this.empCodigo = empCodigo;
       
        this.oddFecha = oddFecha;
        this.oddMonto = oddMonto;
        this.oddPlazo = oddPlazo;
        this.oddSaldo = oddSaldo;
        this.oddCuota = oddCuota;
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getOddCodigo() {
        return oddCodigo;
    }

    public void setOddCodigo(int oddCodigo) {
        this.oddCodigo = oddCodigo;
    }

    public Date getOddFecha() {
        return oddFecha;
    }

    public void setOddFecha(Date oddFecha) {
        this.oddFecha = oddFecha;
    }

    public float getOddMonto() {
        return oddMonto;
    }

    public void setOddMonto(float oddMonto) {
        this.oddMonto = oddMonto;
    }

    public int getOddPlazo() {
        return oddPlazo;
    }

    public void setOddPlazo(int oddPlazo) {
        this.oddPlazo = oddPlazo;
    }

    public float getOddSaldo() {
        return oddSaldo;
    }

    public void setOddSaldo(float oddSaldo) {
        this.oddSaldo = oddSaldo;
    }

    public float getOddCuota() {
        return oddCuota;
    }

    public void setOddCuota(float oddCuota) {
        this.oddCuota = oddCuota;
    }
    
    
    
}

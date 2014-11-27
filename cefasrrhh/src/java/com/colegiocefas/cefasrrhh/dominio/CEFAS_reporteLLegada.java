/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

import java.util.Date;

/**
 *
 * @author ANIBAL
 */
public class CEFAS_reporteLLegada {
    private int RepCodigo;
    private int empCodigo; 
    private Date repFecha;
    private Date repHoraEntrada;
    private Date repHorallegada;
    private Date repMinutos;
    private float repValorDinero;  

    public CEFAS_reporteLLegada(int RepCodigo, int empCodigo, Date repFecha, Date repHoraEntrada, Date repHorallegada, Date repMinutos, float repValorDinero) {
        this.RepCodigo = RepCodigo;
        this.empCodigo = empCodigo;
        this.repFecha = repFecha;
        this.repHoraEntrada = repHoraEntrada;
        this.repHorallegada = repHorallegada;
        this.repMinutos = repMinutos;
        this.repValorDinero = repValorDinero;
        
        
        
    }

    public CEFAS_reporteLLegada() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getRepCodigo() {
        return RepCodigo;
    }

    public void setRepCodigo(int RepCodigo) {
        this.RepCodigo = RepCodigo;
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public Date getRepFecha() {
        return repFecha;
    }

    public void setRepFecha(Date repFecha) {
        this.repFecha = repFecha;
    }

    public Date getRepHoraEntrada() {
        return repHoraEntrada;
    }

    public void setRepHoraEntrada(Date repHoraEntrada) {
        this.repHoraEntrada = repHoraEntrada;
    }

    public Date getRepHorallegada() {
        return repHorallegada;
    }

    public void setRepHorallegada(Date repHorallegada) {
        this.repHorallegada = repHorallegada;
    }

    public Date getRepMinutos() {
        return repMinutos;
    }

    public void setRepMinutos(Date repMinutos) {
        this.repMinutos = repMinutos;
    }

    public float getRepValorDinero() {
        return repValorDinero;
    }

    public void setRepValorDinero(float repValorDinero) {
        this.repValorDinero = repValorDinero;
    }
    
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

/**
 *
 * @author Portillo
 */
public class CEFAS_ConfiguracionRetenciones {
 
    private String cfgCodigo;
    private String cfgTipo;
    private float  cfgPorcentaje;
    private float  cfgMinimo;
    private float  cfgMaximo;
    private float  cfgSobreExceso;
    private float  cfgCuotaFija;

    public CEFAS_ConfiguracionRetenciones() {
    }

    public CEFAS_ConfiguracionRetenciones(String cfgCodigo, String cfgTipo, float cfgPorcentaje, float cfgMinimo, float cfgMaximo, float cfgSobreExceso, float cfgCuotaFija) {
        this.cfgCodigo = cfgCodigo;
        this.cfgTipo = cfgTipo;
        this.cfgPorcentaje = cfgPorcentaje;
        this.cfgMinimo = cfgMinimo;
        this.cfgMaximo = cfgMaximo;
        this.cfgSobreExceso = cfgSobreExceso;
        this.cfgCuotaFija = cfgCuotaFija;
    }

    public String getCfgCodigo() {
        return cfgCodigo;
    }

    public void setCfgCodigo(String cfgCodigo) {
        this.cfgCodigo = cfgCodigo;
    }

    public String getCfgTipo() {
        return cfgTipo;
    }

    public void setCfgTipo(String cfgTipo) {
        this.cfgTipo = cfgTipo;
    }

    public float getCfgPorcentaje() {
        return cfgPorcentaje;
    }

    public void setCfgPorcentaje(float cfgPorcentaje) {
        this.cfgPorcentaje = cfgPorcentaje;
    }

    public float getCfgMinimo() {
        return cfgMinimo;
    }

    public void setCfgMinimo(float cfgMinimo) {
        this.cfgMinimo = cfgMinimo;
    }

    public float getCfgMaximo() {
        return cfgMaximo;
    }

    public void setCfgMaximo(float cfgMaximo) {
        this.cfgMaximo = cfgMaximo;
    }

    public float getCfgSobreExceso() {
        return cfgSobreExceso;
    }

    public void setCfgSobreExceso(float cfgSobreExceso) {
        this.cfgSobreExceso = cfgSobreExceso;
    }

    public float getCfgCuotaFija() {
        return cfgCuotaFija;
    }

    public void setCfgCuotaFija(float cfgCuotaFija) {
        this.cfgCuotaFija = cfgCuotaFija;
    }

    
    
}

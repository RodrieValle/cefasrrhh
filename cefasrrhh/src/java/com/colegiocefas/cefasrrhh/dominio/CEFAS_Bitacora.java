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
public class CEFAS_Bitacora {
    
    private String empCodigo;
    private String btcCodigo;
    private Date btcFechaHora;
    private String btcDescripcion;

    public CEFAS_Bitacora() {
    }

    public CEFAS_Bitacora(String empCodigo, String btcCodigo, Date btcFechaHora, String btcDescripcion) {
        this.empCodigo = empCodigo;
        this.btcCodigo = btcCodigo;
        this.btcFechaHora = btcFechaHora;
        this.btcDescripcion = btcDescripcion;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getBtcCodigo() {
        return btcCodigo;
    }

    public void setBtcCodigo(String btcCodigo) {
        this.btcCodigo = btcCodigo;
    }

    public Date getBtcFechaHora() {
        return btcFechaHora;
    }

    public void setBtcFechaHora(Date btcFechaHora) {
        this.btcFechaHora = btcFechaHora;
    }

    public String getBtcDescripcion() {
        return btcDescripcion;
    }

    public void setBtcDescripcion(String btcDescripcion) {
        this.btcDescripcion = btcDescripcion;
    }
    
    
    
}

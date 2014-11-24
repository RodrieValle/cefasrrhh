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
    
    private int userCodigo;
    private int btcCodigo;
    private Date btcFechaHora;
    private String btcDescripcion;

    public CEFAS_Bitacora() {
    }

    public CEFAS_Bitacora(int  userCodigo, int btcCodigo, Date btcFechaHora, String btcDescripcion) {
        this. userCodigo = userCodigo;
        this.btcCodigo = btcCodigo;
        this.btcFechaHora = btcFechaHora;
        this.btcDescripcion = btcDescripcion;
    }

    public int getUserCodigo() {
        return  userCodigo;
    }

    public void setUserCodigo(int  userCodigo) {
        this. userCodigo =  userCodigo;
    }

    public int getBtcCodigo() {
        return btcCodigo;
    }

    public void setBtcCodigo(int btcCodigo) {
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

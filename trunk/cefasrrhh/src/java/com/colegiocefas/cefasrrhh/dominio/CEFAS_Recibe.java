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
public class CEFAS_Recibe {
 
    private String empCodigo;
    private String avsCodigo;

    public CEFAS_Recibe() {
    }

    public CEFAS_Recibe(String empCodigo, String avsCodigo) {
        this.empCodigo = empCodigo;
        this.avsCodigo = avsCodigo;
    }

    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getAvsCodigo() {
        return avsCodigo;
    }

    public void setAvsCodigo(String avsCodigo) {
        this.avsCodigo = avsCodigo;
    }
    
    
    
}

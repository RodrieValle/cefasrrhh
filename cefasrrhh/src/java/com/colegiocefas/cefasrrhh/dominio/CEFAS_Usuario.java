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
public class CEFAS_Usuario {
    private int empCodigo;
    private int usrCodigo;
    private String usrNombre;
    private String usrPassword;
    private String usrTipo;

    public CEFAS_Usuario() {
    }

    public CEFAS_Usuario(int empCodigo, int usrCodigo, String usrNombre, String usrPassword, String usrTipo) {
        this.empCodigo = empCodigo;
        this.usrCodigo = usrCodigo;
        this.usrNombre = usrNombre;
        this.usrPassword = usrPassword;
        this.usrTipo = usrTipo;
    }

    public int getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(int empCodigo) {
        this.empCodigo = empCodigo;
    }

    public int getUsrCodigo() {
        return usrCodigo;
    }

    public void setUsrCodigo(int usrCodigo) {
        this.usrCodigo = usrCodigo;
    }

    public String getUsrNombre() {
        return usrNombre;
    }

    public void setUsrNombre(String usrNombre) {
        this.usrNombre = usrNombre;
    }

    public String getUsrPassword() {
        return usrPassword;
    }

    public void setUsrPassword(String usrPassword) {
        this.usrPassword = usrPassword;
    }

    public String getUsrTipo() {
        return usrTipo;
    }

    public void setUsrTipo(String usrTipo) {
        this.usrTipo = usrTipo;
    }
    
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.colegiocefas.cefasrrhh.dominio;

import java.util.Date;

/**
 *
 * @author MARIA JUAREZ
 */
public class CEFAS_Planilla {
    private int plnCodigo;
    private int plnTipo;
    private Date plnFecha;

    
    public CEFAS_Planilla(int plnCodigo, int plnTipo, Date atpFecha) {
        this.plnCodigo = plnCodigo;
        this.plnTipo = plnTipo;
        this.plnFecha = plnFecha;
    }

    public CEFAS_Planilla(){}
    
    
    public Date getPlnFecha() {
        return plnFecha;
    }

    public void setPlnFecha(Date atpFecha) {
        this.plnFecha = atpFecha;
    }

    public int getPlnCodigo() {
        return plnCodigo;
    }

    public void setPlnCodigo(int plnCodigo) {
        this.plnCodigo = plnCodigo;
    }

    public int getPlnTipo() {
        return plnTipo;
    }

    public void setPlnTipo(int plnTipo) {
        this.plnTipo = plnTipo;
    }
    
    
    
    
}

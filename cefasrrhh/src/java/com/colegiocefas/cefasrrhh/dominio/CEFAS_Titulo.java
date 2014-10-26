/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

import java.util.Date;

/**
 *
 * @author Rodrigo
 */
public class CEFAS_Titulo {
    private int ttlcodigo;
    private int empcodigo;
    private String ttltitulo;
    private String ttllugar;
    private Date ttlfecha;

    public CEFAS_Titulo() {
    }

    public int getTtlcodigo() {
        return ttlcodigo;
    }

    public void setTtlcodigo(int ttlcodigo) {
        this.ttlcodigo = ttlcodigo;
    }

    public int getEmpcodigo() {
        return empcodigo;
    }

    public void setEmpcodigo(int empcodigo) {
        this.empcodigo = empcodigo;
    }

    public String getTtltitulo() {
        return ttltitulo;
    }

    public void setTtltitulo(String ttltitulo) {
        this.ttltitulo = ttltitulo;
    }

    public String getTtllugar() {
        return ttllugar;
    }

    public void setTtllugar(String ttllugar) {
        this.ttllugar = ttllugar;
    }

    public Date getTtlfecha() {
        return ttlfecha;
    }

    public void setTtlfecha(Date ttlfecha) {
        this.ttlfecha = ttlfecha;
    }
    
    
}

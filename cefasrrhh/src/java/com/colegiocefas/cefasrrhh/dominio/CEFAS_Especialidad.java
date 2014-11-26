/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

/**
 *
 * @author Sergio
 */
public class CEFAS_Especialidad {
    private int espCodigo;
    private String espNombre;
    
    public CEFAS_Especialidad(){
        
    }
    public CEFAS_Especialidad(int espCodigo,String espNombre){
        this.espCodigo=espCodigo;
        this.espNombre=espNombre;
    }
    public int getEspCodigo(){
        return espCodigo;
    }
    public void setEspCodigo(int espCodigo){
        this.espCodigo=espCodigo;
    }
    public String getEspNombre(){
        return espNombre;
    }
    public void setEspNombre(String espNombre){
        this.espNombre=espNombre;
    }
    
}

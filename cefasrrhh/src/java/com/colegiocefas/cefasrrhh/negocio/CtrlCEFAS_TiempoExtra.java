/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_TiempoExtraDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_TiempoExtra;
import java.util.Date;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_TiempoExtra {
  
    CEFAS_TiempoExtraDAO extradao= new CEFAS_TiempoExtraDAO();
    public void guardarHoras(int codigoemp, Date fecha,Date hInicio,Date hFinal){
   
    
    CEFAS_TiempoExtra textra= new CEFAS_TiempoExtra();
    textra.setEmpCodigo(codigoemp);
    textra.setTexFecha(fecha);
    textra.setTexHoraInicio(hInicio);
    textra.setTexHoraFin(hFinal);
    float tiempoInicial=hInicio.getTime();
    float tiempoFinal=hFinal.getTime(); 
    float resta=tiempoFinal - tiempoInicial;
    //textra.setTexDeltaTiempo(resta);
    //el metodo getTime te devuelve en mili segundos para saberlo en mins debes hacer
    resta=resta /(1000*60);
    //resultado=resta*valor; seria la multiplicacion para encontrar el valor en dinero.
    textra.setTexValorDinero(resta);
    extradao.guardaHorasExtras(textra);
    
     
    }
    
    
}

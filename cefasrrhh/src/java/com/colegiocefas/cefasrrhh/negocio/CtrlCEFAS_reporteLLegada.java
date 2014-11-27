/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_reporteLLegadaDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_reporteLLegada;
import java.util.Date;

/**
 *
 * @author ANIBAL
 */
public class CtrlCEFAS_reporteLLegada {
    CEFAS_reporteLLegadaDAO reportellegadadao=new CEFAS_reporteLLegadaDAO();
    
    
    public boolean guardarReporteLLegada(int codigoemp, Date fecha,Date hEntrada,Date hLLegada){
   
    if(hEntrada.before(hLLegada)){
    CEFAS_reporteLLegada report= new CEFAS_reporteLLegada();
    report.setEmpCodigo(codigoemp);
    report.setRepFecha(fecha);
    report.setRepHoraEntrada(hEntrada);
    report.setRepHorallegada(hLLegada);
    float tiempoInicial=hEntrada.getTime();
    float tiempoFinal=hLLegada.getTime(); 
    
    float resta=tiempoFinal - tiempoInicial;
    //textra.setTexDeltaTiempo(resta);
    //el metodo getTime te devuelve en mili segundos para saberlo en mins debes hacer
    float resultado=((resta /(1000*60))/60)*4;
    
    //resultado=resta*valor; seria la multiplicacion para encontrar el valor en dinero.
    report.setRepValorDinero(resultado);
        
    reportellegadadao.guardarReporteLLegada(report);
    return true;
    }else{
    return false;
            }
     
    }
    
    
}

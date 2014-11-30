/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_reporteLLegadaDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_reporteLLegada;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    
    
    
    //SUMA DE MINUTOS TARDE, VALOR EN DINERO
        public float sumaTardias(int codigo){
        float suma=0;
        List<CEFAS_reporteLLegada> listLlegadas= new ArrayList();
        listLlegadas=getLlegadasEmpleadoFecha(codigo);
        
         for(CEFAS_reporteLLegada llegada: listLlegadas)
        {
            suma=suma+llegada.getRepValorDinero();
        }
        return suma;
    }
    
    
    
    //  LLAMADA A METODO DE RETORNO DE TARDIAS A UNA FECHA DADA
    public List<CEFAS_reporteLLegada> getLlegadasEmpleadoFecha(int codigo)
    {
        CtrlCEFAS_Planilla ctrlPlanilla= new CtrlCEFAS_Planilla();
        CEFAS_Planilla planilla=ctrlPlanilla.getUltimaPlanilla();
        Date fechaUltima=planilla.getPlnFecha();
     
        return reportellegadadao.getllegadasEmpleadoFecha(codigo, fechaUltima);
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_TiempoExtraDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_TiempoExtra;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_TiempoExtra {
  
    CEFAS_TiempoExtraDAO extradao= new CEFAS_TiempoExtraDAO();
    public boolean guardarHoras(int codigoemp, Date fecha,Date hInicio,Date hFinal,int codigo2){
   
    if(hInicio.before(hFinal) && (codigoemp!=codigo2)){
    CEFAS_TiempoExtra textra= new CEFAS_TiempoExtra();
    textra.setEmpCodigo(codigoemp);
    textra.setTexCodigo2(codigo2);
    textra.setTexFecha(fecha);
    textra.setTexHoraInicio(hInicio);
    textra.setTexHoraFin(hFinal);
    float tiempoInicial=hInicio.getTime();
    float tiempoFinal=hFinal.getTime(); 
    float resta=tiempoFinal - tiempoInicial;
    //textra.setTexDeltaTiempo(resta);
    //el metodo getTime te devuelve en mili segundos para saberlo en mins debes hacer
    float resultado=((resta /(1000*60))/60)*4;
    //resultado=resta*valor; seria la multiplicacion para encontrar el valor en dinero.
    textra.setTexValorDinero(resultado);
        
    extradao.guardaHorasExtras(textra);
    return true;
    }else{
    return false;
            }
     
    }
    
    
    
    
    public float sumaHoras(int codigo){
        float suma=0;
        List<CEFAS_TiempoExtra> listExtras= new ArrayList();
        listExtras=getHorasEmpleadoFecha(codigo);
        
         for(CEFAS_TiempoExtra extra: listExtras)
        {
            suma=suma+extra.getTexValorDinero();
        }
        return suma;
    }
    
    
    
    //  LLAMADA A METODO DE RETORNO DE HORAS A UNA FECHA DADA
    public List<CEFAS_TiempoExtra> getHorasEmpleadoFecha(int codigo)
    {
        CtrlCEFAS_Planilla ctrlPlanilla= new CtrlCEFAS_Planilla();
        CEFAS_Planilla planilla=ctrlPlanilla.getUltimaPlanilla();
        Date fechaUltima=planilla.getPlnFecha();
     
        return extradao.getHorasExtrasEmpleadoFecha(codigo, fechaUltima);
    }
    
    
    
}

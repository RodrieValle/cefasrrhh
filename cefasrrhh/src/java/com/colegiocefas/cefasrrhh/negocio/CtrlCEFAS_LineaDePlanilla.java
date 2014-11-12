/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_ConfiguracionRetenciones;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_LineaDePlanilla;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_LineaDePlanilla {
    
    
    
    public List<CEFAS_LineaDePlanilla> calculoPlanilla(){
        CEFAS_LineaDePlanilla linea= new CEFAS_LineaDePlanilla();
        List<CEFAS_LineaDePlanilla> listPlanilla= new ArrayList();
        CtrlCEFAS_ConfiguracionRetenciones ctrlConfiguracion=new CtrlCEFAS_ConfiguracionRetenciones();
        CtrlCEFAS_Empleado ctrlEmpleados=new CtrlCEFAS_Empleado();
        //carga configuracion
        List<CEFAS_ConfiguracionRetenciones> listConfiguraciones= new ArrayList();
        listConfiguraciones=ctrlConfiguracion.obtenerRetenciones();
        //lista de empleados
        List<CEFAS_Empleado> listEmpleados= new ArrayList();
        listEmpleados=ctrlEmpleados.obtenerEmpleados();  
        
        //inicio iteracion de empleados
        for(CEFAS_Empleado empleado: listEmpleados)
        {
            linea = new CEFAS_LineaDePlanilla();
            int codigo=Integer.parseInt(empleado.getEmpCodigo());
            linea.setEmpCodigo(codigo);
            
            float salario=empleado.getEmpSalario();
            linea.setLdpSueldoBase(salario);
            
            float horas=0;
            linea.setLdpHorasExtra(horas);
            
            float ausencias=0;
            linea.setLdpAusenciasTardias(ausencias);
            
            float devengado=salario+horas-ausencias;
            linea.setLdpSueldoDevengado(devengado);
            
            
            float isss=calculoISSS(devengado, listConfiguraciones.get(9));
            linea.setLdpIsss(isss);
            
            float afpConfia=0;
            float afpCrecer=0;
            if(empleado.getEmpTipoAfp()==1){
            afpConfia= calculoAFP(salario, listConfiguraciones.get(7));
               afpCrecer=0;   
                    }else{
                afpCrecer= calculoAFP(salario, listConfiguraciones.get(5));
               afpConfia=0; 
            }
            linea.setLdpAfpConfia(afpConfia);
            linea.setLdpAfpCrecer(afpCrecer);
            
            
            float sujeto=devengado-afpConfia-afpCrecer;
            linea.setLdpValorNetoSujetoRenta(sujeto);
            
            float renta=calculoRenta(sujeto, listConfiguraciones.get(0), 
                    listConfiguraciones.get(1), listConfiguraciones.get(2), 
                    listConfiguraciones.get(3),listConfiguraciones.get(4));
            linea.setLdpImpuestoSobreRenta(renta);
            
            
            float anticipo=0;
            linea.setLdpAnticipo(anticipo);
            
             float prestamo=0;
            linea.setLdpAbonoPrestamo(prestamo);
            
             float ordenDescuento=0;
            linea.setLdpOrdenDeDescuento(ordenDescuento);
            
             float viaticos=0;
            linea.setLdpMontoViatico(viaticos);
            
            float liquidoPagar=sujeto-isss-renta-anticipo-ordenDescuento-prestamo+viaticos;
            linea.setLdpLiquidoAPagar(liquidoPagar);
            listPlanilla.add(linea);
        }

    return listPlanilla;
    }
    

    
    

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<CALCULO IMPUESTO SOBRE LA RENTA
public float calculoRenta(float valor, CEFAS_ConfiguracionRetenciones rentaIConfig,
        CEFAS_ConfiguracionRetenciones rentaIIConfig,CEFAS_ConfiguracionRetenciones rentaIIIConfig,
        CEFAS_ConfiguracionRetenciones rentaIVConfig,CEFAS_ConfiguracionRetenciones rentaVConfig){
    float renta=0;
    float exceso=0;
    float fija=0;
    float sujeto=0;


if(valor >= rentaIConfig.getCfgMinimo() && valor <=rentaIConfig.getCfgMaximo()){
//no tiene renta
    return renta;

}

if(valor >= rentaIIConfig.getCfgMinimo() && valor <=rentaIIConfig.getCfgMaximo()){
exceso=rentaIIConfig.getCfgSobreExceso();
fija=rentaIIConfig.getCfgCuotaFija();
sujeto=valor-exceso;
renta=sujeto*rentaIIConfig.getCfgPorcentaje() +fija;
return renta;
}
else
if(valor >= rentaIIIConfig.getCfgMinimo() && valor <=rentaIIIConfig.getCfgMaximo()){
exceso=rentaIIIConfig.getCfgSobreExceso();
fija=rentaIIIConfig.getCfgCuotaFija();
sujeto=valor-exceso;
renta=sujeto*rentaIIIConfig.getCfgPorcentaje() +fija;
return renta;
}
else
if(valor >= rentaIVConfig.getCfgMinimo() && valor <=rentaIVConfig.getCfgMaximo()){
exceso=rentaIVConfig.getCfgSobreExceso();
fija=rentaIVConfig.getCfgCuotaFija();
sujeto=valor-exceso;
renta=sujeto*rentaIVConfig.getCfgPorcentaje() +fija;
return renta;
}
else{
if(valor >= rentaVConfig.getCfgMinimo()){
exceso=rentaVConfig.getCfgSobreExceso();
fija=rentaVConfig.getCfgCuotaFija();
sujeto=valor-exceso;
renta=sujeto*rentaVConfig.getCfgPorcentaje() +fija;
return renta;
}}
    return renta;
}



public float horas(float valor, float horas){
    float salHoras=(valor/30)/8;
    float cantidad=horas*salHoras;
    return cantidad;
}


//<<<<<<<<<<<<<<<<<<<<CALCULO ISSS

public float calculoISSS(float valor, CEFAS_ConfiguracionRetenciones isssConfig){
    
    float isss=0;
    if(valor>isssConfig.getCfgMaximo()){
    isss=isssConfig.getCfgMaximo()*isssConfig.getCfgPorcentaje();
    }else{
    isss=valor*isssConfig.getCfgPorcentaje();}
    return isss;
}



//<<<<<<<<<<<<<<<CALCULO AFP
public float calculoAFP(float valor, CEFAS_ConfiguracionRetenciones afpConfig){
     float afp=0;
    if(valor>afpConfig.getCfgMaximo()){
    afp=afpConfig.getCfgMaximo()*afpConfig.getCfgPorcentaje();
    }else{
    afp=valor*afpConfig.getCfgPorcentaje();}
    return afp;
}

 
    
}

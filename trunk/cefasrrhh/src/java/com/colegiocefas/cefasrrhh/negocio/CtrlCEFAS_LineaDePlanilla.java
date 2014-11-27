/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EmpleadoDAO;
import com.colegiocefas.cefasrrhh.datos.CEFAS_LineaDePlanillaDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_ConfiguracionRetenciones;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_LineaDePlanilla;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_LineaDePlanilla {
    private CEFAS_LineaDePlanillaDAO daoLinea= new CEFAS_LineaDePlanillaDAO();
    
    //<<<<<<<<<<<<<<<planilla normal.....sin vacaciones y aguinaldo<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
       
      //prestamo
        CtrlCEFAS_Prestamo ctrlPrestamo=new CtrlCEFAS_Prestamo();
   //descuento
        CtrlCEFAS_OrdenDeDescuento ctrlDescuento=new CtrlCEFAS_OrdenDeDescuento();
   
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
            
            
          // float anticipo=0;
            float anticipo=calculoAnticipo(codigo);
            linea.setLdpAnticipo(anticipo);
            
            float prest=0;
             CEFAS_Prestamo prestamo=ctrlPrestamo.getPrestamoEmpleado(codigo);
            if(prestamo!=null){
                prest=prestamo.getPrmCuota();
             linea.setLdpAbonoPrestamo(prest);
            }
            else linea.setLdpAbonoPrestamo(0);
            
            float orden=0;
           CEFAS_OrdenDeDescuento ordenDescuento=ctrlDescuento.getOrdenDescuentoEmpleado(codigo);
           if(ordenDescuento!=null){
               orden=ordenDescuento.getOddCuota();
            linea.setLdpOrdenDeDescuento(orden);
           }
           else  linea.setLdpOrdenDeDescuento(0);
           // float viaticos=0;
             float viaticos=calculoViatico(codigo);
            linea.setLdpMontoViatico(viaticos);
            
            float liquidoPagar=sujeto-isss-renta-anticipo-orden-prest+viaticos;
            linea.setLdpLiquidoAPagar(liquidoPagar);
            
            linea.setLdpAguinaldo(0);
            linea.setLdpVacacion(0);
            
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
    exceso=rentaIConfig.getCfgSobreExceso();
fija=rentaIConfig.getCfgCuotaFija();
sujeto=valor-exceso;
renta=sujeto*rentaIConfig.getCfgPorcentaje() +fija;
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

 

//<<<<<<<<<<<<<<<<<<<CALCULO DE ANTICIPOS
public float calculoAnticipo(int codEmpleado){
    CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
    float suma=ctrlAnticipo.sumaAnticipos(codEmpleado);
    return suma;
}



//<<<<<<<<<<<<<<<<<<<CALCULO DE VIATICOS
public float calculoViatico(int codEmpleado){
    CtrlCEFAS_Viatico ctrlViatico = new CtrlCEFAS_Viatico();
    float suma=ctrlViatico.sumaViaticos(codEmpleado);
    return suma;
}




public float calculoAguinaldo(float valor, List<Integer> tiempoTrabajando){
    float aguinaldo=0;
  
int año=tiempoTrabajando.get(2);  //calcula tiempo trabajado
int mes=tiempoTrabajando.get(1);
int dia=tiempoTrabajando.get(0);

    //fin tiempo trabajado
    
    if(año>=1&&año<3){
        //si entre 1 año y 3  15
        aguinaldo=valor/30 *15;
        return aguinaldo;
    }else
      if(año>=3&&año<10){
        //si entre 3 año y 10  19
          aguinaldo=valor/30 *19;
          return aguinaldo;
    }else
        if(año>=10){
        //si tiene mas de 10 años   21
            aguinaldo=valor/30 *21;
     return aguinaldo;     
    }else
    
    return aguinaldo;
}


public float calculoVacacion(float valor){
    float vacacion;
    float salarioDiario=valor/30;
    float quincena=salarioDiario *15;
    float extra=(quincena*30)/100;
    vacacion=extra;
    return vacacion;
}


//<<<<<<<<<<<<<<<<<<<<CALCULO INDEMNIZACION
public float calculoIndemnizacion(int codigo){
    float indemnizacion=0;
    
    
    CtrlCEFAS_Empleado ctrlEmpleados=new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado=ctrlEmpleados.getEmpleadoPorID(codigo);
   // List<Integer> año=ctrlEmpleados.tiempoTrabajado(codigo);
    
    
    indemnizacion=empleado.getEmpSalario()*ctrlEmpleados.tiempoTrabajado(codigo).get(2);
    
    
    return indemnizacion;
}



//>>>>>>>>>>>>>>>>>>>>planilla de diciembre..........incluye vacacion y aguinaldo<<<<<<<<<<<<<<<<<<<<<<
   public List<CEFAS_LineaDePlanilla> calculoPlanillaAguinaldo(){
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
       
        //prestamo
        CtrlCEFAS_Prestamo ctrlPrestamo=new CtrlCEFAS_Prestamo();
   //descuento
        CtrlCEFAS_OrdenDeDescuento ctrlDescuento=new CtrlCEFAS_OrdenDeDescuento();
        
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
            
            
            //float vacacion=0;
            float vacacion=calculoVacacion(salario);
            linea.setLdpVacacion(vacacion);
            
            //CEFAS_EmpleadoDAO daoEmpleado=new CEFAS_EmpleadoDAO();
            //List<Integer> año=daoEmpleado.getTiempoTrabajado(codigo);
            
            
            List<Integer> año=ctrlEmpleados.tiempoTrabajado(codigo);
            float aguinaldo=calculoAguinaldo(salario, año);
            //float aguinaldo=0;
            linea.setLdpAguinaldo(aguinaldo);
            
            float aguinaldoSujeto=0;
            if(aguinaldo>=listConfiguraciones.get(11).getCfgMinimo())
            {
            aguinaldoSujeto=aguinaldo-listConfiguraciones.get(11).getCfgMinimo();
            }
            
            float sujeto=devengado-afpConfia-afpCrecer+aguinaldoSujeto+vacacion;
            linea.setLdpValorNetoSujetoRenta(sujeto);
            
            float renta=calculoRenta(sujeto, listConfiguraciones.get(0), 
                    listConfiguraciones.get(1), listConfiguraciones.get(2), 
                    listConfiguraciones.get(3),listConfiguraciones.get(4));
            linea.setLdpImpuestoSobreRenta(renta);
            
            
           
            float anticipo=calculoAnticipo(codigo);
            linea.setLdpAnticipo(anticipo);
            
          float prest=0;
             CEFAS_Prestamo prestamo=ctrlPrestamo.getPrestamoEmpleado(codigo);
            if(prestamo!=null){
                prest=prestamo.getPrmCuota();
             linea.setLdpAbonoPrestamo(prest);
            }
            else linea.setLdpAbonoPrestamo(0);
            
            float orden=0;
           CEFAS_OrdenDeDescuento ordenDescuento=ctrlDescuento.getOrdenDescuentoEmpleado(codigo);
           if(ordenDescuento!=null){
               orden=ordenDescuento.getOddCuota();
            linea.setLdpOrdenDeDescuento(orden);
           }
           else  linea.setLdpOrdenDeDescuento(0);
          
            float viaticos=calculoViatico(codigo);
            linea.setLdpMontoViatico(viaticos);
            
            float liquidoPagar=sujeto-isss-renta-anticipo-orden-prest+viaticos;
            linea.setLdpLiquidoAPagar(liquidoPagar);
            listPlanilla.add(linea);
        }

    return listPlanilla;
    }
    

public int almacenarLineas(CEFAS_LineaDePlanilla linea, int codigoPln){
    int resultado=0;
  
    resultado=daoLinea.almacenarLineasPlanilla(linea, codigoPln);
    
    return resultado;
}


    
}//fin clase

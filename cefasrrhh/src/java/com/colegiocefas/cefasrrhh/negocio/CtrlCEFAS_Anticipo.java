/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_AnticipoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 *
 * @author 
 */
public class CtrlCEFAS_Anticipo {
    
    private CEFAS_AnticipoDAO daoAnticipo = new CEFAS_AnticipoDAO();
    

    public float sumaAnticipos(int codigo){
        float suma=0;
        List<CEFAS_Anticipo> listAnticipos= new ArrayList();
        listAnticipos=getAnticiposEmpleadoFecha(codigo);
        
         for(CEFAS_Anticipo anticipo: listAnticipos)
        {
            suma=suma+anticipo.getAtpCantidad();
        }
        return suma;
    }
    
    
    
    //  LLAMADA A METODO DE RETORNO DE ANTICIPOS A UNA FECHA DADA
    public List<CEFAS_Anticipo> getAnticiposEmpleadoFecha(int codigo)
    {
        CtrlCEFAS_Planilla ctrlPlanilla= new CtrlCEFAS_Planilla();
        CEFAS_Planilla planilla=ctrlPlanilla.getUltimaPlanilla();
        Date fechaUltima=planilla.getPlnFecha();
     
        return daoAnticipo.getAnticiposEmpleadoFecha(codigo, fechaUltima);
    }
    
    
         public int eliminarAnticipo(int codigo)
    {
        return daoAnticipo.eliminarAnticipo(codigo);
    }
    
    
       public CEFAS_Anticipo getAnticipo(int codigo)
    {
        return daoAnticipo.getAnticipo(codigo);
    }
    
    
    //   LLAMADA A METODO DONDE RECUPERA TODOS LOS ANTICIPOS HISTORICOS DE UN EMPLEADO 
      public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo)
    {
        return daoAnticipo.getAnticiposEmpleado(codigo);
    }
      
       public int actualizarAnticipo(int atpCodigo, int empCodigo, Date atpFecha, float atpCantidad)
    {
        CEFAS_Anticipo anticipo=new CEFAS_Anticipo();
        anticipo.setAtpCodigo(atpCodigo);
        anticipo.setEmpCodigo(empCodigo);
        anticipo.setAtpFecha(atpFecha);
        anticipo.setAtpCantidad(atpCantidad);
        
        CtrlCEFAS_Empleado ctrlEmpleado=new CtrlCEFAS_Empleado();
        CEFAS_Empleado empleado=ctrlEmpleado.getEmpleadoPorID(empCodigo);
        float sumaAnticipos=sumaAnticipos(empCodigo)-getAnticipo(atpCodigo).getAtpCantidad()+atpCantidad;
        float sueldo=empleado.getEmpSalario();
        
        if(sumaAnticipos>(sueldo/2)){
        return 0;
        }else
        return daoAnticipo.actualizarAnticipo(anticipo);
    }
    
    public int guardarAnticipo(int codigo, Date fecha, float cantidad)
    {
         CEFAS_Anticipo anticipo = new CEFAS_Anticipo();
        anticipo.setEmpCodigo(codigo);
        anticipo.setAtpFecha(fecha);
        anticipo.setAtpCantidad(cantidad);

        CtrlCEFAS_Empleado ctrlEmpleado=new CtrlCEFAS_Empleado();
        CEFAS_Empleado empleado=ctrlEmpleado.getEmpleadoPorID(codigo);
        float sumaAnticipos=sumaAnticipos(codigo)+cantidad;
        float sueldo=empleado.getEmpSalario();
        
        if(sumaAnticipos>(sueldo/2)){
        return 0;
        }else
        return daoAnticipo.almacenarAnticipo(anticipo);
    }
    

    
}

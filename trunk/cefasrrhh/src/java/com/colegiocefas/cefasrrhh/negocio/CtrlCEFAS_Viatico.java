/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_ViaticoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Viatico;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Viatico {
    
    
     private CEFAS_ViaticoDAO daoViatico = new CEFAS_ViaticoDAO();
    
   /*   LLAMADA A METODO DE RETORNO DE ANTICIPOS A UNA FECHA DADA
    public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo, String fecha)
    {
        return daoViatico.getAnticiposEmpleado(codigo, fecha);
    }*/
    
     
     
      public float sumaViaticos(int codigo){
        float suma=0;
        List<CEFAS_Viatico> listViaticos= new ArrayList();
        listViaticos=getViaticosEmpleadoFecha(codigo);
        
         for(CEFAS_Viatico viatico: listViaticos)
        {
            suma=suma+viatico.getViaCantidad();
        }
        return suma;
    }
    
    
    
    //  LLAMADA A METODO DE RETORNO DE ANTICIPOS A UNA FECHA DADA
    public List<CEFAS_Viatico> getViaticosEmpleadoFecha(int codigo)
    {
        CtrlCEFAS_Planilla ctrlPlanilla= new CtrlCEFAS_Planilla();
        CEFAS_Planilla planilla=ctrlPlanilla.getUltimaPlanilla();
        Date fechaUltima=planilla.getPlnFecha();
     
        return daoViatico.getViaticosEmpleadoFecha(codigo, fechaUltima);
    }
    
     
     
    //   LLAMADA A METODO DONDE RECUPERA TODOS LOS ANTICIPOS HISTORICOS DE UN EMPLEADO 
      public List<CEFAS_Viatico> getViaticosEmpleado(int codigo)
    {
        return daoViatico.getViaticosEmpleado(codigo);
    }
    
      
    public void guardarViatico(CEFAS_Viatico viatico)
    {
        daoViatico.almacenarViatico(viatico);
    }
    
   
    
}

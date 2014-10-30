/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_ViaticoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Viatico;
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

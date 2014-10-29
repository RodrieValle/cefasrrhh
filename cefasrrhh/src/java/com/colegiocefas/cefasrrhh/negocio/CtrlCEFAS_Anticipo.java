/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_AnticipoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo;
import java.util.List;

/**
 *
 * @author 
 */
public class CtrlCEFAS_Anticipo {
    
    private CEFAS_AnticipoDAO daoAnticipo = new CEFAS_AnticipoDAO();
    
   /*   LLAMADA A METODO DE RETORNO DE ANTICIPOS A UNA FECHA DADA
    public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo, String fecha)
    {
        return daoAnticipo.getAnticiposEmpleado(codigo, fecha);
    }*/
    
    //   LLAMADA A METODO DONDE RECUPERA TODOS LOS ANTICIPOS HISTORICOS DE UN EMPLEADO 
      public List<CEFAS_Anticipo> getAnticiposEmpleado(int codigo)
    {
        return daoAnticipo.getAnticiposEmpleado(codigo);
    }
    
    public void guardarAnticipo(CEFAS_Anticipo anticipo)
    {
        daoAnticipo.almacenarAnticipo(anticipo);
    }
    
    public void guardarAnticipoQuincena()
    {
        daoAnticipo.almacenarAnticipoQuincena();
    }
    
}

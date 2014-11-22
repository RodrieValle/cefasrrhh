/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

/**
 *
 * @author Portillo
 */
import com.colegiocefas.cefasrrhh.datos.CEFAS_SancionDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion;
import java.util.Date;
import java.util.List;

public class CtrlCEFAS_Sancion {
    private CEFAS_SancionDAO daoSancion = new CEFAS_SancionDAO();
    
    public void guardarSancion(int empCodigo,int scnCodigo,Date scnFecha,String scnMotivo,String scnSancion){
        CEFAS_Sancion scn= new CEFAS_Sancion();
         
                scn.setEmpCodigo(empCodigo);
                scn.setScnCodigo(scnCodigo);
                scn.setScnFecha(scnFecha);
                scn.setScnMotivo(scnMotivo);
                scn.setScnSancion(scnSancion);
               
        daoSancion.almacenarSancion(scn);
    }
        
   public List<CEFAS_Sancion> getSancion(int codigo)
    {
        return daoSancion.getSancion(codigo);
    }
   
}

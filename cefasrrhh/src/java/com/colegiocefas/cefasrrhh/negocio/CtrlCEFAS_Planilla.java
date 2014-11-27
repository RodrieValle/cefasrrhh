/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_PlanillaDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla;
import java.util.Date;

/**
 *
 * @author MARIA JUAREZ
 */
public class CtrlCEFAS_Planilla {
    private CEFAS_PlanillaDAO daoPlanilla = new CEFAS_PlanillaDAO();
    
    
     public CEFAS_Planilla getUltimaPlanilla()
    {
      return daoPlanilla.getUltimaPlanilla();
    }
    
     public void guardarPlanilla( int tipo){
         CEFAS_Planilla planilla= new CEFAS_Planilla();
         planilla.setPlnTipo(tipo);
         planilla.setPlnFecha(new Date());
         daoPlanilla.almacenarPlanilla(planilla);
     }
     
    
}

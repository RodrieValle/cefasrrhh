/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_AvisoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Aviso;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Aviso {
    
    private CEFAS_AvisoDAO daoAviso = new CEFAS_AvisoDAO();
    
    public List<CEFAS_Aviso> consultarAvisos(int usuario){
        return daoAviso.consultarAvisos(usuario);
    }
    
    public List<CEFAS_Aviso> consultarAvisos(){
        return daoAviso.consultarAvisos();
    }
    
    public void eliminarAvisoById(String id)
    {
        daoAviso.eliminarById(id);
    }
    
    public void guardar(Date fecha, String descripcion, List<CEFAS_Empleado> destinatarios, String remitente)
    {
        CEFAS_Aviso aviso = new CEFAS_Aviso(fecha, descripcion, remitente);
        daoAviso.guardar(aviso, destinatarios);
    }
    
    public CEFAS_Aviso obtenerAvisoById(String id)
    {
        return daoAviso.obtenerAvisoById(id);
    }
    
}

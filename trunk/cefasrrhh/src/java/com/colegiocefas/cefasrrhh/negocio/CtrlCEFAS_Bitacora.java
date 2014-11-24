/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_BitacoraDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Actividad;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Bitacora;
import java.util.Date;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Bitacora {
    
    CEFAS_BitacoraDAO daoBitacora= new CEFAS_BitacoraDAO();
    
    public void guardarBitacora(int codigoUsuario,  String descripcion){
        Date fecha=new Date();
        CEFAS_Bitacora bitacora= new CEFAS_Bitacora();
        bitacora.setUserCodigo(codigoUsuario);
        bitacora.setBtcFechaHora(fecha);
        bitacora.setBtcDescripcion(descripcion);
        daoBitacora.guardarAccion(bitacora);
    }
    
}

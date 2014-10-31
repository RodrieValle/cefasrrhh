/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_OrdenDeDescuentoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento;
import java.util.Date;

/**
 *
 * @author 
 */
public class CtrlCEFAS_OrdenDeDescuento {
    
    private CEFAS_OrdenDeDescuentoDAO daoOrden = new CEFAS_OrdenDeDescuentoDAO();
    
    
        public void guardarOrdenDeDescuento(int empCodigo, Date oddFecha, float oddMonto, int oddPlazos, float oddCuota)
    {
        CEFAS_OrdenDeDescuento orden= new CEFAS_OrdenDeDescuento();
         
                
               orden.setEmpCodigo(empCodigo);
                orden.setOddFecha(oddFecha);
                orden.setOddMonto(oddMonto);
                orden.setOddPlazo(oddPlazos);
                orden.setOddSaldo(oddMonto);
                orden.setOddCuota(oddCuota);
                
                daoOrden.almacenarOrdenDeDescuento(orden);
    }
    
}

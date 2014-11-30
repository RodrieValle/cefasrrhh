/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_OrdenDeDescuentoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento;
import java.util.Date;
import java.util.List;

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
    
        
         public List<CEFAS_OrdenDeDescuento> getOrdenesDeDescuento()
    {
        return daoOrden.getOrdenDeDescuentos();
    }
         
         
            public CEFAS_OrdenDeDescuento getOrdenDescuentoEmpleado(int codigo)
    {
        return daoOrden.obtenerDescuentoEmpleado(codigo);
    }
            
            
public int actualizarOrden(int codigo, int empleado, Date fecha, float cuota, float cantidad,
                                            int plazo, float saldo)
    {
        CEFAS_OrdenDeDescuento orden= new CEFAS_OrdenDeDescuento();
        orden.setOddCodigo(codigo);
        orden.setEmpCodigo(empleado);
        orden.setOddCuota(cuota);
        orden.setOddFecha(fecha);
        orden.setOddMonto(cantidad);
        orden.setOddPlazo(plazo);
        orden.setOddSaldo(saldo);
        return daoOrden.actualizarOrdenDeDescuento(orden);
    }
    
   public int eliminarOrden(int codigo)
    {
        return daoOrden.eliminarOrdenDeDescuento(codigo);
    }
    
         public CEFAS_OrdenDeDescuento getOrden(int codigo){
        return daoOrden.getOrdenDescuento(codigo);
    }
     
}

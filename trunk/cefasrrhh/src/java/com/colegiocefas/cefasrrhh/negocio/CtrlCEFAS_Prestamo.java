/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_PrestamoDAO;

import com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo;
import java.util.Date;
import java.util.List;
/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Prestamo {
    
    private CEFAS_PrestamoDAO daoPrestamo = new CEFAS_PrestamoDAO();
    
    
        public void guardarPrestamo(int empCodigo, Date prmFecha, float prmMonto, int prmPlazos, float prmCuota)
    {
        CEFAS_Prestamo prestamo= new CEFAS_Prestamo();
         
                
               prestamo.setEmpCodigo(empCodigo);
                prestamo.setPrmFecha(prmFecha);
                prestamo.setPrmMonto(prmMonto);
                prestamo.setPrmPlazo(prmPlazos);
                prestamo.setPrmSaldo(prmMonto);
                prestamo.setPrmCuota(prmCuota);
                
                daoPrestamo.almacenarPrestamos(prestamo);
    }
    
        
              public List<CEFAS_Prestamo> getPrestamos()
    {
        return daoPrestamo.getPrestamos();
    }
    
     public CEFAS_Prestamo getPrestamoEmpleado(int codigo)
    {
        return daoPrestamo.obtenerPrestamoEmpleado(codigo);
    }
     
     
              public int actualizarPrestamo(int codigo, int empleado, Date fecha, float cuota, float cantidad,
                                            int plazo, float saldo)
    {
        CEFAS_Prestamo prestamo= new CEFAS_Prestamo();
        prestamo.setPrmCodigo(codigo);
        prestamo.setEmpCodigo(empleado);
        prestamo.setPrmCuota(cuota);
        prestamo.setPrmFecha(fecha);
        prestamo.setPrmMonto(cantidad);
        prestamo.setPrmPlazo(plazo);
        prestamo.setPrmSaldo(saldo);
        return daoPrestamo.actualizarPrestamo(prestamo);
    }
    
   public int eliminarPrestamo(int codigo)
    {
        return daoPrestamo.eliminarPrestamo(codigo);
    }
    
         public CEFAS_Prestamo getPrestamo(int codigo){
        return daoPrestamo.getPrestamo(codigo);
    }
     
   public void actualizarSaldo(){
       daoPrestamo.actualizarSaldo();
    }
}

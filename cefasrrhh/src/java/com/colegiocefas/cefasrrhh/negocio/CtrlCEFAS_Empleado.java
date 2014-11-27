/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EmpleadoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Empleado {
    private CEFAS_EmpleadoDAO daoEmpleado = new CEFAS_EmpleadoDAO();
    
    public CEFAS_Empleado getEmpleadoPorUsuario(int codigo)
    {
        return daoEmpleado.getEmpleadoPorUsuario(codigo);
    }
    
      public CEFAS_Empleado getEmpleadoPorID(int codigo)
    {
        return daoEmpleado.getEmpleadoPorID(codigo);
    }
    
    public void guardarEmpleado(CEFAS_Empleado empleado)
    {
        daoEmpleado.guardarEmpleado(empleado);
    }
    
    public void guardarEmpleadoCompleto(CEFAS_Empleado empleado)
    {
        daoEmpleado.guardarEmpleadoCompleto(empleado);
    }
    
    public List<CEFAS_Empleado> obtenerEmpleados()
    {
        return daoEmpleado.obtenerEmpleados();
    }
    
    public List<CEFAS_Empleado> obtenerEmpleados(int criterio, String dato)
    {
        return daoEmpleado.obtenerEmpleados(criterio, dato);
    }
    
    public List<Integer> tiempoTrabajado(int codigoEmpleado){
       //List<Integer> tiempoTrabajado = new ArrayList<Integer>();
        return daoEmpleado.getTiempoTrabajado(codigoEmpleado);
    }
    
    public boolean registrar(String nombre, Date fechaContratacion, String plaza, int jefeInmediato, float salario, String tipoContrato)
    {
        CEFAS_Empleado empleado = new CEFAS_Empleado();
        empleado.setEmpNombre(nombre);
        empleado.setEmpAnioContratacion(fechaContratacion);
        empleado.setEmpPlazaActual(plaza);
        empleado.setEmpJefeInmediato(jefeInmediato);
        empleado.setEmpSalario(salario);
        empleado.setEmpTipoDeContrato(tipoContrato);
        return daoEmpleado.registrar(empleado);
    }
}

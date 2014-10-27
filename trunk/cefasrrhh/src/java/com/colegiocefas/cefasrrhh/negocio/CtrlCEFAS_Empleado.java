/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_EmpleadoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado;
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
    
    public void guardarEmpleado(CEFAS_Empleado empleado)
    {
        daoEmpleado.guardarEmpleado(empleado);
    }
    
    public List<CEFAS_Empleado> obtenerEmpleados()
    {
        return daoEmpleado.obtenerEmpleados();
    }
}

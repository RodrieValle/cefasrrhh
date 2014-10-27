/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_TituloDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo;
import java.util.List;

/**
 *
 * @author Rodrigo
 */
public class CtrlCEFAS_Titulo {
    
    private CEFAS_TituloDAO daoTitulo = new CEFAS_TituloDAO();
    
    public List<CEFAS_Titulo> getTitulos(int codigoEmpleado)
    {
        return daoTitulo.getTitulos(codigoEmpleado);
    }
    
    public void actualizarTitulos(List<CEFAS_Titulo> titulos)
    {
        daoTitulo.actualizarTitulos(titulos);
    }
}

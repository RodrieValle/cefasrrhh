/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_CandidatoDAO;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Candidato {
    
    CEFAS_CandidatoDAO daoCandidato = new CEFAS_CandidatoDAO();
    
    public void guardarCurriculum(String dui, String nombre, String especialidad)
    {
        daoCandidato.guardarCurriculum(dui, nombre,especialidad);
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.negocio;

import com.colegiocefas.cefasrrhh.datos.CEFAS_CandidatoDAO;
import com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato;

/**
 *
 * @author Portillo
 */
public class CtrlCEFAS_Candidato {

    CEFAS_CandidatoDAO daoCandidato = new CEFAS_CandidatoDAO();

    public void guardarCurriculum(String cdtDUI,String cdtNombre, String cdtEspecialidad,String cdtCurriculum) {
        CEFAS_Candidato candidato = new CEFAS_Candidato();
        candidato.setCdtDUI(cdtDUI);
        candidato.setCdtNombre(cdtNombre);
        candidato.setCdtEspecialidad(cdtEspecialidad);
        candidato.setCdtCurriculum(cdtCurriculum);

        daoCandidato.ingresarCurriculum(candidato);
    }
}

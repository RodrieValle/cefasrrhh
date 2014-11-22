/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Portillo
 */
public class CEFAS_Empleado {
   
private String empCodigo;
private String usrCodigo;
private String empNombre;
private Date   empFechaNacimiento;
private String empDireccion;
private int empJefeInmediato;
private Date empAnioContratacion;
private String empPlazaActual;
private String empPlazaAnterior;
private float  empSalario;
private String empTipoDeContrato;
private String empNUP;
private String empDUI;
private String empNIT; 
private String empNIP;
private String empTelefono;
private String empCelular;
private String empCorreo;
private String empFoto;
private int empTipoAfp;

    public CEFAS_Empleado()
    {
        
    }

    public CEFAS_Empleado(String empCodigo, String usrCodigo, String empNombre, Date empFechaNacimiento, String empDireccion, Date empAnioContratacion, String empPlazaActual, String empPlazaAnterior, float empSalario, String empTipoDeContrato, String empNUP, String empDUI, String empNIT, String empNIP, String empTelefono, String empCelular, String empCorreo, String empFoto) {
        this.empCodigo = empCodigo;
        this.usrCodigo = usrCodigo;
        this.empNombre = empNombre;
        this.empFechaNacimiento = empFechaNacimiento;
        this.empDireccion = empDireccion;
        this.empAnioContratacion = empAnioContratacion;
        this.empPlazaActual = empPlazaActual;
        this.empPlazaAnterior = empPlazaAnterior;
        this.empSalario = empSalario;
        this.empTipoDeContrato = empTipoDeContrato;
        this.empNUP = empNUP;
        this.empDUI = empDUI;
        this.empNIT = empNIT;
        this.empNIP = empNIP;
        this.empTelefono = empTelefono;
        this.empCelular = empCelular;
        this.empCorreo = empCorreo;
        this.empFoto = empFoto;
    }



    public String getEmpCodigo() {
        return empCodigo;
    }

    public void setEmpCodigo(String empCodigo) {
        this.empCodigo = empCodigo;
    }

    public String getUsrCodigo() {
        return usrCodigo;
    }

    public void setUsrCodigo(String usrCodigo) {
        this.usrCodigo = usrCodigo;
    }

    public String getEmpNombre() {
        return empNombre;
    }

    public void setEmpNombre(String empNombre) {
        this.empNombre = empNombre;
    }

    public Date getEmpFechaNacimiento() {
        return empFechaNacimiento;
    }

    public void setEmpFechaNacimiento(Date empFechaNacimiento) {
        this.empFechaNacimiento = empFechaNacimiento;
    }

    public String getEmpDireccion() {
        return empDireccion;
    }

    public void setEmpDireccion(String empDireccion) {
        this.empDireccion = empDireccion;
    }

    public Date getEmpAnioContratacion() {
        return empAnioContratacion;
    }

    public void setEmpAnioContratacion(Date empAnioContratacion) {
        this.empAnioContratacion = empAnioContratacion;
    }

    public String getEmpPlazaActual() {
        return empPlazaActual;
    }

    public void setEmpPlazaActual(String empPlazaActual) {
        this.empPlazaActual = empPlazaActual;
    }

    public String getEmpPlazaAnterior() {
        return empPlazaAnterior;
    }

    public void setEmpPlazaAnterior(String empPlazaAnterior) {
        this.empPlazaAnterior = empPlazaAnterior;
    }

    public float getEmpSalario() {
        return empSalario;
    }

    public void setEmpSalario(float empSalario) {
        this.empSalario = empSalario;
    }

    public String getEmpTipoDeContrato() {
        return empTipoDeContrato;
    }

    public void setEmpTipoDeContrato(String empTipoDeContrato) {
        this.empTipoDeContrato = empTipoDeContrato;
    }

    public String getEmpNUP() {
        return empNUP;
    }

    public void setEmpNUP(String empNUP) {
        this.empNUP = empNUP;
    }

    public String getEmpDUI() {
        return empDUI;
    }

    public void setEmpDUI(String empDUI) {
        this.empDUI = empDUI;
    }

    public String getEmpNIT() {
        return empNIT;
    }

    public void setEmpNIT(String empNIT) {
        this.empNIT = empNIT;
    }

    public String getEmpNIP() {
        return empNIP;
    }

    public void setEmpNIP(String empNIP) {
        this.empNIP = empNIP;
    }

    public String getEmpTelefono() {
        return empTelefono;
    }

    public void setEmpTelefono(String empTelefono) {
        this.empTelefono = empTelefono;
    }

    public String getEmpCelular() {
        return empCelular;
    }

    public void setEmpCelular(String empCelular) {
        this.empCelular = empCelular;
    }

    public String getEmpCorreo() {
        return empCorreo;
    }

    public void setEmpCorreo(String empCorreo) {
        this.empCorreo = empCorreo;
    }

    public String getEmpFoto() {
        return empFoto;
    }

    public void setEmpFoto(String empFoto) {
        this.empFoto = empFoto;
    }

    public int getEmpJefeInmediato() {
        return empJefeInmediato;
    }

    public void setEmpJefeInmediato(int empJefeInmediato) {
        this.empJefeInmediato = empJefeInmediato;
    }

    public int getEmpTipoAfp() {
        return empTipoAfp;
    }

    public void setEmpTipoAfp(int empTipoAfp) {
        this.empTipoAfp = empTipoAfp;
    }
    
    
    
    public int añosTrabajados(){
        List<Integer> tiempoTrabajado = new ArrayList<Integer>();
        Calendar fechaActual = Calendar.getInstance();
            Calendar fechaContrato = Calendar.getInstance();
            fechaContrato.setTime(empAnioContratacion);
            int año = fechaActual.get(Calendar.YEAR) - fechaContrato.get(Calendar.YEAR);
            int mes = fechaActual.get(Calendar.MONTH) - fechaContrato.get(Calendar.MONTH);
            int dia = fechaActual.get(Calendar.DATE) - fechaContrato.get(Calendar.DATE);
            //Se ajusta el año dependiendo el mes y el día
            if (mes < 0 || (mes == 0 && dia < 0)) {
                año--;
            }
            if(mes == 0 && dia < 0)
            {
                mes = 11;
                dia = 30 + dia;
            }
            if(mes < 0)
            {
                mes = 12 + mes;
            }
            if(dia < 0)
            {
                dia = 30 + dia;
            }
            tiempoTrabajado.add(dia);
            tiempoTrabajado.add(mes);
            tiempoTrabajado.add(año);
            
            return año;
    }
    
}

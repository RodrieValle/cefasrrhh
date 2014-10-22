/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.colegiocefas.cefasrrhh.dominio;

import java.util.Date;

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
private String empAnioContratacion;
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

    

    public CEFAS_Empleado(String empCodigo, String usrCodigo, String empNombre, Date empFechaNacimiento, String empDireccion, String empAnioContratacion, String empPlazaActual, String empPlazaAnterior, float empSalario, String empTipoDeContrato, String empNUP, String empDUI, String empNIT, String empNIP, String empTelefono, String empCelular, String empCorreo, String empFoto) {
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

    public String getEmpAnioContratacion() {
        return empAnioContratacion;
    }

    public void setEmpAnioContratacion(String empAnioContratacion) {
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


    
}

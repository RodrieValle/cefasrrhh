<%-- 
    Document   : prestamoNuevo
    Created on : 31-oct-2014, 9:43:38
    Author     : MARIA JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Titulo"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Titulo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>

<% 
  
//Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
    }
 

    int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);
    
    response.setContentType("text/html;charset=UTF-8");
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Prestamo Institucional</title>
         <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        
        
         <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
                
                <h2 class="form-signin-heading">Nuevo Prestamo</h2>
                 <form class="form-signin" role="form" method="post" action="prestamo.jsp">
                <div class="panel panel-primary">
                        <div class="panel-heading">Ingrese Datos del Prestamo</div>
                        <div class="panel-body">
                <div class="row">
                   
                      <div class="col-xs-4">
                                    <img src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="150" height="150"/>
                                </div>
                    
                           
                     <div class="col-xs-4">  
                                  
                         Codigo Empleado:<input  type="text" name="empcodigo" value="<%= empleado.getEmpCodigo() %>" class="form-control input-sm"  required />
                         
                                  
                        
                         Fecha: <input id="fecha" type="text" name="fecha"  class="form-control input-sm" placeholder="Formato: dd/MM/yyyy"required />
                         
                        Cuota Mensual: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="text" name="cuotaMensual"  class="form-control input-sm" required><br>
                                    </div><br>
                           </div>
                    <div class="col-xs-4">  
                        Nombre:<input  type="text" name="nombre" value="<%= empleado.getEmpNombre() %>" class="form-control input-sm"  required />
                       
                         Numero de cuotas:<input  type="text" name="numeroCuotas"  class="form-control input-sm"  required /> 
                        Monto: <br>
                                    <div class="input-group">
                                        <span class="input-group-addon input-sm">$</span>
                                        <input type="text" name="monto"  class="form-control input-sm" required><br>
                                    </div><br>
                       
                    </div>
                </div>
               </div>
             </div>
 <input type="submit" value="Guardar" class="btn btn-success center-block"/><br>
 </form>

  </div><%-- fin class=container --%>
  </div><%-- fin id=container --%>
        
    </body>
</html>
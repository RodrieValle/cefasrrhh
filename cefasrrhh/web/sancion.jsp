<%-- 
    Document   : sancion
    Created on : 30/10/2014, 10:32:35 AM
    Author     : Sergio
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Sancion"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%
//Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    if (request.getParameter("empcodigo") != null) {
        String empcodigo = request.getParameter("empcodigo");
        String scncodigo = request.getParameter("scncodigo");
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        String scn = request.getParameter("sancion");
        String motivo = request.getParameter("motivo");
        CtrlCEFAS_Sancion ctrlsancion = new CtrlCEFAS_Sancion();
        ctrlsancion.guardarSancion(empcodigo, scncodigo, fecha, scn, motivo);
    }

    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados;
    listaEmpleados = ctrlEmpleado.obtenerEmpleados();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicar Sancion-CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
          
            <jsp:include page='inc/menu_directora.jsp' />
           
            <div class="container">
                <h1 class="form-signin-heading">Ingresar Sancion</h1>
                 <form class="form-signin" action="sancion.jsp" method="post">   
               <div class="panel panel-primary">
                        <div class="panel-heading">Ingrese Datos de la Nueva Sancion</div>
                        <div class="panel-body">
                
                <div class="row">
                    <div class="col-xs-6">
                       
                       
                       Codigo de Sancion: <input type="text" name="scncodigo" value="" class="form-control input-sm" required/><br>
                       Fecha: <input type="text" name="fecha" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /><br>
                    Empleado:<select name="empcodigo" id="empleado" class="form-control input-sm">
                           <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                           <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                            <% }%>
                       </select>  
                    </div>
                       <div class="col-xs-6">
                       Sancion:<textarea name="sancion" rows="4" cols="40" class="form-control input-sm" required></textarea>
                       Motivo:<textarea name="motivo" rows="4" cols="40" class="form-control input-sm" required></textarea>
                       
                    </div>
                </div>
                       </div>
                       </div>
                     <br>
                       <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                </form>

            </div>
        </div>
        
    </body>
</html>

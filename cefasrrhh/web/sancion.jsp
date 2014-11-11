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
if (!tipo.equals("subdirector") && !tipo.equals("administradora")) {
        response.sendRedirect("avisos.jsp");
    }
String empcodigo = request.getParameter("empcodigo");
String scncodigo =request.getParameter("scncodigo");
Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
String scn = request.getParameter("sancion");
String motivo = request.getParameter("motivo");

CEFAS_Sancion sancion = new CEFAS_Sancion();

sancion.setEmpCodigo(empcodigo);
sancion.setScnCodigo(scncodigo);
sancion.setScnFecha(fecha);
sancion.setScnSancion(scn);
sancion.setScnMotivo(motivo);

CtrlCEFAS_Sancion ctrlsancion = new CtrlCEFAS_Sancion();
ctrlsancion.guardarSancion(sancion);

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
            <%  if (tipo.equals("subdirector")) {
            %>
            <jsp:include page='inc/menu_subdirector.jsp' />
            <% } else if (tipo.equals("administradora")) {
            %>
            <jsp:include page='inc/menu_administradora.jsp' />
            <% }
            %>
            <div class="container">
                <h1>Ingresar Sancion</h1>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <form action="sancion.jsp" method="post">   
                       Empleado:<select name="empcodigo" id="empleado" class="form-control input-sm">
                           <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                           <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                            <% }%>
                       </select>
                       Codigo de Sancion: <input type="text" name="scncodigo" value="" class="form-control input-sm"/><br>
                       Fecha: <input type="text" name="fecha" value="" class="form-control input-sm" placeholder= "Formato: dd/MM/yyyy" required /><br>
                       Sancion:<input type="text" name="sancion" style ="width:200px;height:150px" class="form-control input-sm"/>
                       Motivo:<input type="text" name="motivo" style ="width:200px;height:150px" class="form-control input-sm"/>
                       <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>

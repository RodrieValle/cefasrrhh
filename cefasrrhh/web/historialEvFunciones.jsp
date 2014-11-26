<%-- 
    Document   : historialEvClase
    Created on : 11-25-2014, 08:06:31 PM
    Author     : Rodrigo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_EvaluacionPorFunciones"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionPorFunciones"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    int codEmpleado = Integer.parseInt(sesionOk.getAttribute("empleado").toString());
    CtrlCEFAS_EvaluacionPorFunciones ctrlEvFunc = new CtrlCEFAS_EvaluacionPorFunciones();
    List<CEFAS_EvaluacionPorFunciones> evsFunciones = ctrlEvFunc.obtenerEvaluacionPorFuncionesById(codEmpleado);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Evaluaciones por Funciones</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <%  if (tipo.equals("director")) {
            %>
            <jsp:include page='inc/menu_directora.jsp' />
            <% } else if (tipo.equals("empleado")) {
            %>
            <jsp:include page='inc/menu_empleado.jsp' />
            <% } else if (tipo.equals("subdirector")) {
            %>
            <jsp:include page='inc/menu_subdirector.jsp' />
            <% } else if (tipo.equals("asistente")) {
            %>
            <jsp:include page='inc/menu_asistente.jsp' />
            <% } else if (tipo.equals("administrador")) {
            %>
            <jsp:include page='inc/menu_administradora.jsp' />
            <% }%>
            <div class="container">
                <h1>Historial de Evaluaciones por Funciones</h1>
                <div class="col-xs-6 col-xs-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Cantidad de evaluaciones: <%= evsFunciones.size()%></div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Archivo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (CEFAS_EvaluacionPorFunciones ev : evsFunciones) {
                                    %>   
                                    <tr>
                                        <td><%= new SimpleDateFormat("dd/MM/yyyy").format(ev.getEfuFecha())%></td>
                                        <td><a target="_blank" href="<%= ev.getEfuRutaArchivo()%>">Ver archivo</a> </td>
                                    </tr>
                                    <%
                                          }%>  
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

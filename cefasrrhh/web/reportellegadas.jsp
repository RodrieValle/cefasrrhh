<%-- 
    Document   : reportellegadas
    Created on : 10-28-2014, 10:09:05 PM
    Author     : Rodrigo
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    //Accesible con usuario: emp03 y password: 12345
    if (!tipo.equals("subdirector") && !tipo.equals("administradora")) {
        response.sendRedirect("avisos.jsp");
    }
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados;
    listaEmpleados = ctrlEmpleado.obtenerEmpleados();
    /*if(request.getParameter("dato")!= null)
     {
     int criterio = Integer.parseInt(request.getParameter("criterio"));
     String dato = request.getParameter("dato");
     listaEmpleados = ctrlEmpleado.obtenerEmpleados(criterio, dato);
     }
     else
     {
     listaEmpleados = ctrlEmpleado.obtenerEmpleados();
     }*/
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte de llegadas</title>
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
                <h1>Ingreso de llegadas tarde</h1>
                <div class="row">
                    <div class="col-xs-4 col-xs-offset-4">
                        <form action="reportellegadas.jsp" method="post">
                        Empleado:
                        <select name="empleado" id="empleado" class="form-control input-sm">
                            <% for (CEFAS_Empleado emp : listaEmpleados) {%>
                            <option value="<%= emp.getEmpCodigo()%>"><%= emp.getEmpNombre()%></option>
                            <% }%>
                        </select>
                        Fecha:
                        <input type="text" name="fecha" value="" class="form-control input-sm"/>
                        Hora de entrada:
                        <input type="text" name="horaEntrada" value="" class="form-control input-sm"/>
                        Hora de llegada:
                        <input type="text" name="horaLlegada" value="" class="form-control input-sm"/>
                        <br>Minutos tarde:
                        ** minutos <br><br>
                        <input type="submit" value="Guardar" class="btn btn-success center-block"/>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>

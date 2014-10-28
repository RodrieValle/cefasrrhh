<%-- 
    Document   : gestionperfiles
    Created on : 10-26-2014, 10:59:04 PM
    Author     : Rodrigo
--%>

<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados = ctrlEmpleado.obtenerEmpleados();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de perfiles de empleado</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Gestion de perfiles de empleado</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">Zona de búsqueda</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-8 col-xs-offset-2">
                                Buscar empleado por cualquier criterio
                                <div class="input-group">
                                    <input type="text" class="form-control">
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="button">
                                            <span class="glyphicon glyphicon-search"></span> 
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel panel-primary">
                          <div class="panel-heading">Empleados: <%= listaEmpleados.size() %></div>
                        <div class="panel-body">
                            <table class="table table-striped table-hover">
                                    <tbody>
                                     <% for(CEFAS_Empleado empleado: listaEmpleados)
                                    {
                                    %>   
                                        <tr>
                                            <td><img src="<%= empleado.getEmpFoto() %>" class="center-block" alt="fotoempleado" width="150" height="100"/></td>
                                            <td><%= empleado.getEmpNombre() %></td>
                                            <td><a href="empleado.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Ver perfil</a></td>
                                            <td><a href="modificarempleado.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Modificar perfil</a></td>
                                        </tr>
                                      <%
                                    } %>  
                                    </tbody>
                                </table>
                        </div>
                      </div>
            </div>

        </div>
    </div>
</body>
</html>

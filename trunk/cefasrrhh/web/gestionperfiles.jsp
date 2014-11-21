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
    List<CEFAS_Empleado> listaEmpleados;
    if(request.getParameter("dato")!= null)
    {
        int criterio = Integer.parseInt(request.getParameter("criterio"));
        String dato = request.getParameter("dato");
        listaEmpleados = ctrlEmpleado.obtenerEmpleados(criterio, dato);
    }
    else
    {
        listaEmpleados = ctrlEmpleado.obtenerEmpleados();
    }
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
                <h1>Gestión de perfiles de empleado</h1>
                <div class="panel panel-primary">
                    <div class="panel-heading">Zona de búsqueda</div>
                    <div class="panel-body">
                        <div class="row">
                            <form action="gestionperfiles.jsp" method="post">
                            <div class="col-xs-4 col-xs-offset-1">
                                <select name="criterio" id="criterio" class="form-control input-sm">
                                    <option value="1">Código de empleado</option>
                                    <option value="2">Nombre</option>
                                    <option value="3">Fecha de nacimiento</option>
                                    <option value="4">Dirección</option>
                                    <option value="5">Año de contratación</option>
                                    <option value="6">Plaza actual</option>
                                    <option value="7">Plaza anterior</option>
                                    <option value="8">Jefe inmediato</option>
                                    <option value="9">Salario</option>
                                    <option value="10">Tipo de contrato</option>
                                    <option value="11">NUP</option>
                                    <option value="12">DUI</option>
                                    <option value="13">NIT</option>
                                    <option value="14">NIP</option>
                                    <option value="15">Teléfono</option>
                                    <option value="16">Celular</option>
                                    <option value="17">Correo</option>
                                    <option value="18">Título</option>
                                    <option value="19">Lugar de título</option>
                                    <option value="20">Fecha de título</option>
                                </select>
                            </div>
                            <div class="col-xs-4 col-xs-offset-2">
                                <div class="input-group">
                                    <input type="text" name="dato" class="form-control input-sm">
                                    <span class="input-group-btn">
                                        <button class="btn btn-sm btn-success" type="submit">
                                            <span class="glyphicon glyphicon-search"></span> 
                                        </button>
                                    </span>
                                </div>
                            </div>
                            </form>
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
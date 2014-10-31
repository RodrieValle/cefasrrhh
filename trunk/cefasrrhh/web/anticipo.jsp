<%-- 
    Document   : anticipo
    Created on : 25-oct-2014, 18:25:17
    Author     : MARIA JUAREZ
--%>


    
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>

<%

 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");

    }

 //Datos  
    if(request.getParameter("fecha") != null)
    { 
        
        int codigo = Integer.parseInt(request.getParameter("empcodigo"));
       //String nombre = request.getParameter("nombre");
        Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha").toString());
        float cantidad = Float.parseFloat(request.getParameter("cantidad"));
   
        CEFAS_Anticipo anticipo = new CEFAS_Anticipo();
        anticipo.setEmpCodigo(codigo);
        anticipo.setAtpFecha(fecha);
        anticipo.setAtpCantidad(cantidad);
           
        CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
        ctrlAnticipo.guardarAnticipo(anticipo);
}
    
        CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    List<CEFAS_Empleado> listaEmpleados = ctrlEmpleado.obtenerEmpleados();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso Anticipos</title>
         <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
       
        <div id="container">
            <jsp:include page='inc/menu_administradora.jsp' />
            <div class="container">
                <h1>Ingreso Anticipo a Empleados.</h1>
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
                </div><%-- fin del buscador --%>
                
                <%-- inicio lista de empleados --%>
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
                                            <td><a href="anticipoNuevo.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Generar Anticipo</a></td>
                                            <td><a href="anticipoEmpleado.jsp?codigo=<%= empleado.getEmpCodigo() %>" class="btn btn-primary btn-md" role="button">Ver Anticipos</a></td>
                                        </tr>
                                      <%
                                    } %>  
                                    </tbody>
                                </table>
                        </div>
                      </div>
            </div>

        </div>
  
    </body>
</html>

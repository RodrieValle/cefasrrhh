<%-- 
    Document   : viaticoEmpleado
    Created on : 28-oct-2014, 11:23:24
    Author     : MARIA JUAREZ
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Viatico"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Viatico"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");}

int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    CtrlCEFAS_Viatico ctrlViatico= new CtrlCEFAS_Viatico();
    List<CEFAS_Viatico> listaViatico=ctrlViatico.getViaticosEmpleado(codigoEmp);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viaticos de Empleado</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        
        
        <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de Viaticos del Empleado</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Viaticos del empleado: <%= empleado.getEmpNombre() %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                    <tr>
                                            <td>Codigo Viatico</td>
                                            <td>Fecha</td> 
                                            <td>Cantidad</td>
                                            <td>Descripcion</td>
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                        
                                          <%
                    for(CEFAS_Viatico viatico: listaViatico)
                    {
                %>  
                                        <tr>
                                            <td><%= viatico.getViaCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(viatico.getViaFecha())%></td>
                                            <td>$ <%= viatico.getViaCantidad()%></td>
                                            <td><%= viatico.getViaDescripcion()%></td>
                                            <td><a href="viaticoModificar.jsp?codigoViatico=<%= viatico.getViaCodigo() %>" class="btn btn-primary btn-md" role="button">Modificar Anticipo</a></td>
                                            <td><a href="viaticoEliminar.jsp?codigoViatico=<%= viatico.getViaCodigo() %>" class="btn btn-primary btn-md" role="button">Eliminar Anticipo</a></td>
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

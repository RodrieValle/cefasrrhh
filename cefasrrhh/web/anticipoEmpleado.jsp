<%-- 
    Document   : anticipoEmpleado
    Created on : 28-oct-2014, 11:17:46
    Author     : JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Anticipo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Anticipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    CtrlCEFAS_Anticipo ctrlAnticipo = new CtrlCEFAS_Anticipo();
    List<CEFAS_Anticipo> listaAnticipo = ctrlAnticipo.getAnticiposEmpleado(codigoEmp);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anticipos de Empleado: <%= empleado.getEmpNombre() %></title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de anticipos del empleado</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Anticipos del empleado: <%= empleado.getEmpNombre() %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Codigo Anticipo</td>
                                            <td>Fecha</td> 
                                            <td>Cantidad</td>
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_Anticipo anticipo: listaAnticipo)
                    {
                %>  
                                        <tr>
                                            <td><%= anticipo.getAtpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(anticipo.getAtpFecha())%></td>
                                            <td>$ <%= String.format("%.2f", anticipo.getAtpCantidad()) %></td>
                                            <td><a href="anticipoModificar.jsp?codigo=<%=anticipo.getAtpCodigo()%>" class="btn btn-primary btn-md" role="button">Modificar Anticipo</a></td>
                                            <td><a href="#" class="btn btn-primary btn-md" role="button">Eliminar Anticipo</a></td>
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

<%-- 
    Document   : sancionempleado
    Created on : 21/11/2014, 08:55:04 PM
    Author     : Sergio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Sancion"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Sancion"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mensaje="";
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    if(request.getParameter("codigoSan") != null)
    { 
 
     int codigoSan = Integer.parseInt(request.getParameter("codigoSan"));
    
     
       CtrlCEFAS_Sancion ctrlAnticipo = new CtrlCEFAS_Sancion();
       ctrlAnticipo.eliminarSancion(codigoSan);
      
    }
    int codigoEmp = Integer.parseInt(request.getParameter("codigo"));
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(codigoEmp);

    CtrlCEFAS_Sancion ctrlSancion = new CtrlCEFAS_Sancion();
    List<CEFAS_Sancion> listSancion = ctrlSancion.getSancion(codigoEmp);
    
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sanciones del Empleado</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        <div id="container">
            <jsp:include page='inc/menu_directora.jsp' />
            <div class="container">
                <h1>Lista de Sanciones del Empleado</h1>
                <div class="panel panel-primary">
                          <div class="panel-heading">Sanciones del empleado: <%= empleado.getEmpNombre() %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Codigo Sancion</td>
                                            <td>Fecha</td> 
                                            <td>Sancion</td>
                                   
                                        </tr> 
                                     <%
                    for(CEFAS_Sancion scn: listSancion)
                    {
                %>  
                                        <tr>
                                            <td><%= scn.getScnCodigo()%></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(scn.getScnFecha())%></td>
                                            <td><%=scn.getScnSancion() %></td>
                                            <td><a href="sancionempleado.jsp?codigoSan=<%=scn.getScnCodigo()%>&codigo=<%=empleado.getEmpCodigo()%>" class="btn btn-primary btn-md" role="button">Eliminar Sancion</a></td>
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

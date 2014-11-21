<%-- 
    Document   : prestamoEmpleado
    Created on : 31-oct-2014, 9:44:09
    Author     : MARIA JUAREZ
--%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Prestamo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Prestamo"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_OrdenDeDescuento"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_OrdenDeDescuento"%>
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


    CtrlCEFAS_Prestamo ctrlPrestamo= new CtrlCEFAS_Prestamo();
    List<CEFAS_Prestamo> listaPrestamos = ctrlPrestamo.getPrestamos();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prestamos Institucionales</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de Préstamos</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Préstamos Otorgados</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Código de Préstamo</td>
                                            <td>Código Empleado</td> 
                                            <td>Fecha de Ingreso</td>
                                            <td>Monto</td> 
                                            <td>Plazos</td> 
                                            <td>Saldo</td> 
                                            <td>Cuota Mensual</td> 
                                            
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_Prestamo prestamo: listaPrestamos)
                    {
                %>  
                                        <tr>
                                            <td><%= prestamo.getPrmCodigo() %></td>
                                            <td> <%= prestamo.getEmpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(prestamo.getPrmFecha())%></td>
                                            
                                            <td>$ <%= String.format("%.2f", prestamo.getPrmMonto()) %></td>
                                            <td> <%= prestamo.getPrmPlazo() %></td>
                                            <td>$<%= String.format("%.2f", prestamo.getPrmSaldo()) %></td>
                                            <td>$ <%= String.format("%.2f", prestamo.getPrmCuota()) %></td>
                                            <td><a href="" class="btn btn-primary btn-md" role="button">Modificar Prestamo</a></td>
                                            <td><a href="" class="btn btn-primary btn-md" role="button">Eliminar Prestamo</a></td>
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

<%-- 
    Document   : ordenDescuentoEmpleado
    Created on : 31-oct-2014, 9:43:23
    Author     : MARIA JUAREZ
--%>
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


    CtrlCEFAS_OrdenDeDescuento ctrlOrden = new CtrlCEFAS_OrdenDeDescuento();
    List<CEFAS_OrdenDeDescuento> listaOrden = ctrlOrden.getOrdenesDeDescuento();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordenes de Descuento</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista Ordenes de Descuento</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Ordenes de descuento.</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Codigo de Orden</td>
                                            <td>Codigo Empleado</td> 
                                            <td>Fecha de Ingreso</td>
                                            <td>Monto</td> 
                                            <td>Plazos</td> 
                                            <td>Saldo</td> 
                                            <td>Cuota Mensual</td> 
                                            
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_OrdenDeDescuento orden: listaOrden)
                    {
                %>  
                                        <tr>
                                            <td><%= orden.getOddCodigo() %></td>
                                            <td> <%= orden.getEmpCodigo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(orden.getOddFecha())%></td>
                                            
                                            <td>$ <%= orden.getOddMonto() %></td>
                                            <td> <%= orden.getOddPlazo() %></td>
                                            <td>$<%= orden.getOddSaldo() %></td>
                                            <td>$ <%= orden.getOddCuota() %></td>
                                            <td><a href="" class="btn btn-primary btn-md" role="button">Modificar Orden</a></td>
                                            <td><a href="" class="btn btn-primary btn-md" role="button">Eliminar Eliminar</a></td>
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

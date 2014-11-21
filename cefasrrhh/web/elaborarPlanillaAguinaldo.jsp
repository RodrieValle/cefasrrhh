<%-- 
    Document   : elaborarPlanilla
    Created on : 12-nov-2014, 13:21:59
    Author     : MARIA JUAREZ
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_LineaDePlanilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_LineaDePlanilla"%>
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

 

    CtrlCEFAS_LineaDePlanilla ctrlLinea = new CtrlCEFAS_LineaDePlanilla();
    List<CEFAS_LineaDePlanilla> listaLinea = ctrlLinea.calculoPlanilla();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elaborar Planilla</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
        <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Planilla del mes</h1>
        
      
                      
                
        </div>
<div class="panel panel-primary">
                          <div class="panel-heading">Fecha: <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <th>Codigo de Empleado</th>
                                            <th>Sueldo Base</th> 
                                            <th>Horas Extras</th>
                                            <th>Ausencias</th>
                                            <th>Sueldo devengado</th>
                                            <th>ISSS</th>
                                            <th>AFP Confia</th>
                                            <th>AFP Crecer</th>
                                            <th>Valor sujeto a Renta</th>
                                            <th>Renta</th>
                                            <th>Anticipo</th>
                                            <th>Prestamo</th>
                                            <th>Orden de Descuento</th>
                                            <th>Viaticos</th>
                                            <th>Sueldo Neto</th>
                                            
                                           
                                        </tr> 
                                     <%
                    for(CEFAS_LineaDePlanilla linea: listaLinea)
                    {
                %>  
                                        <tr>
                                            <td><%= linea.getEmpCodigo() %> </td>
                                            <td>$<%= String.format("%.2f", linea.getLdpSueldoBase()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpHorasExtra()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAusenciasTardias()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpSueldoDevengado()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpIsss()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAfpConfia()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAfpCrecer()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpValorNetoSujetoRenta()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpImpuestoSobreRenta()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAnticipo()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAbonoPrestamo()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpOrdenDeDescuento()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpMontoViatico()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpLiquidoAPagar()) %></td>
                                            
                                        </tr>
                            <%
                          } %>  
                                    </tbody>
                                </table>

                        </div>
                      </div>
        </div>
    </body>
</html>

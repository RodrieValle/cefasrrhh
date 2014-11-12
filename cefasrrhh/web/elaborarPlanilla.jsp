<%-- 
    Document   : elaborarPlanilla
    Created on : 12-nov-2014, 13:21:59
    Author     : MARIA JUAREZ
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Planilla del mes</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Fecha:</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Codigo de Empleado</td>
                                            <td>Sueldo Base</td> 
                                            <td>Horas Extras</td>
                                            <td>Ausencias</td>
                                            <td>Sueldo devengado</td>
                                            <td>ISSS</td>
                                            <td>AFP Confia</td>
                                            <td>AFP Crecer</td>
                                            <td>Valor sujeto a Renta</td>
                                            <td>Renta</td>
                                            <td>Anticipo</td>
                                            <td>Prestamo</td>
                                            <td>Orden de Descuento</td>
                                            <td>Viaticos</td>
                                            <td>Sueldo Neto</td>
                                            
                                            <td></td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_LineaDePlanilla linea: listaLinea)
                    {
                %>  
                                        <tr>
                                            <td><%= linea.getEmpCodigo() %> </td>
                                            <td>$<%= linea.getLdpSueldoBase() %></td>
                                            <td>$ <%= linea.getLdpHorasExtra() %></td>
                                            <td>$ <%= linea.getLdpAusenciasTardias() %></td>
                                            <td>$ <%= linea.getLdpSueldoDevengado() %></td>
                                            <td>$ <%= linea.getLdpIsss() %></td>
                                            <td>$ <%= linea.getLdpAfpConfia() %></td>
                                            <td>$ <%= linea.getLdpAfpCrecer() %></td>
                                            <td>$ <%= linea.getLdpValorNetoSujetoRenta() %></td>
                                            <td>$ <%= linea.getLdpImpuestoSobreRenta() %></td>
                                            <td>$ <%= linea.getLdpAnticipo() %></td>
                                            <td>$ <%= linea.getLdpAbonoPrestamo() %></td>
                                            <td>$ <%= linea.getLdpOrdenDeDescuento() %></td>
                                            <td>$ <%= linea.getLdpMontoViatico() %></td>
                                            <td>$ <%= linea.getLdpLiquidoAPagar() %></td>
                                            
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

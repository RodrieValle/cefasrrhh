<%-- 
    Document   : prestamoEmpleado
    Created on : 31-oct-2014, 9:44:09
    Author     : MARIA JUAREZ
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla"%>
<%@page import="java.util.Date"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
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
 String mensaje="";
 HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("administrador")) {
        response.sendRedirect("avisos.jsp");
               }

    CtrlCEFAS_Planilla ctrlPlanilla= new CtrlCEFAS_Planilla();
    List<CEFAS_Planilla> listaPlanillas = ctrlPlanilla.getPlanillas();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de Planillas</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
      
     <%= mensaje%>
            
<div id="container">
<jsp:include page='inc/menu_administradora.jsp' />

            <div class="container">
        <h1>Lista de Planillas de Salarios</h1>
        
      
                      <div class="panel panel-primary">
                          <div class="panel-heading">Planillas de la Empresa</div>
                          
                  
                        <div class="panel-body">
                            
                            
                            
                             <table class="table table-striped table-hover">
                                    <tbody>
                                                  <tr>
                                            <td>Código de Planilla</td>
                                            <td>Tipo de Planilla</td> 
                                            <td>Fecha de Elaboracion</td>
                                            <td></td>
                                        </tr> 
                                     <%
                    for(CEFAS_Planilla planilla: listaPlanillas)
                    {
                %>  
                                        <tr>
                                            <td><%= planilla.getPlnCodigo() %></td>
                                            <td> <%= planilla.getPlnTipo() %></td>
                                            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(planilla.getPlnFecha())%></td>         
                                            <td><a href="planilla.jsp?idPlanilla=<%=planilla.getPlnCodigo() %>" target="_blank" class="btn btn-primary btn-md" role="button">Generar Reporte</a></td>
                                            
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

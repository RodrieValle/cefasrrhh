<%-- 
    Document   : elaborarPlanilla
    Created on : 12-nov-2014, 13:21:59
    Author     : MARIA JUAREZ
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Bitacora"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Planilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Planilla"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_LineaDePlanilla"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_LineaDePlanilla"%>
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

 

    CtrlCEFAS_LineaDePlanilla ctrlLinea = new CtrlCEFAS_LineaDePlanilla();
    List<CEFAS_LineaDePlanilla> listaLinea = ctrlLinea.calculoPlanillaAguinaldo();
    
    
    
     if(request.getParameter("codigoPlanilla") != null)
    { 
        int codigoPlanillaTipo = Integer.parseInt(request.getParameter("codigoPlanilla"));
    
        CtrlCEFAS_Planilla ctrlPlanilla = new CtrlCEFAS_Planilla();
        ctrlPlanilla.guardarPlanilla(codigoPlanillaTipo);
    CEFAS_Planilla planilla=ctrlPlanilla.getUltimaPlanilla();
        int resultado=0;
        int i, codigoPlanilla=planilla.getPlnCodigo();
         //mensaje="codigo planilla" +codigoPlanilla;
         for(i=0; i<listaLinea.size(); i++)
            {
               CEFAS_LineaDePlanilla linea=new CEFAS_LineaDePlanilla();
              linea=listaLinea.get(i);
        resultado=ctrlLinea.almacenarLineas(linea, codigoPlanilla);
               }
         
        if(resultado==1){
             mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Los datos de la planilla fueron guardados con exito</div>";
              CtrlCEFAS_Bitacora ctrlBitacora= new CtrlCEFAS_Bitacora();
        ctrlBitacora.guardarBitacora((Integer) sesionOk.getAttribute("codigo"), "Se calculo una planilla de tipo "+codigoPlanillaTipo);
             
        }else{
         mensaje = "<br><br><div class='alert alert-success' role='alert'><button type='button' class='close'"
                + " data-dismiss='alert'><span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
                + "Error al guardar la planilla</div>";
        }
        
        
}
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elaborar Planilla</title>
        <jsp:include page='inc/head_common.jsp' />
    </head>
    <body>
          <%= mensaje%>
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
                                            <th>Vacacion</th>
                                            <th>Aguinaldo</th>
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
                                            <td>$ <%= String.format("%.2f", linea.getLdpVacacion()) %></td>
                                            <td>$ <%= String.format("%.2f", linea.getLdpAguinaldo()) %></td>
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
 <br><br>
 <a href="elaborarPlanillaAguinaldo.jsp?codigoPlanilla=1" class="btn btn-primary btn-md" role="button">Guardar Planilla</a>
        </div>
    </body>
</html>

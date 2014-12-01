<%-- 
    Document   : planillaDelMes
    Created on : 22-nov-2014, 0:18:01
    Author     : MARIA JUAREZ
--%>

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
        <h1>Planilla del Mes</h1>
        
                        <div class="panel panel-primary">
                        <div class="panel-heading">Seleccione el Tipo de Planilla a Calcular</div>
                        <div class="panel-body">
        <br><br>
 <div class="row">
     <div class="col-xs-3"></div>
     <div class="col-xs-4">
         
         <a  href="elaborarPlanilla.jsp" class="btn btn-primary btn-md" role="button">Planilla de Mes Normal</a>
</div>
     
  <div class="col-xs-4">
<a  href="elaborarPlanillaAguinaldo.jsp" class="btn btn-primary btn-md" role="button">Planilla de Diciembre</a>
 </div>
 </div>
    <br><br>   
 </div>
</div>
 </div>
  </div>
 </body>
</html>

<%-- 
    Document   : gestionarevaluacioncandidato
    Created on : 29/11/2014, 08:19:25 PM
    Author     : Sergio
--%>
<%
    request.setCharacterEncoding("UTF-8");
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if (!tipo.equals("director")) {
        response.sendRedirect("avisos.jsp");
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adminastrar Evaluacion del Candidato - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
    <%  if(tipo.equals("director"))
            {
        %>
                <jsp:include page='inc/menu_directora.jsp' />
         <% }
            else if(tipo.equals("subdirector"))
            {
         %>
                <jsp:include page='inc/menu_subdirector.jsp' />
         <% } %>
         <div class="container">
	<h1>Opciones: </h1>
	<form action="gestionarevaluacioncandidato.jsp" method="post">
            
   <div class="panel panel-primary">
		<div class="panel-heading">Gestion de la Evaluacion</div>
		<div class="panel-body">
		<table class="table table-striped table-hover">
		<tbody>
                     
              
			<tr>
                                
                            <td> <a href="evaluarCandidato.jsp" class="btn btn-primary btn-md" role="button">Ingresar Evaluacion</a></td>
                            <td> <a href="" class="btn btn-primary btn-md" role="button">Ver Evaluacion</a></td>
                            <td> <a href="" class="btn btn-primary btn-md" role="button">Eliminar Evaluacion</a></td>
                                
                        </tr>
                </tbody>
                </table>
                            </div>
		</div>
			
		</div>
		</div>
        </form>
        </div>
        </div>
    </body>
</html>

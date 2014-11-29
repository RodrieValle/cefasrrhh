<%-- 
    Document   : gestionarcandidato
    Created on : 19/11/2014, 09:02:13 PM
    Author     : Sergio
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Candidato"%>
<%@page import="java.util.List"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Especialidad"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Especialidad"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    
    
    CtrlCEFAS_Candidato ctrlCandidato = new CtrlCEFAS_Candidato();
    List<CEFAS_Candidato> listaCandidato = ctrlCandidato.obtenerPorEspecialidad();
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Candidato - CEFAS RRHH</title>
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
	<h1>Listado de Candidatos</h1>
	<form action="gestionarcandidato.jsp" method="post">
                <div class="panel panel-primary">
		<div class="panel-heading">Zona de Busqueda</div>
		<div class="panel-body">
		<div class="row">
			<div class="col-xs-4 col-xs-offset-2">
                                <div class="input-group">
                                    <input type="text" name="dato" class="form-control input-sm" placeholder="Busqueda por especialidad">
                                    <span class="input-group-btn">
                                        <button class="btn btn-sm btn-success" type="submit">
                                            <span class="glyphicon glyphicon-search"></span> 
                                        </button>
                                    </span>
                                </div>
                            </div>
		</div>
			
		</div>
		</div>
		<div class="panel panel-primary">
		<div class="panel-heading">Candidatos</div>
		<div class="panel-body">
		<table class="table table-striped table-hover">
		<tbody>
                     
              
			<tr>
				<td>Nombre:</td>
				<td>Especialidad:</td>
				<td>Curriculum:</td>
				<td>Evaluacion:</td>
			</tr>
                       <% for(CEFAS_Candidato cdt: listaCandidato)
                                    {
                                    %>
			<tr>
				<td><%= cdt.getCdtNombre() %> </td>
				<td></td>
				<td><a href="" class="btn btn-primary btn-md" role="button">Ver Curriculum</a></td>
				<td><a href="evaluarCandidato.jsp" class="btn btn-primary btn-md" role="button">Ver Evaluacion</a></td>

			</tr>
                        <%
                                    } %>
		</tbody>
			
		</table>
		
			
		</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>

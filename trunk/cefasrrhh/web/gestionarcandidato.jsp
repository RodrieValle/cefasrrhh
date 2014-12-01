<%-- 
    Document   : gestionarcandidato
    Created on : 19/11/2014, 09:02:13 PM
    Author     : Sergio
--%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_EvaluacionCandidato"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
     if (request.getParameter("Dui") != null) {
        String dui = request.getParameter("Dui");
        String notaap = request.getParameter("naptitud");
        String comenll = request.getParameter("referencia");
        String comenen = request.getParameter("centrevista");
        String comenap = request.getParameter("captitud");
        String notapsi = request.getParameter("npsicologico");
        String comenpsi = request.getParameter("cpsicologico");
        Date fechaen = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fentrevista").toString());
        Date fechaex = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("faptitud").toString());
        Date fechapsi = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fpsicologico").toString());

        CtrlCEFAS_EvaluacionCandidato ctrlevccandidato = new CtrlCEFAS_EvaluacionCandidato();
        ctrlevccandidato.guardarEvaluacion(dui, comenll, fechaen, comenen, fechaex, Double.parseDouble(notaap), comenap, fechapsi,Double.parseDouble(notapsi), comenpsi);
    }
    
    CtrlCEFAS_Candidato ctrlCandidatos = new CtrlCEFAS_Candidato();
    List<CEFAS_Candidato> listaCandidatos;
    if(request.getParameter("criterio")!= null)
    {
        int criterio = Integer.parseInt(request.getParameter("criterio"));
        //String dato = request.getParameter("dato");
        listaCandidatos = ctrlCandidatos.obtenerCandidatos(criterio);
    }
    else
    {
        CtrlCEFAS_Candidato ctrlCandidato = new CtrlCEFAS_Candidato();
        listaCandidatos = ctrlCandidato.obtenerPorEspecialidad();
        
    
    }
    CtrlCEFAS_Especialidad ctrlEspecialidad = new CtrlCEFAS_Especialidad();
    List<CEFAS_Especialidad> especialidades =  ctrlEspecialidad.obtenerEspecialidad();
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Candidato - CEFAS RRHH</title>
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
		<div class="panel-heading">Zona de Búsqueda por especialidad</div>
		<div class="panel-body">
		<div class="row">
                            <div class="col-xs-4 col-xs-offset-4">
                                
                                <div class="input-group">
                                    <select name="criterio" id="criterio" class="form-control input-sm">
                                    <% 
                                        for(CEFAS_Especialidad e:especialidades)
                                        {  %>
                                        <option value="<%= e.getEspCodigo() %>"><%= e.getEspNombre() %></option>
                                    <%  }
                                    %>
                                </select>
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
                                <td>Evaluacion:</td>
			</tr>
                       <% for(CEFAS_Candidato cdt: listaCandidatos)
                                    {
                                    %>
			<tr>
				<td><%= cdt.getCdtNombre() %> </td>
				<td><%= cdt.getEspecialidad().getEspNombre() %></td>
				<td><a href="" class="btn btn-primary btn-md" role="button">Ver Curriculum</a></td>
                                <td><a href="evaluarCandidato.jsp?Dui=<%= cdt.getCdtDUI() %>" class="btn btn-primary btn-md" role="button"> Ingresar </a></td>
                                <td><a href="verevaluacion.jsp?Dui=<%= cdt.getCdtDUI() %>" class="btn btn-primary btn-md" role="button"> Ver </a></td>

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

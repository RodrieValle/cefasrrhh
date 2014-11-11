<%-- 
    Document   : ingresarcurriculum
    Created on : 10-26-2014, 10:26:35 PM
    Author     : ANIBAL
--%>

<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Candidato"%>
<%@page import="com.colegiocefas.cefasrrhh.dominio.CEFAS_Empleado"%>
<%@page import="com.colegiocefas.cefasrrhh.negocio.CtrlCEFAS_Empleado"%>
<%
    //Verificación de sesión abierta
    HttpSession sesionOk = request.getSession();
    String tipo = (String) sesionOk.getAttribute("tipo");
    if (tipo == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
    if(!(!tipo.equals("director") || !tipo.equals("asistente")))
    {
        response.sendRedirect("avisos.jsp");
    }
    String mensaje = "";
    if(request.getParameter("dui") != null)
    {
        String dui = request.getParameter("dui");
        String codigo = request.getParameter("codigoevc");
        String nombre = request.getParameter("nombre");
        String especialidad = request.getParameter("especialidad");
    
        
        CtrlCEFAS_Candidato ctrlcandidato = new CtrlCEFAS_Candidato();
        ctrlcandidato.guardarCurriculum(dui,codigo, nombre, especialidad);
        mensaje ="<div class='alert alert-success' role='alert'>Guardado</div>";
    }
    
    int usuario = Integer.parseInt(sesionOk.getAttribute("codigo").toString());
    CtrlCEFAS_Empleado ctrlEmpleado = new CtrlCEFAS_Empleado();
    CEFAS_Empleado empleado = ctrlEmpleado.getEmpleadoPorUsuario(usuario);
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Curriculum - CEFAS RRHH</title>
        <jsp:include page='inc/head_common.jsp' /> 
    </head>
    <body>
        <div id="container">
             <%  if(tipo.equals("director"))
             {
             %>
                    <jsp:include page='inc/menu_directora.jsp' />
             <% }
                else if(tipo.equals("empleado"))
                {
             %>
                    <jsp:include page='inc/menu_empleado.jsp' />
             <% }
                else if(tipo.equals("subdirector"))
                {
             %>
                    <jsp:include page='inc/menu_subdirector.jsp' />
             <% }
                else if(tipo.equals("asistente"))
                {
             %>
                    <jsp:include page='inc/menu_asistente.jsp' />
             <% }
                else if(tipo.equals("administrador"))
                {
             %>
                    <jsp:include page='inc/menu_administradora.jsp' />
             <% } %>
             <div class="container">
                 <h1>Ingresar Curriculum</h1>
                 <form action="ingresarcurriculum.jsp">
                         <div class="col-xs-4 col-xs-offset-4">
                             DUI: <input type="text" name="dui" class="form-control input-sm">
                             Codigo de Evaluacion: <input type="text" name="codigoevc" class="form-control input-sm">
                             Nombre: <input type="text" name="nombre" class="form-control input-sm">
                             Especialidad: <input type="text" name="especialidad" class="form-control input-sm">
                             
                             <p>
                                 <br><br>
                         <input type="submit" value="Guardar" class="btn btn-success center-block"/><br><br>          
                          </div>
                
                  
                     
             </form>
                 <%= mensaje %>
        </div><%-- fin del div id=container --%>
        
    </body>
</html>